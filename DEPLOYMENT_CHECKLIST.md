# Railway Deployment Checklist

## Pre-Deployment

- [ ] All code committed and pushed to GitHub
- [ ] `.env` file is NOT committed (should be in `.gitignore`)
- [ ] `package.json` has all dependencies listed
- [ ] `pnpm-lock.yaml` is committed
- [ ] Dockerfile exists and is correct
- [ ] `railway.json` exists and is correct

## Supabase Setup

- [ ] Supabase project created
- [ ] Database URL obtained (Session Pooler for IPv4)
- [ ] Anon key copied
- [ ] Service role key copied
- [ ] Database tables created (run migrations locally first)

## Brevo Setup

- [ ] Brevo account created
- [ ] API key generated
- [ ] Sender email verified in Brevo
- [ ] Email templates created (optional but recommended)

## NOWPayments Setup

- [ ] NOWPayments account created
- [ ] API key generated
- [ ] IPN webhook secret generated
- [ ] IPN URL configured: `https://your-domain/api/webhooks/nowpayments`

## Railway Setup

- [ ] Railway account created
- [ ] GitHub connected to Railway
- [ ] New project created from GitHub repository

## Environment Variables in Railway

### Supabase
- [ ] `SUPABASE_URL` set correctly
- [ ] `SUPABASE_ANON_KEY` set correctly
- [ ] `SUPABASE_SERVICE_ROLE_KEY` set correctly

### Database
- [ ] `DATABASE_URL` set correctly (Session Pooler)
- [ ] Database connection tested

### Email
- [ ] `BREVO_API_KEY` set correctly
- [ ] `EMAIL_FROM` set to verified sender
- [ ] `EMAIL_FROM_NAME` set

### Payments
- [ ] `NOWPAYMENTS_API_KEY` set correctly
- [ ] `NOWPAYMENTS_IPN_SECRET` set correctly

### Application
- [ ] `NODE_ENV=production`
- [ ] `PORT=3000`
- [ ] `VITE_APP_URL` set to Railway domain or custom domain

## Deployment

- [ ] Initial deployment triggered
- [ ] Build logs checked for errors
- [ ] Build completed successfully
- [ ] Application started successfully
- [ ] No errors in runtime logs

## Post-Deployment Testing

### Registration Flow
- [ ] Navigate to `/register`
- [ ] Fill in test user details
- [ ] Receive verification email
- [ ] Code appears in email
- [ ] Enter code on verification page
- [ ] Account verified successfully
- [ ] Redirected to dashboard

### Login Flow
- [ ] Navigate to `/login`
- [ ] Login with verified account
- [ ] Successfully logged in
- [ ] Redirected to dashboard

### Unverified User Login
- [ ] Create new account but don't verify
- [ ] Try to login
- [ ] Receive error about unverified email
- [ ] New verification code sent
- [ ] Can verify and login

### Email Functionality
- [ ] Verification emails received
- [ ] Emails formatted correctly
- [ ] Code clearly visible
- [ ] Links work (if any)

### Payment Integration (if testing)
- [ ] Create test order
- [ ] NOWPayments invoice created
- [ ] Invoice URL works
- [ ] Payment status updates

## Custom Domain (Optional)

- [ ] Custom domain purchased
- [ ] DNS CNAME record added
- [ ] Railway recognizes custom domain
- [ ] SSL certificate auto-generated
- [ ] `VITE_APP_URL` updated
- [ ] Domain accessible via HTTPS

## Monitoring & Maintenance

- [ ] Railway dashboard bookmarked
- [ ] Logs checked regularly
- [ ] Alerts configured (if available)
- [ ] Backups configured (if available)
- [ ] Deployment rollback tested (optional)

## Security

- [ ] No sensitive data in logs
- [ ] Environment variables not exposed
- [ ] HTTPS enforced
- [ ] CORS configured correctly
- [ ] Rate limiting considered

## Performance

- [ ] Application loads quickly
- [ ] Database queries optimized
- [ ] Images optimized
- [ ] Bundle size acceptable
- [ ] No memory leaks in logs

## Documentation

- [ ] README updated with deployment info
- [ ] RAILWAY_DEPLOYMENT.md reviewed
- [ ] QUICK_START_RAILWAY.md reviewed
- [ ] Team members have access to credentials (securely)
- [ ] Runbook created for common issues

## Go Live

- [ ] All tests passed
- [ ] Performance acceptable
- [ ] Monitoring in place
- [ ] Team trained on deployment
- [ ] Rollback plan documented
- [ ] ✅ Ready for production!

## Post-Launch

- [ ] Monitor for errors in first 24 hours
- [ ] Check email delivery rates
- [ ] Monitor database performance
- [ ] Check user registrations
- [ ] Verify payment processing
- [ ] Collect user feedback
