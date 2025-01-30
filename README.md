# iOS Employee App

This iOS app demonstrates fetching and displaying employee data from a remote API using SwiftUI, Combine, and the MVVM (Model-View-ViewModel) architectural pattern.

## Table of Contents

- [Features](#features)
- [Setup Instructions](#setup-instructions)
- [Project Structure](#project-structure)
- [Technologies Used](#technologies-used)
- [API Endpoint](#api-endpoint)
- [Additional Notes](#additional-notes)
- [Author](#author)

## Features

- Fetches employee data from a remote API.
- Displays employee data in a list view.
- Shows detailed information for each employee.
- Implements MVVM architecture for a clean and maintainable codebase.
- Uses SwiftUI for the user interface.
- Employs Combine for reactive programming and data binding.
- Includes a splash screen for a polished launch experience.
- Handles network errors gracefully.
- Displays a default image for employees without profile images.

## Setup Instructions

1. **Clone the Repository:**
   ```bash
   https://github.com/rahat8800/Employee_SwiftUI.git
   
Open the Project:

Open Xcode.
Select "Open a project or file".
Navigate to the cloned repository and select the .xcodeproj file.
Install Dependencies (if any):


Run the App:

Select a simulator or connect a physical iOS device.
Click the "Play" button in Xcode to build and run the app.
Project Structure
iOS_Employee/
├── Models/          // Data models
│   └── Employee.swift
│   └── EmployeeResponse.swift
├── ViewModels/      // Logic and state management
│   └── EmployeeListViewModel.swift
├── Views/           // User interface
│   └── EmployeeListView.swift
│   └── EmployeeRow.swift
│   └── EmployeeDetailView.swift
│   └── LaunchScreenView.swift  // Splash Screen
├── Extensions/      // Helper classes, utilities
│   └── APIManager.swift    // API interaction class
│   └── APIError.swift      // Custom error enum
├── Assets.xcassets  // App icons, images
├── iOS_EmployeeApp.swift // Main app entry point
└── ... other Xcode-generated files
Technologies Used
Swift
SwiftUI
Combine
URLSession
API Endpoint
The app uses the following API endpoint to fetch employee data:

[https://a00407a8-f46e-407e-b684-5d949532e7fc.mock.pstmn.io/api/v1/employees](https://a00407a8-f46e-407e-b684-5d949532e7fc.mock.pstmn.io/api/v1/employees)
Additional Notes
The splash screen displays a welcome message and a loading indicator while the app initializes.
The APIManager class handles all API requests and encapsulates the network logic.
Error handling is implemented to display user-friendly error messages in case of network issues or JSON decoding errors.
The app is designed to be responsive and should adapt to different screen sizes.
