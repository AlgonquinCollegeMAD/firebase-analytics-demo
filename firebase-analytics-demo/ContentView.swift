//
//  ContentView.swift
//  firebase-analytics-demo
//
//  Created by Vladimir Cezar on 2024.12.04.
//
import SwiftUI
import Firebase

struct ContentView: View {
  
  var body: some View {
    NavigationView {
      VStack(spacing: 20) {
        Text("Firebase Analytics Demo")
          .font(.headline)
          .padding()
        
        // Button to log click events
        Button(action: {
          Task {
            await logButtonClickEvent(buttonName: "SubmitButton")
          }
        }) {
          Text("Log Button Click Event")
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        
        // Button to set user properties
        Button(action: {
          Task {
            await setUserProperty(key: "app_theme", value: "dark_mode")
          }
        }) {
          Text("Set User Property")
            .padding()
            .background(Color.green)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        
        // Navigation to another screen to log page views
        NavigationLink("Go to Details Screen") {
          Text("Details Screen")
            .font(.headline)
            .padding()
            .onAppear {
              Task {
                await logPageView(screenName: "DetailsScreen")
              }
            }
        }
        .padding()
        .background(Color.orange)
        .foregroundColor(.white)
        .cornerRadius(10)
      }
      .padding()
      .onAppear {
        Task {
          await logPageView(screenName: "HomeScreen")
        }
      }
    }
  }
  
  /// Logs a button click event
  func logButtonClickEvent(buttonName: String) async {
    Analytics.logEvent("button_click", parameters: [
      "button_name": buttonName,
      "timestamp": Date().timeIntervalSince1970
    ])
    print("Event logged: Button \(buttonName) clicked.")
  }
  
  /// Logs a page view event
  func logPageView(screenName: String) async {
    Analytics.logEvent(AnalyticsEventScreenView, parameters: [
      "screen_name": screenName,
      "timestamp": Date().timeIntervalSince1970
    ])
    print("Event logged: \(screenName) viewed.")
  }
  
  /// Sets a user property
  func setUserProperty(key: String, value: String) async {
    Analytics.setUserProperty(value, forName: key)
    print("User property set: \(key) = \(value)")
  }
}



#Preview {
  ContentView()
}
