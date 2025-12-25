# IPTV Platform - Code-Based Email Verification

## Overview

This update changes the email verification system from link-based verification to code-based verification. Users now receive a 6-digit code via email and enter it on a verification page to activate their account.

## Changes Made

### 1. Database Schema (`drizzle/schema.ts`)

Added two new fields to the `users` table:
- `verificationCode`: Stores the 6-digit verification code
- `verificationCodeExpiry`: Stores the expiration timestamp (10 minutes from generation)

### 2. Backend API (`server/routers.ts`)

#### New Endpoints:
- **`localAuth.verifyCode`**: Verifies the 6-digit code entered by the user
  - Input: `{ email: string, code: string }`
  - On success: Marks email as verified and logs user in automatically

- **`localAuth.resendCode`**: Generates and sends a new verification code
  - Input: `{ email: string }`
  - Generates a new 6-digit code with 10-minute expiry

#### Modified Endpoints:
- **`localAuth.register`**: Now generates and sends a 6-digit code instead of a verification link
- **`localAuth.login`**: If user's email is not verified, generates a new code and redirects to verification

### 3. Database Functions (`server/db.ts`)

Added new functions:
- `getUserByEmailAndVerificationCode(email, code)`: Finds user by email and verification code
- `setUserVerificationCode(userId, code, expiryMinutes)`: Sets verification code with expiry

### 4. Email Service (`server/email.ts`)

Added new function:
- `sendVerificationCodeEmail(email, code, name?)`: Sends a beautifully formatted email with the 6-digit code

### 5. Frontend Components

#### New Page: `client/src/pages/VerifyCode.tsx`
- 6-digit code input with individual boxes
- Auto-focus and auto-advance between inputs
- Paste support for the full code
- Auto-submit when all digits are entered
- Resend code button with 60-second cooldown
- Success animation and auto-redirect to dashboard

#### Updated Pages:
- **`Register.tsx`**: Redirects to `/verify-code?email=...` after registration
- **`Login.tsx`**: Redirects to verification page if email not verified
- **`App.tsx`**: Added route for `/verify-code`

## Environment Variables

Make sure these are set in your `.env` file:

```env
# Supabase Configuration
SUPABASE_URL=https://your-project.supabase.co
SUPABASE_ANON_KEY=your-anon-key
SUPABASE_SERVICE_ROLE_KEY=your-service-role-key

# Database
DATABASE_URL=postgresql://postgres.your-project:password@aws-1-region.pooler.supabase.com:5432/postgres

# Email (Brevo)
BREVO_API_KEY=your-brevo-api-key
EMAIL_FROM=support@yourdomain.com
EMAIL_FROM_NAME=IPTV TOP

# NOWPayments
NOWPAYMENTS_API_KEY=your-nowpayments-api-key
NOWPAYMENTS_IPN_SECRET=your-ipn-secret
```

## User Flow

1. **Registration**:
   - User fills in name, email, password
   - System generates 6-digit code and sends email
   - User is redirected to `/verify-code?email=...`

2. **Verification**:
   - User enters the 6-digit code from email
   - Code is validated (must match and not be expired)
   - On success, user is automatically logged in and redirected to dashboard

3. **Login (unverified user)**:
   - If user tries to login without verified email
   - System generates new code and sends email
   - User is redirected to verification page

4. **Resend Code**:
   - User can request a new code (60-second cooldown)
   - New code replaces old one with fresh 10-minute expiry

## Email Template

The verification email includes:
- IPTV TOP branding
- Large, easy-to-read 6-digit code
- 10-minute expiry notice
- Professional styling

## Security Features

- Codes expire after 10 minutes
- New registration overwrites unverified accounts
- Rate limiting via 60-second cooldown on resend
- Codes are cleared after successful verification
- No email enumeration (same response for existing/non-existing emails on resend)

## Running the Project

```bash
# Install dependencies
pnpm install

# Push database schema
pnpm drizzle-kit push

# Start development server
pnpm dev
```

## Database Migration

If you have an existing database, run:
```bash
pnpm drizzle-kit push
```

This will add the new `verification_code` and `verification_code_expiry` columns to the users table.
