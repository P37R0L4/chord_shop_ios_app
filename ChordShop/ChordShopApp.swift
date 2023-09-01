//
//  ChordShopApp.swift
//  ChordShop
//
//  Created by Lucas Petrola on 31/08/23.
//

import SwiftUI
import FirebaseCore

// MARK: Firebase delegate
class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}

// MARK: Main Function
@main
struct ChordShopApp: App {
    // Firesabe initializer
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
