# 🚀 Deployment Guide

## Frontend Deployment (Vercel)

### Method 1: GitHub Integration (Recommended)

1. **Push to GitHub:**
   ```bash
   # Create a new repository on GitHub
   git init
   git add client/
   git commit -m "Initial frontend commit"
   git branch -M main
   git remote add origin https://github.com/yourusername/chat-frontend.git
   git push -u origin main
   ```

2. **Deploy via Vercel Dashboard:**
   - Go to [vercel.com](https://vercel.com)
   - Connect your GitHub account
   - Import your repository
   - Vercel will automatically detect it as a static site
   - Deploy!

### Method 2: Vercel CLI

1. **Install Vercel CLI:**
   ```bash
   npm install -g vercel
   ```

2. **Deploy:**
   ```bash
   cd client
   vercel
   ```

3. **Follow the prompts:**
   - Link to existing project? No
   - Project name: `anonymous-chat-frontend`
   - Directory: `./` (current directory)

## Backend Deployment (Railway)

### Method 1: GitHub Integration (Recommended)

1. **Push to GitHub:**
   ```bash
   # Create a new repository on GitHub
   git init
   git add server/
   git commit -m "Initial backend commit"
   git branch -M main
   git remote add origin https://github.com/yourusername/chat-backend.git
   git push -u origin main
   ```

2. **Deploy via Railway Dashboard:**
   - Go to [railway.app](https://railway.app)
   - Connect your GitHub account
   - Create new project from GitHub repo
   - Railway will automatically detect Node.js and deploy

### Method 2: Railway CLI

1. **Install Railway CLI:**
   ```bash
   npm install -g @railway/cli
   ```

2. **Login and deploy:**
   ```bash
   cd server
   railway login
   railway init
   railway up
   ```

## 🔧 Post-Deployment Configuration

### 1. Update Frontend Socket URL

After deploying your backend to Railway, you'll get a URL like:
`https://your-app-name-production-xxxx.up.railway.app`

Update `client/script.js`:
```javascript
const CONFIG = {
    SERVER_URL: 'https://your-railway-app.railway.app', // Replace with your Railway URL
    // ... rest of config
};
```

### 2. Update Backend CORS

In `server/server.js`, update the CORS origins:
```javascript
const corsOptions = {
  origin: [
    "http://localhost:3000",
    "http://localhost:5500", 
    "http://127.0.0.1:5500",
    "https://your-vercel-app.vercel.app" // Replace with your Vercel URL
  ],
  methods: ["GET", "POST"],
  credentials: true
};
```

### 3. Redeploy Both Services

After updating the URLs:
1. Redeploy frontend to Vercel
2. Redeploy backend to Railway

## 🧪 Testing Your Deployment

1. **Open your frontend URL** (Vercel deployment)
2. **Check connection status** - should show "Connected"
3. **Send a test message** - should appear in real-time
4. **Test with multiple browser tabs** - messages should sync across all tabs

## 🔍 Troubleshooting

### CORS Errors
- Ensure your Vercel URL is added to CORS origins in the backend
- Check that the Socket.io server URL in frontend matches your Railway deployment

### Connection Issues
- Verify your Railway app is running (check Railway dashboard)
- Check browser developer console for error messages
- Ensure firewall/network allows WebSocket connections

### Frontend Not Loading
- Check Vercel deployment logs
- Verify `vercel.json` configuration is correct
- Ensure all static files are properly uploaded

### Backend Not Starting
- Check Railway deployment logs
- Verify `package.json` scripts are correct
- Ensure all dependencies are listed in `package.json`

## 📊 Monitoring

### Railway (Backend)
- Check logs in Railway dashboard
- Monitor resource usage
- Set up health check endpoints

### Vercel (Frontend)
- Monitor deployment logs
- Check analytics for traffic
- Monitor Core Web Vitals

## 🔒 Security Considerations

- CORS is properly configured
- Helmet middleware provides security headers
- Message sanitization prevents XSS
- Rate limiting can be added for production use

## 💰 Cost Considerations

### Vercel (Frontend)
- Free tier: 100GB bandwidth/month
- Pro: $20/month for additional features

### Railway (Backend)
- Free tier: 500 hours/month
- Pro: $5/month + usage-based pricing

## 🚀 Scaling

For higher traffic:
- Consider adding Redis for session management
- Implement rate limiting
- Add load balancing for multiple server instances
- Consider using Railway's auto-scaling features
