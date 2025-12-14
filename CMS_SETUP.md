# Decap CMS Setup Guide

This guide explains how to set up Decap CMS for your blog. The CMS files are already added to the project - you just need to configure authentication.

## Overview

- **CMS Admin Panel:** `/admin/`
- **Authentication:** GitHub OAuth via Vercel serverless function
- **How it works:** Edit blog posts through a web UI, changes commit directly to your GitHub repo

## Setup Steps

### Step 1: Create GitHub OAuth App

1. Go to [GitHub Developer Settings](https://github.com/settings/developers)
2. Click **"OAuth Apps"** → **"New OAuth App"**
3. Fill in the form:
   | Field | Value |
   |-------|-------|
   | Application name | `CV Blog CMS` (or any name) |
   | Homepage URL | `https://your-site.com` |
   | Authorization callback URL | `https://your-oauth-app.vercel.app/callback` |
4. Click **"Register application"**
5. Copy the **Client ID**
6. Click **"Generate a new client secret"** and copy the **Client Secret**

> Keep these credentials safe - you'll need them in Step 3.

### Step 2: Fork & Deploy OAuth Server to Vercel

1. Go to [daresaydigital/decap-cms-oauth](https://github.com/daresaydigital/decap-cms-oauth)
2. Click **"Fork"** to copy it to your GitHub account
3. Go to [vercel.com](https://vercel.com) and sign in with GitHub
4. Click **"Add New"** → **"Project"**
5. Select your forked `decap-cms-oauth` repo
6. **Before deploying**, add Environment Variables:
   | Name | Value |
   |------|-------|
   | `OAUTH_GITHUB_CLIENT_ID` | Your Client ID from Step 1 |
   | `OAUTH_GITHUB_CLIENT_SECRET` | Your Client Secret from Step 1 |
7. Click **"Deploy"**
8. Once deployed, note your Vercel app URL (e.g., `https://decap-cms-oauth-yourusername.vercel.app`)

### Step 3: Update GitHub OAuth Callback URL

1. Go back to [GitHub OAuth Apps](https://github.com/settings/developers)
2. Click on your OAuth App
3. Update **Authorization callback URL** to:
   ```
   https://your-vercel-app.vercel.app/callback
   ```
   (Use your actual Vercel URL from Step 2)
4. Click **"Update application"**

### Step 4: Update CMS Config

Edit `public/admin/config.yml` in your project:

```yaml
backend:
  name: github
  repo: damarowen/cv-astro
  branch: main
  base_url: https://your-vercel-app.vercel.app  # ← Replace with your Vercel URL
```

### Step 5: Deploy Your Site

Deploy your site with the updated config. The CMS will be available at `/admin/`.

## Using the CMS

1. Navigate to `https://your-site.com/admin/`
2. Click **"Login with GitHub"**
3. Authorize the OAuth app (first time only)
4. You'll see the CMS dashboard with your blog posts

### Creating a New Post

1. Click **"Blog Posts"** → **"New Blog Post"**
2. Fill in the fields:
   - **Title:** Post title
   - **Description:** Short description for SEO
   - **Publish Date:** Format `MMM DD YYYY` (e.g., `Dec 14 2024`)
   - **Hero Image URL:** Cloudinary or other image URL (optional)
   - **Badge:** Label like "New" or "Featured" (optional)
   - **Content:** Write your post in Markdown
3. Click **"Publish"** (or save as draft with Editorial Workflow)

### Editorial Workflow

The CMS uses editorial workflow with three states:
- **Draft:** Work in progress
- **In Review:** Ready for review
- **Ready:** Approved and ready to publish

## Troubleshooting

### "Failed to load config"
- Check that `public/admin/config.yml` exists and has correct YAML syntax

### "Authentication failed"
- Verify your Vercel OAuth app is running
- Check that `base_url` in config.yml matches your Vercel app URL
- Ensure GitHub OAuth callback URL ends with `/callback`

### "Repository not found"
- Verify the `repo` field in config.yml matches your GitHub repo exactly
- Ensure your GitHub account has access to the repository

## File Structure

```
public/
└── admin/
    ├── index.html    # CMS entry point
    └── config.yml    # CMS configuration
```

## Resources

- [Decap CMS Documentation](https://decapcms.org/docs/)
- [GitHub OAuth Apps](https://docs.github.com/en/developers/apps/building-oauth-apps)
- [daresaydigital/decap-cms-oauth](https://github.com/daresaydigital/decap-cms-oauth)
