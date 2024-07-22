# E-Commerce App

This is a Flutter-based mobile application for an e-commerce platform. The app allows users to browse products, add them to their cart, and manage their wishlist. It includes features like user authentication, product browsing by categories, and detailed product views.

## Features

- **User Authentication**
    - Sign Up
    - Sign In
- **Browse Products by Categories**
- **Product Details Page**
- **Add to Cart**
- **Wishlist Management**

## Installation

1. **Clone the repository:**
    
    ```bash
    bashCopy code
    git clone https://github.com/mahmoudashry98/e-commerce-app.git
    cd e-commerce-app
    
    ```
    
2. **Install dependencies:**
    
    ```bash
    bashCopy code
    flutter pub get
    
    ```
    
3. **Run the app:**
    
    ```bash
    bashCopy code
    flutter run
    
    ```
    
## Download APK

[Download APK](https://drive.google.com/file/d/1lOVctofObq2zagIxOHIMhJw_f-OW4M3W/view?usp=sharing)
## Configuration

- **Firebase:** The app uses Firebase for authentication and database. Set up a Firebase project and add the `google-services.json` file in the `android/app` directory and `GoogleService-Info.plist` file in the `ios/Runner` directory.
- **API Keys:** If your app uses any third-party APIs (e.g., for payment gateway), ensure to add the necessary API keys in the appropriate files.

## Dependencies

- firebase_core
- firebase_auth
- cloud_firestore
- provider
- flutter_secure_storage

## Folder Structure

```
plaintextCopy code
e-commerce-app/
├── .vscode
├── android
├── assets
│   ├── icons
│   └── images
├── build
├── ios
├── lib
│   ├── app_nav
│   │   ├── controller
│   │   └── ui
│   ├── core
│   │   ├── connections
│   │   ├── exception
│   │   ├── network
│   │   ├── utils
│   │   ├── validator
│   │   └── values
│   ├── modules
│   │   ├── auth
│   │   ├── cart
│   │   ├── home
│   │   └── services
│   ├── category
│   ├── home
│   ├── bloc_observer.dart
│   ├── firebase_options.dart
│   └── main.dart
├── test
└── pubspec.yaml

```

## Contribution

1. Fork the repository.
2. Create a new branch (`git checkout -b feature/your-feature-name`).
3. Make your changes and commit them (`git commit -m 'Add some feature'`).
4. Push to the branch (`git push origin feature/your-feature-name`).
5. Open a pull request.

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Contact

For any inquiries, please contact Mahmoud Ashri at mahmoudashry98@gmail.com.
