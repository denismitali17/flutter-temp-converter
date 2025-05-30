# 🌡️ Temperature Converter App (Flutter)

A sleek and responsive **Temperature Converter** built with Flutter that allows users to convert temperatures between **Fahrenheit and Celsius** with ease. This app is designed to work flawlessly in both **portrait and landscape** modes with a smooth user experience.

---

## 📱 Features

- 🔄 **Two-way Conversion**: Convert between Fahrenheit ➡️ Celsius and Celsius ➡️ Fahrenheit.
- 💡 **Intelligent UI**: Only one conversion type can be selected at a time.
- 🧮 **Accurate Results**: Displays converted temperatures rounded to **2 decimal places**.
- 📜 **Conversion History**: Tracks and displays all past conversions (latest at the top).
- 🔄 **Responsive Design**: Adapts seamlessly between portrait and landscape orientations.
- 🎨 **Clean, modern UI** that’s easy to use and visually appealing.


---

## 🚀 Getting Started

### Prerequisites

- ✅ Flutter SDK installed (v3.0 or later)
- ✅ Any IDE like VS Code or Android Studio
- ✅ Device emulator or real device

### Installation

1. **Clone this repository**
   ```bash
   git clone https://github.com/denismitali17/flutter-temp-converter
   cd temperature_converter_flutter
````

2. **Run the app**

   ```bash
   flutter pub get
   flutter run
   ```

---

## 🧠 How It Works

1. Select the conversion type:

    * `Fahrenheit to Celsius` or
    * `Celsius to Fahrenheit`

2. Enter the temperature in the input field.

3. Tap on the **CONVERT** button.

4. The result will appear beside the input field, rounded to two decimal places.

5. Each conversion is automatically logged into a **history list**, shown either below (portrait) or beside (landscape) the converter.

---

## 🧱 Tech Stack

* **Flutter** – UI toolkit by Google
* **Dart** – Programming language
* **State Management** – `setState()` for simple and efficient updates

---

## 💻 Code Structure

* `main.dart`: Contains all UI, logic, and layout using widgets like `TextField`, `Radio`, `Column`, `Row`, `ListView`, and `Container`.
* Uses:

    * `StatefulWidget` to manage and update UI
    * `TextEditingController` to manage input
    * `MediaQuery` for responsive design
    * `ListView.builder` to show history

---

## 📝 Conversion Formulae

* °F = °C × 9/5 + 32
* °C = (°F − 32) × 5/9
