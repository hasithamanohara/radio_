# Simple Radio App

## Overview
The Simple Radio App is a Flutter application that allows users to listen to their favorite radio stations. The app provides a clean and intuitive interface for selecting and playing radio streams from various sources.

## Features
- Play radio streams from different stations
- User-friendly interface
- Support for background play
- Easy navigation between stations

## Screenshots
![Home Screen](path_to_your_screenshot1.png)
*Home Screen*


## Demo Video
Watch the demo video to see the app in action:
[![Watch the video](path_to_your_video_thumbnail.png)](path_to_your_video.mp4)

## Getting Started
### Prerequisites
- [Flutter](https://flutter.dev/docs/get-started/install) 2.0 or higher
- A code editor like [Visual Studio Code](https://code.visualstudio.com/) or [Android Studio](https://developer.android.com/studio)

### Installation
1. **Clone the repository**
    ```bash
    git clone https://github.com/yourusername/simple-radio-app.git
    cd simple-radio-app
    ```

2. **Install dependencies**
    ```bash
    flutter pub get
    ```

3. **Run the app**
    ```bash
    flutter run
    ```

## Folder Structure
```
simple-radio-app/
├── android/
├── ios/
├── lib/
│   ├── main.dart
│   ├── screens/
│   │   ├── home_screen.dart
│   │   ├── player_screen.dart
│   ├── widgets/
│   │   ├── radio_station_tile.dart
│   │   ├── play_button.dart
├── assets/
│   ├── images/
│   └── radio_stations.json
├── test/
└── README.md
```

## Dependencies
- `audioplayers`: ^0.20.1
- `provider`: ^5.0.0

Add these dependencies in your `pubspec.yaml` file.

## Contributing
Contributions are welcome! Please fork this repository and submit a pull request for any improvements, bug fixes, or new features.

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Contact
For any inquiries, please contact [your.email@example.com](mailto:your.email@example.com).


### How to Add Screenshots and Video

1. **Screenshots**
   - Place your screenshots in the `assets/images` folder.
   - Reference the screenshots in the `README.md` file using the relative path.

2. **Demo Video**
   - Upload your video to a service like YouTube or directly link to a video file.
   - Use a video thumbnail image and link it to the video URL.

### Example
```markdown
## Screenshots
![Home Screen](assets/images/home_screen.png)
*Home Screen*

![Player Screen](assets/images/player_screen.png)
*Player Screen*

## Demo Video
Watch the demo video to see the app in action:
[![Watch the video](assets/images/video_thumbnail.png)](https://www.youtube.com/watch?v=your_video_id)
```

Replace `path_to_your_screenshot1.png`, `path_to_your_screenshot2.png`, `path_to_your_video_thumbnail.png`, and `path_to_your_video.mp4` with the actual paths to your images and video.

This template should provide a comprehensive guide for users to understand, install, and use your Flutter radio app.