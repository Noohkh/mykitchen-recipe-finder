# 🍳 MyKitchen - Recipe Finder Mobile App

[![Build Android APK](https://github.com/yourusername/mykitchen-recipe-finder/actions/workflows/build-android.yml/badge.svg)](https://github.com/yourusername/mykitchen-recipe-finder/actions/workflows/build-android.yml)

A modern, mobile-first recipe finder application built with Cordova, Firebase, and vanilla JavaScript. Discover thousands of delicious recipes from around the world with a clean, native app experience.

## ✨ Features

### 🔐 **Authentication**
- Firebase Authentication integration
- Secure user registration and login
- Persistent sessions
- Password visibility toggle

### 🍽️ **Recipe Discovery**
- Search recipes by name, ingredient, or cuisine
- Browse multiple categories (Indian, Italian, Mexican, Chinese, etc.)
- View detailed recipe instructions
- External recipe source links

### 📱 **Mobile Experience**
- Fully responsive design optimized for mobile
- Native Android app with Cordova
- Clean interface without banner ads
- Interstitial ads for monetization

### 🎨 **User Interface**
- Modern, intuitive design
- Mobile-first responsive layout
- SEO optimized with structured data
- Accessibility features

## 🚀 GitHub Deployment (Recommended)

**No local Android setup required!** Build your APK directly from GitHub:

1. **Fork this repository**
2. **Clone to your local machine:**
   ```bash
   git clone https://github.com/yourusername/mykitchen-recipe-finder.git
   cd mykitchen-recipe-finder
   ```
3. **Run the setup script:**
   ```cmd
   setup-github.bat
   ```
4. **Push to GitHub - APK builds automatically!**
5. **Download APK from GitHub Actions artifacts**

See [GITHUB_DEPLOYMENT_GUIDE.md](GITHUB_DEPLOYMENT_GUIDE.md) for detailed instructions.

## 🛠 Technology Stack

### Frontend:
- HTML5, CSS3, JavaScript (ES6+)
- Firebase Authentication
- Google AdMob Integration
- Responsive Design
- PWA Features

### Backend:
- Node.js
- Express.js
- TheMealDB API Integration
- CORS Support
- RESTful Architecture

### Mobile:
- Apache Cordova/PhoneGap
- Cross-platform deployment
- Native plugin integration
- App store optimization

## 📦 Installation & Setup

### 1. Clone Repository
```bash
git clone https://github.com/yourusername/recipe-finder.git
cd recipe-finder
```

### 2. Install Dependencies
```bash
npm install
```

### 3. Backend Setup
```bash
cd backend
npm install
npm start
```

### 4. Mobile App Build
```bash
# Install Cordova globally
npm install -g cordova

# Add platforms
cordova platform add android
cordova platform add ios

# Build app
cordova build android
```

## 📱 Run the App

### Browser Testing:
```bash
# Open frontend/index.html in browser
# Or use Cordova serve
cordova serve
```

### Mobile Device:
```bash
# Android
cordova run android

# iOS (Mac only)
cordova run ios
```

## 🔧 Configuration

### Firebase Setup:
1. Create Firebase project
2. Enable Authentication
3. Update config in `frontend/index.html`

### AdMob Setup:
1. Create AdMob account
2. Generate ad unit IDs
3. Replace placeholder IDs in HTML

## 📁 Project Structure

```
recipe-finder/
├── frontend/
│   └── index.html          # Main app file
├── backend/
│   ├── server.js           # Express server
│   └── package.json        # Backend dependencies
├── config.xml              # Cordova configuration
├── package.json            # Mobile app dependencies
└── MOBILE_SETUP.md         # Detailed setup guide
```

## 🚀 Features Roadmap

- [ ] Offline recipe storage
- [ ] Shopping list generation
- [ ] Recipe ratings and reviews
- [ ] Social sharing
- [ ] Recipe collections/favorites
- [ ] Push notifications
- [ ] Camera integration for photos
- [ ] Voice search
- [ ] Meal planning
- [ ] Nutritional information

## 📱 App Store Information

### App Details:
- **Name**: MyKitchen Recipe Finder
- **Bundle ID**: com.mykitchen.recipefinder
- **Version**: 1.0.0
- **Category**: Food & Drink
- **Age Rating**: 4+

### Requirements:
- **Android**: API level 19+ (Android 4.4+)
- **iOS**: iOS 11.0+
- **Storage**: 50MB
- **Network**: Required for recipe search

## 🤝 Contributing

1. Fork the repository
2. Create feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit changes (`git commit -m 'Add AmazingFeature'`)
4. Push to branch (`git push origin feature/AmazingFeature`)
5. Open Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 📞 Support

For support and questions:
- Email: support@mykitchen.com
- Issues: GitHub Issues
- Documentation: [MOBILE_SETUP.md](MOBILE_SETUP.md)

---

Made with ❤️ by MyKitchen Team