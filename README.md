# 📱 Naman Sell Bot (@Namansellbot)
> **5SIM.net Direct Deal Virtual Number & OTP Store with Telegram Premium UI**

⚡ **Powered by 5SIM.net API** | 💰 **UPI Wallet: vinit-godara@fam**

---

## 🚀 1-Click VPS Deployment:
Run this single command on your Ubuntu/Debian/Linux VPS:
```bash
git clone https://github.com/vinitgodara453-collab/naman-sell-otp-bot.git && cd naman-sell-otp-bot && sudo bash deploy_naman_vps.sh
```

---

## ☁️ Heroku Deployment:

**Option 1 – One-click button:**

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy?template=https://github.com/vinitgodara453-collab/naman-sell-otp-bot)

Fill in `BOT_TOKEN`, `ADMIN_ID` and `FIVESIM_API_KEY`, then deploy.

**Option 2 – Heroku CLI script:**
```bash
bash deploy_heroku.sh my-app-name
```

**Option 3 – Manual:**
```bash
heroku create my-app-name
heroku config:set BOT_TOKEN=xxx ADMIN_ID=123456789 FIVESIM_API_KEY=xxx
git push heroku main
heroku ps:scale web=0 worker=1
heroku logs --tail
```

> ⚠️ Heroku's filesystem is **ephemeral**: the SQLite DB (wallets, deposits) is wiped on every dyno restart/deploy (at least once every 24h). For real money balances, move to Heroku Postgres or another persistent DB.

---

## 📱 Termux (Android Mobile) Setup:
```bash
pkg update -y && pkg install -y git python && git clone https://github.com/vinitgodara453-collab/naman-sell-otp-bot.git && cd naman-sell-otp-bot && pip install -r requirements.txt && bash run_naman_bot.sh
```

---

## 💎 Features:
- 🛒 **All Apps Available:** Telegram, WhatsApp, Instagram, Google, Facebook, Twitter, OpenAI, Amazon, Discord, etc.
- 🌍 **Multi-Country Support:** India 🇮🇳, Russia 🇷🇺, Indonesia 🇮🇩, USA 🇺🇸, UK 🇬🇧, Vietnam 🇻🇳, etc.
- ⚡ **Real-time OTP Listener:** Auto-polls every 3 seconds for instant OTP delivery!
- 🛡️ **100% Refund:** Cancel anytime within 15 minutes for a full refund if no OTP received.
- 💰 **Built-in UPI Wallet:** Easy recharge via QR code.
