# Google OAuth Setup Guide

## Fixed Issues ✅

1. **Database Connection Issue**: Switched from Supabase (which was timing out) to local PostgreSQL database for reliable development
2. **Google OAuth Configuration**: Updated system to use environment variables for proper credential management

## Current Status

- ✅ Local PostgreSQL database is working
- ✅ Rails server running without connection errors  
- ✅ Google OAuth configuration updated
- ⚠️ Need real Google OAuth credentials

## Setup Real Google OAuth Credentials

### Step 1: Google Cloud Console Setup

1. Go to [Google Cloud Console](https://console.developers.google.com/)
2. Create a new project or select existing one
3. Enable the **Google+ API** or **Google Identity Services API**
4. Go to **Credentials** → **Create Credentials** → **OAuth 2.0 Client IDs**

### Step 2: Configure OAuth Client

**Application Type**: Web application
**Authorized JavaScript origins**: 
```
http://localhost:3000
```

**Authorized redirect URIs**:
```
http://localhost:3000/users/auth/google_oauth2/callback
```

### Step 3: Update Environment Variables

Replace the placeholder values in `.env` file:

```bash
# Replace YOUR_GOOGLE_CLIENT_ID_HERE with actual Client ID from Google Console
GOOGLE_CLIENT_ID=123456789-abcdefghijklmnop.apps.googleusercontent.com

# Replace YOUR_GOOGLE_CLIENT_SECRET_HERE with actual Client Secret from Google Console  
GOOGLE_CLIENT_SECRET=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45pqr
```

### Step 4: Restart Rails Server

After updating credentials:
```bash
# Kill current server (Ctrl+C)
# Then restart:
DISABLE_SPRING=1 bundle exec rails server -p 3000
```

## Current Configuration

- **Database**: Local PostgreSQL (`gumroad_development`)
- **Google OAuth**: Environment variable based configuration
- **Port**: 3000
- **SSL**: Disabled for local development

## Test the Setup

1. Visit `http://localhost:3000/signup`
2. Click on "Google" button  
3. Should redirect to Google OAuth flow
4. After authorization, should redirect back and create/login user

## Troubleshooting

If Google OAuth still doesn't work:

1. Check Rails logs for error messages
2. Verify redirect URI matches exactly in Google Console
3. Ensure Client ID and Secret are correct
4. Make sure Google+ API is enabled

## Production Deployment

For production, update:
1. `DATABASE_URL` to point to Supabase or production database
2. Add production domain to Google OAuth authorized origins
3. Use production environment variables