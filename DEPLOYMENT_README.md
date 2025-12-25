# IPTV Platform - Railway Deployment Package

This package contains everything you need to deploy your IPTV platform to Railway with code-based email verification.

## 📦 What's Included

### Core Application
- **client/** - React frontend with Vite
- **server/** - Express backend with tRPC
- **shared/** - Shared types and utilities
- **drizzle/** - Database schema and migrations

### Configuration Files
- **Dockerfile** - Docker container configuration for Railway
- **railway.json** - Railway-specific configuration
- **.railwayignore** - Files to exclude from deployment
- **package.json** - Dependencies and scripts
- **vite.config.ts** - Vite build configuration
- **drizzle.config.ts** - Database configuration

### Documentation
- **QUICK_START_RAILWAY.md** - 5-minute setup guide (START HERE!)
- **RAILWAY_DEPLOYMENT.md** - Detailed deployment guide
- **DEPLOYMENT_CHECKLIST.md** - Pre-deployment checklist
- **VERIFICATION_CHANGES.md** - Authentication system changes
- **.env.example** - Environment variable template

## 🚀 Quick Start (5 Minutes)

### Step 1: Push to GitHub
```bash
git init
git add .
git commit -m "IPTV Platform deployment"
git branch -M main
git remote add origin https://github.com/YOUR_USERNAME/iptv-platform.git
git push -u origin main
```

### Step 2: Create Railway Project
1. Go to [railway.app](https://railway.app)
2. Click "New Project"
3. Select "Deploy from GitHub"
4. Choose your repository
5. Click "Deploy Now"

### Step 3: Configure Environment Variables
Copy all variables from `.env.example` and add them to Railway dashboard:
- Supabase credentials
- Database URL
- Brevo API key
- NOWPayments credentials
- Application settings

### Step 4: Deploy
Railway will automatically build and deploy. Check logs for success.

### Step 5: Test
Visit your Railway domain and test the registration flow.

## 📋 Key Features

### Code-Based Email Verification
- Users receive 6-digit codes instead of clicking links
- Codes expire after 10 minutes
- Resend functionality with 60-second cooldown
- Beautiful email templates

### Supabase Integration
- PostgreSQL database
- Built-in authentication
- Real-time capabilities
- Automatic backups

### Payment Processing
- NOWPayments crypto payment integration
- Manual payment option
- Order management system
- Credential distribution

### Email Service
- Brevo integration for reliable delivery
- Professional email templates
- Verification codes, password resets, confirmations
- Tracking and analytics

## 🔧 Technology Stack

| Component | Technology |
|-----------|-----------|
| Frontend | React 18 + Vite + TypeScript |
| Backend | Express + tRPC + TypeScript |
| Database | PostgreSQL (Supabase) |
| ORM | Drizzle ORM |
| Styling | Tailwind CSS |
| UI Components | shadcn/ui |
| Email | Brevo API |
| Payments | NOWPayments API |
| Deployment | Railway |

## 📚 Documentation Files

**Start with:** `QUICK_START_RAILWAY.md` for immediate deployment

**Then read:** `RAILWAY_DEPLOYMENT.md` for detailed setup and troubleshooting

**Reference:** `DEPLOYMENT_CHECKLIST.md` to ensure nothing is missed

**Learn about:** `VERIFICATION_CHANGES.md` for authentication details

## 🔐 Security Considerations

- All sensitive data stored in environment variables
- No credentials in code or version control
- HTTPS enforced by Railway
- Database uses Supabase's security features
- Email verification prevents spam registrations
- Rate limiting on resend functionality

## 🛠️ Environment Variables

Required variables (copy from `.env.example`):

```
SUPABASE_URL
SUPABASE_ANON_KEY
SUPABASE_SERVICE_ROLE_KEY
DATABASE_URL
BREVO_API_KEY
EMAIL_FROM
EMAIL_FROM_NAME
NOWPAYMENTS_API_KEY
NOWPAYMENTS_IPN_SECRET
NODE_ENV
PORT
VITE_APP_URL
```

## 📊 Project Structure

```
iptv-platform/
├── client/                 # React frontend
│   └── src/
│       ├── pages/         # Page components
│       ├── components/    # Reusable components
│       └── lib/          # Utilities
├── server/                # Express backend
│   ├── routers.ts        # tRPC routes
│   ├── db.ts             # Database queries
│   ├── email.ts          # Email service
│   └── nowpayments.ts    # Payment integration
├── shared/               # Shared types
├── drizzle/              # Database schema
└── Configuration files
```

## 🚨 Troubleshooting

### Build Fails
- Check Node.js version (22.x required)
- Verify all dependencies in `package.json`
- Review build logs in Railway dashboard

### Database Connection Error
- Verify `DATABASE_URL` format
- Check Supabase database is accessible
- Ensure Session Pooler is used for IPv4

### Emails Not Sending
- Verify `BREVO_API_KEY` is correct
- Check `EMAIL_FROM` is verified in Brevo
- Review application logs for errors

### Application Crashes
- Check all environment variables are set
- Review logs in Railway dashboard
- Verify database migrations completed

See `RAILWAY_DEPLOYMENT.md` for detailed troubleshooting.

## 📞 Support Resources

- **Railway Docs:** https://docs.railway.app
- **Railway Community:** https://railway.app/community
- **Supabase Docs:** https://supabase.com/docs
- **Brevo Docs:** https://developers.brevo.com
- **NOWPayments Docs:** https://nowpayments.io/docs

## 🎯 Next Steps

1. **Read** `QUICK_START_RAILWAY.md` (5 minutes)
2. **Prepare** your GitHub repository
3. **Gather** all API credentials
4. **Deploy** to Railway
5. **Test** the application
6. **Monitor** in Railway dashboard

## ✅ Deployment Checklist

Use `DEPLOYMENT_CHECKLIST.md` to ensure you haven't missed anything before going live.

## 📝 Notes

- This package includes all necessary files for Railway deployment
- No additional configuration needed beyond environment variables
- Automatic SSL/HTTPS provided by Railway
- Auto-scaling enabled by default
- Logs and monitoring available in Railway dashboard

## 🎉 You're Ready!

Your IPTV platform is ready to deploy. Follow the quick start guide and you'll be live in minutes!

Questions? Check the documentation files or Railway's community support.

Happy deploying! 🚀
