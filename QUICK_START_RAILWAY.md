# Quick Start - Railway Deployment

## 5-Minute Setup

### 1. Push to GitHub
```bash
git init
git add .
git commit -m "IPTV Platform with code-based verification"
git branch -M main
git remote add origin https://github.com/YOUR_USERNAME/iptv-platform.git
git push -u origin main
```

### 2. Create Railway Project
- Go to [railway.app](https://railway.app)
- Click "New Project"
- Select "Deploy from GitHub"
- Choose your repository
- Click "Deploy Now"

### 3. Add Environment Variables
In Railway dashboard, add these variables:

```
# Supabase
SUPABASE_URL=https://xkmpxjemlpvqsxscxbmk.supabase.co
SUPABASE_ANON_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...
SUPABASE_SERVICE_ROLE_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...

# Database
DATABASE_URL=postgresql://postgres.xkmpxjemlpvqsxscxbmk:AJuIX91CBLIXaQKf@aws-1-ca-central-1.pooler.supabase.com:5432/postgres

# Email
BREVO_API_KEY=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
EMAIL_FROM=support@iptvtop.live
EMAIL_FROM_NAME=IPTV TOP

# Payments
NOWPAYMENTS_API_KEY=VPYQV68-7NA4NJ6-K0E7AC8-C8Y387N
NOWPAYMENTS_IPN_SECRET=z3EYczlCoMirPLXhuj9bG4S+dxlozzPd

# App
NODE_ENV=production
PORT=3000
```

### 4. Wait for Deployment
- Railway will automatically build and deploy
- Check logs to ensure success
- Your app will be live at `https://your-project.up.railway.app`

### 5. Test
- Visit your Railway domain
- Test registration → verification code flow
- Test login

## Done! 🚀

Your IPTV platform is now live on Railway with:
- ✅ Code-based email verification
- ✅ Supabase authentication
- ✅ Brevo email sending
- ✅ NOWPayments integration
- ✅ Auto-scaling
- ✅ Built-in monitoring

## Custom Domain (Optional)

1. Go to Railway project → Domains
2. Add your custom domain
3. Update DNS CNAME record
4. Update `VITE_APP_URL` environment variable

## Need Help?

- See `RAILWAY_DEPLOYMENT.md` for detailed guide
- Check Railway logs for errors
- Verify all environment variables are set correctly
