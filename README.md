# 📘 Распоред за испити – Flutter апликација

### 👨‍💻 Автор
**Ѓорѓи Андоновски**  
Индекс: **213040**  
Факултет за компјутерски науки и инженерство – ФИНКИ  
Предмет: **Мобилни информациски системи**

---

## 🧩 Опис на апликацијата
Оваа Flutter апликација прикажува **распоред на испити** за студент, со можност за преглед на датум, време, просторија и статус на секој испит.  
Апликацијата е развиена за целите на вежба по предметот *Мобилни информациски системи* и служи како практична демонстрација на користење на **Flutter widgets**, **модел-класи**, **навигација меѓу екрани**, и **дизајн според материјалните принципи на Flutter**.

---

## ⚙️ Главни функционалности
- **Почетен екран (Exam List Screen)**  
  - Прикажува листа на повеќе од 10 испити (Card widgets).  
  - Секој испит содржи име на предмет, датум, време и просторија.  
  - Испитите се подредени хронолошки според датумот.

- **Боја според статус:**  
  - 🩶 *Поминат испит* – сива боја (некликабилен)  
  - 🟠 *Скоро испит* – портокалов раб  
  - 🔵 *Престојен испит* – стандардна бела картичка  

- **Детален преглед (Exam Detail Screen)**  
  - Прикажува детали за избраниот испит: предмет, датум, време, просторија.  
  - Се пресметува и прикажува **преостанато време** до испитот во формат *„X дена, Y часа“*.  
  - Копчиња **„Да“ / „Не“** овозможуваат означување дали студентот планира да присуствува.  
  - Копчињата автоматски се деактивираат по избор (сиви, некликабилни).  
  - Прикажува и колку студенти се пријавени во дадената просторија.

---

## 🏗️ Структура на проектот
lib/
├─ main.dart
├─ models/
│ └─ exam.dart
├─ screens/
│ ├─ exam_list_screen.dart
│ └─ exam_detail_screen.dart
└─ widgets/
└─ exam_card.dart

markdown
Copy code

Кодот е организиран во три главни слоја:
- **models/** – модели на податоци  
- **screens/** – екрани на апликацијата  
- **widgets/** – визуелни компоненти за повторна употреба  

---

## 🚀 Како да се користи апликацијата
1. Отворете го проектот во **Android Studio** или **VS Code**.  
2. Проверете дали имате инсталирано Flutter SDK и Android Emulator.  
3. Во терминал извршете:
   ```bash
   flutter pub get
   flutter run
На почетниот екран ќе се прикаже листата на испити.
Со клик на било кој испит се отвора деталниот преглед.

Испитите се прикажуваат со различна боја зависно од нивниот статус.

🖼️ Screenshots
Почетен екран	Детален преглед

📹 Видео демо
🎥 Видео демонстрација на апликацијата

🧠 Користени технологии
Flutter SDK (Dart)

Material Design widgets

Stateless и Stateful widgets

Card, ListView, Icons, и Navigator API

iOS-inspired минималистички дизајн

🏁 Заклучок
Со оваа апликација се демонстрира целосен процес на изработка на мобилна апликација со Flutter – од дизајн и организација на код, до имплементација на логика и интерактивни елементи.
Апликацијата е лесна за користење, визуелно јасна и прилагодена на барањата на предметот.

yaml
Copy code

---

### 💡 Next steps
1. Save this file in your project root as `README.md`.
2. Add your screenshots to the folder `screenshots/`.
3. Run these commands in terminal:
   ```bash
   git add README.md screenshots/
   git commit -m "Added professional README and screenshots"
   git push
Go to GitHub → refresh → you’ll see your full documentation live.

Would you like me to make the same README translated to English as a second version (for your portfolio or Erasmus use)?





You said:
to be on english and ready to coppy and paste on README



ChatGPT said:
Perfect 👏 — here’s your ready-to-paste English version of the README.md, fully professional, formatted for GitHub, and written in a clean academic/portfolio style.

It keeps your project structured and easy to understand while explaining how it works and how to run it.

✅ README.md (English Version)
markdown
Copy code
# 📘 Exam Schedule – Flutter Application

### 👨‍💻 Author
**Gjorgi Andonovski**  
Index Number: **213040**  
Faculty of Computer Science and Engineering – FINKI  
Course: **Mobile Information Systems**

---

## 🧩 Application Description
This Flutter application displays an **exam schedule** for a student, showing each subject’s name, date, time, classroom, and exam status.  
It was developed as part of the *Mobile Information Systems* course to demonstrate the use of **Flutter widgets**, **model classes**, **state management**, and **UI design principles**.

---

## ⚙️ Key Features
- **Home Screen (Exam List Screen)**  
  - Displays a list of more than 10 exams using Card widgets.  
  - Each exam shows its subject name, date, time, and classroom.  
  - Exams are automatically sorted chronologically by date.  

- **Color by Status:**  
  - 🩶 *Passed exam* – gray color (unclickable)  
  - 🟠 *Upcoming soon* – orange border and badge  
  - 🔵 *Future exam* – default white card  

- **Exam Detail Screen**  
  - Displays all details for the selected exam: subject, date, time, classroom.  
  - Calculates and displays the **remaining time** until the exam in the format *“X days, Y hours.”*  
  - Includes **Yes / No** buttons allowing the user to mark if they plan to attend the exam.  
  - Buttons automatically become disabled (gray) after making a selection.  
  - Shows the number of registered students and total capacity for each classroom.  

---

## 🏗️ Project Structure
lib/
├─ main.dart
├─ models/
│ └─ exam.dart
├─ screens/
│ ├─ exam_list_screen.dart
│ └─ exam_detail_screen.dart
└─ widgets/
└─ exam_card.dart

markdown
Copy code

The code is organized into three main layers:
- **models/** – data model classes  
- **screens/** – main app screens  
- **widgets/** – reusable UI components  

---

## 🚀 How to Run and Use
1. Open the project in **Android Studio** or **VS Code**.  
2. Make sure **Flutter SDK** and an emulator or device are properly configured.  
3. In the terminal, execute:
   ```bash
   flutter pub get
   flutter run
The home screen will display the list of all exams.
Tap on any exam to open its detailed view.

Exams are visually categorized based on their status (Passed, Soon, Upcoming).

🖼️ Screenshots
Home Screen	Exam Details

📹 Video Demonstration
🎥 Click here to watch the video demo

🧠 Technologies Used
Flutter SDK (Dart)

Material Design widgets

Stateless and Stateful widgets

ListView, Card, Icons, and Navigator API

iOS-inspired minimalist visual design

🏁 Conclusion
This project demonstrates the complete process of developing a mobile application using Flutter — from UI design and folder organization to functionality and interactivity.
The application is simple, visually clear, and fully aligned with the course requirements for Mobile Information Systems at FINKI.
