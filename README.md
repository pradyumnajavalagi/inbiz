# InBiz

A Flutter-based business application that helps manage and streamline business operations.

## Features

- Modern UI with Material Design
- State management using Flutter Bloc
- Network image caching
- Environment variable support
- HTTP networking capabilities

## Getting Started

### Prerequisites

- Flutter SDK (^3.5.4)
- Dart SDK
- Android Studio / VS Code
- Git

### Installation

1. Clone the repository:
```bash
git clone [your-repository-url]
```

2. Navigate to the project directory:
```bash
cd inbiz
```

3. Install dependencies:
```bash
flutter pub get
```

4. Create a `.env` file in the root directory and add your environment variables.

5. Run the application:
```bash
flutter run
```

## Project Structure

```
lib/
├── main.dart          # Application entry point
├── home/             # Home screen related files
└── services/         # Service layer for API calls and business logic
```

## Dependencies

- **flutter_bloc**: ^8.1.6 - State management
- **http**: ^1.2.2 - HTTP networking
- **cached_network_image**: ^3.4.1 - Image caching
- **path_provider**: ^2.1.5 - File system access
- **flutter_dotenv**: ^5.2.1 - Environment variable management
- **cupertino_icons**: ^1.0.8 - iOS style icons

## Development

### Code Style

This project follows the Flutter style guide and uses the `flutter_lints` package for code quality enforcement.

### Testing

Run tests using:
```bash
flutter test
```

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is licensed under the terms of the license included in the repository.

## Support

For support, please open an issue in the repository or contact the development team.

