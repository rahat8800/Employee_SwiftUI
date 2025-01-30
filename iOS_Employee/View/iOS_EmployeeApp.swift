//
//  iOS_EmployeeApp.swift
//  iOS_Employee
//
//  Created by Rahat on 31/01/25.
//

import SwiftUI

@main
struct iOS_EmployeeApp: App {
    @State private var isSplashScreenPresented = true // Splash screen state

    var body: some Scene {
        WindowGroup {
            ZStack { // Use ZStack to overlay
                EmployeeListView() // Your main content view
                    .opacity(isSplashScreenPresented ? 0 : 1) // Hide initially
                    .animation(.default, value: isSplashScreenPresented)

                if isSplashScreenPresented {
                    LaunchScreenView(isSplashScreenPresented: $isSplashScreenPresented)
                }
            }
        }
    }
}

struct LaunchScreenView: View {
    @Binding var isSplashScreenPresented: Bool

    var body: some View {
        ZStack {
            Color.blue.edgesIgnoringSafeArea(.all) // Customize background

            VStack(spacing: 20) { // Add spacing between elements
                // App Logo or Image (replace with your asset)
                Image(systemName: "globe") // Example: A globe icon
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.white)

                // Welcome Message
                                Text("Crafted by Rahat Pasha")
                                    .font(.largeTitle)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .shadow(radius: 5) // Add a subtle shadow

                                // Tagline/Subtitle (Unique touch)
                                Text("Sr iOS Developer") // Your unique tagline
                    .font(.title)
                                    .italic() // Make it italic
                                    .foregroundColor(.white)
                                    .shadow(radius: 3) // Add a subtle shadow

                                // Optional: Add a loading indicator or other elements
                                ProgressView()
                                    .progressViewStyle(.circular)
                                    .tint(.white)
                                    .scaleEffect(1.5)
            }
            .multilineTextAlignment(.center) // Center all content within the VStack
            .padding() // Add padding around the content
        }
        .opacity(isSplashScreenPresented ? 1 : 0)
        .animation(.easeInOut(duration: 0.5), value: isSplashScreenPresented)
        .onAppear {
            // Replace with your actual app initialization
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                isSplashScreenPresented = false
            }
        }
    }
}



