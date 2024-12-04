//
//  firebase_analytics_demoApp.swift
//  firebase-analytics-demo
//
//  Created by Vladimir Cezar on 2024.12.04.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}

@main
struct firebase_analytics_demoApp: App {
  
  @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
  
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
