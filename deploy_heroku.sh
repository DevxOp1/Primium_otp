#!/usr/bin/env bash
# ==============================================================================
# 📱 NAMAN SELL BOT - HEROKU DEPLOY SCRIPT
# Usage: bash deploy_heroku.sh [heroku-app-name]
# Requires: Heroku CLI (https://devcenter.heroku.com/articles/heroku-cli) + git
# ==============================================================================

set -e

APP_NAME="${1:-}"

command -v heroku >/dev/null 2>&1 || { echo "❌ Heroku CLI not found. Install it first: https://devcenter.heroku.com/articles/heroku-cli"; exit 1; }
command -v git >/dev/null 2>&1 || { echo "❌ git not found."; exit 1; }

echo "🔐 Checking Heroku login..."
heroku auth:whoami >/dev/null 2>&1 || heroku login

# Git repo
if [ ! -d .git ]; then
    git init -b main
fi

# Create / link Heroku app
if git remote get-url heroku >/dev/null 2>&1; then
    echo "✓ Heroku remote already exists, using it."
else
    echo "🚀 Creating Heroku app..."
    if [ -n "$APP_NAME" ]; then
        heroku create "$APP_NAME" --buildpack heroku/python
    else
        heroku create --buildpack heroku/python
    fi
fi

# Config vars (skipped if already set)
if [ -z "$(heroku config:get BOT_TOKEN 2>/dev/null)" ]; then
    read -r -p "👉 Telegram BOT_TOKEN: " BOT_TOKEN_INPUT
    read -r -p "👉 Telegram ADMIN_ID (numeric): " ADMIN_ID_INPUT
    read -r -s -p "👉 5SIM API key (hidden): " FIVESIM_INPUT; echo
    heroku config:set \
        BOT_TOKEN="$BOT_TOKEN_INPUT" \
        ADMIN_ID="$ADMIN_ID_INPUT" \
        FIVESIM_API_KEY="$FIVESIM_INPUT" \
        UPI_ID="vinit-godara@fam" \
        UPI_NAME="Vinit Godara" \
        DATABASE_PATH="naman_sell.db"
else
    echo "✓ Config vars already set, keeping them."
fi

echo "📦 Deploying..."
git add -A
git commit -m "Deploy to Heroku" 2>/dev/null || echo "(nothing new to commit)"
git push heroku HEAD:main

# Bot is a long-polling worker, not a web app
heroku ps:scale web=0 worker=1

echo "🎉 Done! Live logs:"
heroku logs --tail
