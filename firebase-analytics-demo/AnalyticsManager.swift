
//
//  AnalyticsManager.swift
//  firebase-analytics-demo
//
//  Created by Vladimir Cezar on 2024.12.04.
//
import SwiftUI
import Firebase

class AnalyticsManager {
  static let shared = AnalyticsManager()
  private init() {}
  
  func logEvent(name: String, parameters: [String:Any]? = nil) {
    Analytics.logEvent(name, parameters: parameters)
  }
  
  func setUserId(userId: String) {
    Analytics.setUserID(userId)
  }
}
