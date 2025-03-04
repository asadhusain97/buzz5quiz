# buzz5quiz

**buzz5quiz** is a Flutter-based quiz application. This is a passion project inspired from the awesome (Buzzing with Kvizzing)[https://youtube.com/playlist?list=PLwXllhq0F5Ml2JaY_Nid7jiLt0nFLfFJQ&si=fB6XhgI968iOQFVN] youtube series.

## Description

I made this so that I could play a specific style of quiz. This is my first flutter app.
The 'backend' is basically a google sheet that hosts all the data - like questions, answers, sets, rounds, points, image links, etc. The quizmaster is supposed to populate that and open it on the side while quizzing to check the answers.
Another important part of the quiz is a buzzer that every player has. Until I can get the buzzer part of the app to be working, we can use 3rd party apps like [buzz-in website](https://buzzin.live/) on player's mobile.

## Getting Started

### Prerequisites

Ensure you have the following installed:
- Flutter SDK: [Installation Guide](https://flutter.dev/docs/get-started/install)
- Dart SDK: [Installation Guide](https://dart.dev/get-dart)

### Installation

1. Clone the repository:
    ```sh
    git clone https://github.com/yourusername/buzz5quiz.git
    ```
2. Navigate to the project directory:
    ```sh
    cd buzz5quiz
    ```
3. Install the dependencies:
    ```sh
    flutter pub get
    ```

### Running the App

To run the app on your local machine, use the following command:
```sh
flutter run
```

### Building the App

To build the app for production, use the following command:
```sh
flutter build <platform>
```
Replace <platform> with apk, ios, web, etc.

### Key Files and Directories

- main.dart: Entry point of the application.
- pubspec.yaml: Project configuration and dependencies.
- assets: Contains fonts, images, videos, audios, and other assets.
- android and ios: Platform-specific code for Android and iOS.

### Dependencies

The project uses the following key dependencies:

flutter: The Flutter SDK.
go_router: For routing.
provider: For state management.

### License

This project is licensed under MIT.