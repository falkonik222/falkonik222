# SwiftQuest Setup Guide - Running on Your iPhone 17

This guide will walk you through getting SwiftQuest running on your iPhone 17.

## Prerequisites

Before you begin, make sure you have:

- ✅ A Mac computer (MacBook, iMac, Mac Mini, or Mac Studio)
- ✅ macOS 13.0 (Ventura) or later
- ✅ Xcode 15.0 or later (free from the Mac App Store)
- ✅ Your iPhone 17
- ✅ A USB-C cable to connect your iPhone to your Mac
- ✅ Git installed on your Mac (comes pre-installed on most Macs)

## Step 1: Install Xcode (if not already installed)

1. Open the **App Store** on your Mac
2. Search for **"Xcode"**
3. Click **"Get"** or **"Install"** (it's free but large, ~10-15 GB)
4. Wait for installation to complete (may take 20-60 minutes depending on your internet speed)
5. Open Xcode once to accept the license agreement and install additional components

## Step 2: Clone the Repository to Your Mac

### Option A: Using Terminal (Recommended)

1. Open **Terminal** (find it in Applications > Utilities)
2. Navigate to where you want to save the project:
   ```bash
   cd ~/Documents
   ```
3. Clone the repository:
   ```bash
   git clone <YOUR_REPOSITORY_URL>
   ```
   (Replace `<YOUR_REPOSITORY_URL>` with your actual repository URL)
4. Navigate into the project:
   ```bash
   cd falkonik222
   ```
5. Switch to the correct branch:
   ```bash
   git checkout claude/swift-learning-game-Og8LC
   ```

### Option B: Using GitHub Desktop

1. Download **GitHub Desktop** from https://desktop.github.com
2. Install and open GitHub Desktop
3. Click **"Clone a Repository"**
4. Enter your repository URL and choose where to save it
5. Switch to the branch `claude/swift-learning-game-Og8LC`

## Step 3: Open the Project in Xcode

1. Navigate to the cloned folder in Finder
2. Look for the file **`SwiftQuest.xcodeproj`** (has a blue Xcode icon)
3. **Double-click** `SwiftQuest.xcodeproj` to open it in Xcode

   OR

   Right-click the file and select **"Open With" > "Xcode"**

## Step 4: Configure Your iPhone for Development

### First-Time Setup

1. **Connect your iPhone 17** to your Mac using a USB-C cable
2. **Unlock your iPhone**
3. If a prompt appears on your iPhone asking **"Trust This Computer?"**, tap **"Trust"**
4. Enter your iPhone passcode if requested

### Enable Developer Mode on iPhone (iOS 16+)

1. On your iPhone, go to **Settings > Privacy & Security**
2. Scroll down and tap **"Developer Mode"**
3. Toggle it **ON**
4. Restart your iPhone when prompted
5. After restart, confirm you want to enable Developer Mode

## Step 5: Select Your iPhone in Xcode

1. In Xcode, look at the top toolbar
2. Find the device selector (next to the Play/Stop buttons)
3. Click on it and you should see your iPhone 17 listed
4. Select your **iPhone 17** from the list

## Step 6: Configure Code Signing

1. In Xcode, click on **"SwiftQuest"** in the left sidebar (the blue project icon at the top)
2. Make sure **"SwiftQuest"** is selected under TARGETS
3. Click the **"Signing & Capabilities"** tab
4. Under **"Team"**, you have two options:

### Option A: Use Your Apple ID (Free - Recommended)

1. Click the **"Team"** dropdown
2. Select **"Add an Account..."**
3. Sign in with your Apple ID (the one you use for iCloud/App Store)
4. After signing in, select your Apple ID from the Team dropdown
5. Xcode will automatically manage signing for you

**Note:** Free accounts have a 7-day certificate limit. The app will stop working after 7 days and you'll need to rebuild and reinstall it.

### Option B: Use Apple Developer Program ($99/year)

If you have a paid Apple Developer account:
1. Select your team from the dropdown
2. Your app will be signed with your developer certificate

## Step 7: Build and Run on Your iPhone

1. Make sure your **iPhone is selected** as the target device
2. Click the **Play button** (▶️) in the top-left corner of Xcode

   OR

   Press **⌘ + R** on your keyboard

3. Xcode will:
   - Build the project (may take 1-2 minutes the first time)
   - Install the app on your iPhone
   - Launch the app automatically

## Step 8: Trust the Developer Certificate (First Time Only)

If this is your first time running an app from this Apple ID on your iPhone:

1. On your iPhone, you'll see an alert: **"Untrusted Developer"**
2. Go to **Settings > General > VPN & Device Management** (or **Device Management**)
3. Find your Apple ID under **"Developer App"**
4. Tap on it
5. Tap **"Trust [Your Apple ID]"**
6. Confirm by tapping **"Trust"**
7. Return to the home screen and launch **SwiftQuest**

## Step 9: Play SwiftQuest!

🎉 **Congratulations!** SwiftQuest should now be running on your iPhone 17.

- Tap **"Start Learning"** to begin
- Answer Swift programming questions
- Earn points and track your progress
- Try to get 100%!

## Running on iOS Simulator Instead

If you want to test without using your physical iPhone:

1. In Xcode's device selector, choose any **iPhone simulator** (e.g., "iPhone 15 Pro")
2. Click the **Play button** (▶️)
3. The iOS Simulator will open and run the app

**Note:** Simulators are slower but don't require a physical device or developer certificates.

## Troubleshooting

### "Failed to prepare device for development"
- **Solution:** Disconnect and reconnect your iPhone, make sure it's unlocked

### "Code signing is required"
- **Solution:** Follow Step 6 to add your Apple ID in Signing & Capabilities

### "Unable to install [app name]"
- **Solution:** Delete any existing version of SwiftQuest from your iPhone and try again

### Build fails with errors
- **Solution:** In Xcode menu, go to **Product > Clean Build Folder** (⌘ + Shift + K), then try building again

### iPhone not showing in device list
- **Solution:**
  - Make sure iPhone is unlocked
  - Try a different USB cable
  - Restart both iPhone and Mac
  - In Xcode, go to **Window > Devices and Simulators** to check if iPhone appears

### "This app cannot be installed because its integrity could not be verified"
- **Solution:** Follow Step 8 to trust the developer certificate

## Need More Help?

If you encounter any issues:
1. Make sure you're using the latest version of Xcode
2. Make sure your iPhone is running iOS 17.0 or later
3. Check that you've followed all steps in order
4. Try restarting Xcode, your iPhone, or your Mac

## What's Next?

Once the app is running:
- Play through all 12 questions
- Try to achieve 100% score
- Learn Swift concepts through the explanations
- Challenge yourself to improve your score!

---

**Enjoy learning Swift with SwiftQuest!** 🚀📱
