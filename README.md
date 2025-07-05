# Real-Time Room-Based Chat Application

A simple, room-based real-time chat application built with vanilla JavaScript frontend and Node.js backend using Socket.io.

## 🚀 Features

- **Room-Based Chat**: Users must enter a name and room ID to join specific chat rooms
- **Real-time Messaging**: Instant message delivery using WebSocket (Socket.io)
- **User Authentication**: Simple name-based identification (no password required)
- **Room Management**: Users can only see messages from their specific room
- **No Persistence**: Chat history disappears on page refresh (no database)
- **Responsive Design**: Mobile-friendly, clean UI
- **CORS Enabled**: Frontend and backend can be deployed separately

## 📁 Project Structure

```
Chat/
├── client/                 # Frontend (Vercel deployment)
│   ├── index.html
│   ├── style.css
│   ├── script.js
│   └── vercel.json
├── server/                 # Backend (Railway deployment)
│   ├── server.js
│   ├── package.json
│   └── railway.toml
└── README.md
```

## 🛠️ Local Development

### Prerequisites
- Node.js (v14 or higher)
- npm or yarn

### Running Locally

1. **Start the Backend Server:**
   ```bash
   cd server
   npm install
   npm start
   ```
   Server will run on `http://localhost:3000`

2. **Start the Frontend:**
   ```bash
   cd client
   # Open index.html in your browser or use Live Server extension in VS Code
   ```

3. **Update Frontend Configuration:**
   - In `client/script.js`, ensure the socket connection points to `http://localhost:3000` for local development

## 🌐 Deployment

### Frontend (Vercel)

1. **Prepare for deployment:**
   - Update the Socket.io server URL in `client/script.js` to your Railway backend URL
   - Ensure `vercel.json` is properly configured

2. **Deploy to Vercel:**
   ```bash
   cd client
   npm install -g vercel
   vercel
   ```

3. **Alternative: GitHub Integration**
   - Push the `client` folder to a GitHub repository
   - Connect your Vercel account to deploy automatically

### Backend (Railway)

1. **Prepare for deployment:**
   - Ensure `railway.toml` is configured
   - Update CORS origins in `server.js` to include your Vercel domain

2. **Deploy to Railway:**
   ```bash
   cd server
   npm install -g @railway/cli
   railway login
   railway init
   railway up
   ```

3. **Alternative: GitHub Integration**
   - Push the `server` folder to a GitHub repository
   - Connect your Railway account to deploy automatically

## 🔧 Configuration

### Environment Variables (Railway)
- `PORT`: Automatically set by Railway (default: 3000)

### CORS Configuration
Update the CORS origins in `server/server.js` to include your production frontend URL:

```javascript
const corsOptions = {
  origin: [
    "http://localhost:3000",
    "http://127.0.0.1:5500",
    "https://your-vercel-app.vercel.app"  // Add your Vercel URL here
  ],
  methods: ["GET", "POST"]
};
```

### Frontend Socket Connection
Update the socket connection in `client/script.js`:

```javascript
// For local development
const socket = io('http://localhost:3000');

// For production (replace with your Railway URL)
const socket = io('https://your-railway-app.railway.app');
```

## 📱 Usage

1. Open the chat application in your browser
2. Enter your name (up to 30 characters)
3. Enter a Room ID (up to 20 characters) - share this with others to chat together
4. Click "Join Room" to enter the chat
5. Type your message and send it
6. Messages appear in real-time for all users in the same room
7. Click the "Leave Room" button to exit and return to the login screen
8. Chat history is only visible to users in the same room and clears on page refresh

## 🎨 Customization

- **Styling**: Modify `client/style.css` for different themes
- **Features**: Add user nicknames, message timestamps, or typing indicators in the JavaScript files
- **Layout**: Adjust the responsive design in the CSS file

## 🔍 Troubleshooting

- **CORS Issues**: Ensure the backend CORS configuration includes your frontend domain
- **Connection Problems**: Check that the Socket.io server URL in the frontend matches your backend deployment
- **Local Development**: Make sure both frontend and backend are running on different ports

## 📄 License

This project is open source and available under the MIT License.
