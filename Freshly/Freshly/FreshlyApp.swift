//
//  FreshlyApp.swift
//  Freshly
//
//  Created by Neosoft on 27/06/25.
//

import SwiftUI
import SwiftData
import Firebase
import FirebaseCore 

@main
struct FreshlyApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var loginVM = LoginViewModel()
    @StateObject var cartVM = CartViewModel()
    var body: some Scene {
        WindowGroup {
            Group {
               
                if loginVM.isLoggedIn {
                    MainTabView()
                        .environmentObject(cartVM)
                        .environmentObject(loginVM)
                    
                } else {
                    WelcomeView()
                        .environmentObject(loginVM)
                }
            }
            
            
        }
        .modelContainer(for: ProductEntity.self)
        .onChange(of: loginVM.isLoggedIn) { newValue in
            print("isLoggedIn changed to:", newValue)
        }
       
        
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        print("Firebase configured")
        return true
    }
}
