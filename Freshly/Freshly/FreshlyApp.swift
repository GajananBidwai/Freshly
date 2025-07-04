//
//  FreshlyApp.swift
//  Freshly
//
//  Created by Neosoft on 27/06/25.
//

import SwiftUI

@main
struct FreshlyApp: App {
    @StateObject var mainVM = MainViewModel.shared
    
    var body: some Scene {
        WindowGroup {
            
            if mainVM.isUserLogin{
                 
            }else{
                WelcomeView()
            }
            
            
        }
    }
}
