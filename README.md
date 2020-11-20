# Smart Attendance Tracker

A Mobile application which allow users (teachers) to mark attendance using **Image recognition**. Users can mark attendance in a matter of few steps!

## Features of the Application

* Simple, Aesthetic, User-Friendly UI which makes the app intuitive.
* Users can signup & login in any device using their email.
* Attendance in a matter of few steps.
* Attendance will be marked in a csv file and the download link will be emailed.

## Screenshots
<table>
  <tr>
    <td>
          <img src = "https://user-images.githubusercontent.com/56084840/99776720-3fe37900-2b37-11eb-8fca-29ebd51b991c.jpg" width = "500" height = "300">
     </td>
     <td>
          <img src = "https://user-images.githubusercontent.com/56084840/99776768-5b4e8400-2b37-11eb-94b7-feec19bfb538.jpg" width = "500" height = "300">
    </td>
  </tr>
    <tr>
    <td>
          <img src = "https://user-images.githubusercontent.com/56084840/99776756-5558a300-2b37-11eb-9b06-d8172dbf1d36.jpg" width = "500" height = "300">
     </td>
     <td>
          <img src = "https://user-images.githubusercontent.com/56084840/99776759-5689d000-2b37-11eb-8ca2-6726438ef9ac.jpg" width = "500" height = "300">
    </td>
  </tr>
  </table>

## Technologies used
* Flutter / Dart
* OpenCV
* Firebase
* Python


## How to use?
### 1. Clone 
```sh
$ git clone https://github.com/akilvishnum/attendanceApp.git
```
### 2. Move Directory
```sh
# This will change directory to a folder attendanceApp
$ cd attendanceApp
```
### 3. Run the App
```sh
# Dependency: Flutter & Android SDK tools
# Considering that you have flutter and android sdk tools pre-installed in your systems.
# Make sure you have USB Debugging device or Virtual Emulator connected

$ flutter run

# It may take some time to get finished.
```

### 4. Attendance in few steps
```
1. Open the Mobile app. Signup & login using valid email.
2. Create a Classroom
3. Add students to it. (We consider that the individual image of the student will be already present.)
4. Upload group image by pressing Take Attendance Button.
5. Attendance will be marked in csv file and the download link will be sent to your mail.
```






