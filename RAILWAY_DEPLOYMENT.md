# Railway Deployment Guide - IPTV Platform

This guide will help you deploy the IPTV platform to Railway with all necessary services.

## Prerequisites

1. **Railway Account**: Sign up at [railway.app](https://railway.app)
2. **GitHub Account**: For connecting your repository
3. **Supabase Account**: Already configured with your database
4. **Brevo Account**: For email sending
5. **NOWPayments Account**: For crypto payments

## Step 1: Prepare Your Repository

1. Push your code to GitHub (if not already done):
```bash
git init
git add .
git commit -m "Initial commit with code-based verification"
git branch -M main
git remote add origin https://github.com/YOUR_USERNAME/iptv-platform.git
git push -u origin main
```

## Step 2: Create Railway Project

1. Go to [railway.app/dashboard](https://railway.app/dashboard)
2. Click **"New Project"**
3. Select **"Deploy from GitHub"**
4. Connect your GitHub account if not already connected
5. Select your `iptv-platform` repository
6. Click **"Deploy Now"**

## Step 3: Configure Environment Variables

In the Railway dashboard, go to your project and add these environment variables:

### Supabase Configuration
```
SUPABASE_URL=https://your-project.supabase.co
SUPABASE_ANON_KEY=your-anon-key
SUPABASE_SERVICE_ROLE_KEY=your-service-role-key
```

### Database Configuration
```
DATABASE_URL=postgresql://postgres.your-project:your-password@aws-1-region.pooler.supabase.com:5432/postgres
```

### Email Configuration (Brevo)
```
BREVO_API_KEY=your-brevo-api-key
EMAIL_FROM=support@yourdomain.com
EMAIL_FROM_NAME=IPTV TOP
```

### NOWPayments Configuration
```
NOWPAYMENTS_API_KEY=your-nowpayments-api-key
NOWPAYMENTS_IPN_SECRET=your-ipn-secret
```

### Application Configuration
```
NODE_ENV=production
PORT=3000
VITE_APP_URL=https://your-railway-domain.up.railway.app
```

## Step 4: Configure Custom Domain (Optional)

1. In Railway project settings, go to **"Domains"**
2. Click **"Generate Domain"** or add your custom domain
3. If using custom domain:
   - Add CNAME record to your DNS provider pointing to Railway's domain
   - Update `VITE_APP_URL` environment variable

## Step 5: Database Setup

Railway will automatically run the build process. The database migrations will be applied during the build.

If you need to manually run migrations:
1. Go to Railway project
2. Click on your service
3. Go to **"Deployments"** tab
4. Click the latest deployment
5. In the logs, verify migrations ran successfully

## Step 6: Monitor Deployment

1. Check the **"Deployments"** tab for build status
2. View logs to ensure no errors
3. Once deployment is successful, your app will be live

## Step 7: Test the Application

1. Visit your Railway domain
2. Test registration flow:
   - Go to `/register`
   - Enter details
   - Check email for verification code
   - Enter code to verify
3. Test login flow
4. Test other features

## Environment Variables Reference

| Variable | Description | Example |
|----------|-------------|---------|
| `SUPABASE_URL` | Supabase project URL | `https://xkmpxjemlpvqsxscxbmk.supabase.co` |
| `SUPABASE_ANON_KEY` | Supabase anonymous key | `eyJhbGc...` |
| `SUPABASE_SERVICE_ROLE_KEY` | Supabase service role key | `eyJhbGc...` |
| `DATABASE_URL` | PostgreSQL connection string | `postgresql://...` |
| `BREVO_API_KEY` | Brevo API key for emails | `xkeysib-...` |
| `EMAIL_FROM` | Sender email address | `support@yourdomain.com` |
| `EMAIL_FROM_NAME` | Sender name in emails | `IPTV TOP` |
| `NOWPAYMENTS_API_KEY` | NOWPayments API key | `VPYQV68-...` |
| `NOWPAYMENTS_IPN_SECRET` | NOWPayments webhook secret | `z3EYczl...` |
| `NODE_ENV` | Environment | `production` |
| `PORT` | Server port | `3000` |
| `VITE_APP_URL` | Frontend URL | `https://your-domain.up.railway.app` |

## Troubleshooting

### Build Fails
- Check build logs in Railway dashboard
- Ensure all dependencies are in `package.json`
- Verify Node.js version compatibility (22.x)

### Database Connection Error
- Verify `DATABASE_URL` is correct
- Check if Supabase database is accessible
- Ensure firewall allows Railway IP (Supabase allows all by default)

### Email Not Sending
- Verify `BREVO_API_KEY` is correct
- Check `EMAIL_FROM` is a verified sender in Brevo
- Check application logs for email errors

### Application Crashes
- Check logs in Railway dashboard
- Verify all required environment variables are set
- Ensure database migrations completed successfully

## Scaling

Railway automatically scales your application. To adjust:
1. Go to project settings
2. Adjust CPU and RAM allocation
3. Configure auto-scaling if needed

## Monitoring

Railway provides built-in monitoring:
1. **Logs**: View real-time application logs
2. **Metrics**: CPU, memory, network usage
3. **Deployments**: History of all deployments
4. **Alerts**: Set up alerts for errors

## Rollback

To rollback to a previous deployment:
1. Go to **"Deployments"** tab
2. Click on a previous deployment
3. Click **"Redeploy"**

## Support

For Railway-specific issues, visit:
- [Railway Documentation](https://docs.railway.app)
- [Railway Community](https://railway.app/community)

For application-specific issues, check:
- Application logs in Railway dashboard
- `VERIFICATION_CHANGES.md` for authentication details
- Project README for setup instructions
