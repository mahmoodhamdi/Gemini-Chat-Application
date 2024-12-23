# Gemini Chat Application

**Gemini Chat** is a modern, user-friendly chat application that integrates a powerful AI assistant for conversational experiences. Built using Flutter and powered by the BLoC pattern for state management, Gemini Chat delivers a responsive, seamless, and intuitive user interface. This app allows users to chat with an AI assistant, toggle between light and dark themes, and enjoy a smooth experience on both Android and iOS devices.

## Features

- **Real-Time Chat**: Engage with an AI-powered assistant in real time.
- **Typing Indicator**: A dynamic typing indicator to simulate real-time communication, enhancing the chat experience.
- **Light/Dark Theme**: Switch seamlessly between light and dark themes with an easy-to-use toggle.
- **Smooth Animations**: A modern and polished interface with intuitive animations.
- **Responsive Design**: Optimized for both phone and tablet screens, ensuring a consistent experience on all devices.
- **State Management**: Leverages the BLoC pattern for clean and maintainable state management.

## Technologies Used

- **Flutter**: A powerful, open-source UI framework for building natively compiled applications for mobile, web, and desktop from a single codebase.
- **BLoC (Business Logic Component)**: A predictable state management solution for Flutter that helps manage app state efficiently.
- **Animation**: Used to create smooth, interactive user experiences.
- **Dart**: The programming language used to build this application.

## Installation

### Prerequisites

Before you begin, make sure you have the following installed on your system:

- Flutter SDK: [Install Flutter](https://flutter.dev/docs/get-started/install)
- Dart SDK: [Install Dart](https://dart.dev/get-dart)

### Steps

1. Clone the repository:

   ```bash
   git clone https://github.com/yourusername/gemini_chat.git
   ```

2. Navigate to the project directory:

   ```bash
   cd gemini_chat
   ```

3. Install dependencies:

   ```bash
   flutter pub get
   ```

4. Run the application on an emulator or connected device:

   ```bash
   flutter run
   ```

## How It Works

Gemini Chat combines the power of **Flutter** for frontend development and **BLoC** for managing the app's state. The application features a conversation interface where users can send messages and interact with an AI assistant. The typing indicator is animated and appears when the AI is processing the message, ensuring a smooth interaction. Users can toggle between light and dark themes using an easily accessible button in the app's navigation bar.

### Architecture Overview

- **UI Layer**: Handles the user interface using Flutter widgets and animations.
- **BLoC Layer**: Manages the state of the application using the `ChatCubit` and `ThemeCubit` to handle chat interactions and theme changes.
- **Business Logic**: The core logic of the app is separated into different cubits, making the app more modular and testable.

## App Structure

- **lib/**
  - `main.dart`: The entry point for the app.
  - `chat_cubit.dart`: Handles chat-related business logic.
  - `theme_cubit.dart`: Manages theme switching between light and dark modes.
  - `widgets/`: Contains reusable widgets like `MessageList`, `TypingIndicator`, and `CustomAppBar`.

## Contribution

Contributions are welcome! If you want to improve this project, feel free to:

1. Fork the repository
2. Create a new branch for your feature or fix
3. Make the changes
4. Open a pull request with a description of your changes

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

### Contact

For any questions or feedback, feel free to reach out to me via email at [hmdy7486@gmail.com](mailto:hmdy7486@gmail.com) or open an issue on the GitHub repository.
"# Gemini-Chat-Application" 
