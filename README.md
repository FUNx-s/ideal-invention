# W TOPPERS — Flutter Android app

A premium dark-blue study portal hub for Android.

## Included website cards
1. Physics Wallah — https://pw.delta-verse.xyz/study
2. Science and Fun — https://delta-verse.xyz/scienceandfun
3. Next Toppers — https://delta-verse.xyz/nexttoppers

The app opens these sites inside an in-app WebView. It includes back, forward, home, reload, and a loading indicator.

## Build the APK using GitHub on your phone

1. Download and extract this ZIP on your phone, or upload the ZIP contents to a new GitHub repository.
2. On GitHub, create a new **public or private repository** named `w-toppers`.
3. Upload all files and folders from this project to the repository's main branch. Make sure `.github/workflows/build-apk.yml` is included. If uploading through GitHub mobile web, enable desktop site if needed.
4. Open the repository's **Actions** tab.
5. Select **Build W TOPPERS APK** and tap **Run workflow**. (A push to `main` also starts a build.)
6. Wait for the workflow to finish successfully.
7. Open the completed workflow run, scroll to **Artifacts**, and download `W-TOPPERS-APK`.
8. Extract the artifact ZIP. Install `app-release.apk` on your Android phone. Android may ask you to allow installs from your browser or file manager.

## Notes and limitations
- The GitHub Actions workflow creates the Android platform scaffold, fetches Flutter dependencies, and builds a release APK.
- This project has not yet been compiled or tested against the live portal websites in this environment.
- The website tiles currently use text-based logo marks as placeholders, not official logo image files. Use official logos only if you have permission to use them.
- Website login, video playback, downloads, popups, DRM, and other site-specific features depend on each portal's own policies and WebView compatibility. This app does not bypass access controls.
- A GitHub account is enough to start; no paid GitHub plan is required for this small build workflow, subject to GitHub's current Actions usage limits.
