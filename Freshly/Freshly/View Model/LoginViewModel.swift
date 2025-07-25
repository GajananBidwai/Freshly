//
//  SignInViewModel.swift
//  Freshly
//
//  Created by Neosoft on 22/07/25.
//

import Foundation
import SwiftUI
import FirebaseAuth

final class LoginViewModel: ObservableObject{
    
    @Published var isLoggedIn = false
    @Published var loginErrorMassage: String?
    @Published var email = ""
    @Published var password = ""
    @Published var toastMassage = ""
    
    init() {
        checkAuthState()
    }
    
    func checkAuthState(){
        isLoggedIn = Auth.auth().currentUser != nil
    }
    
    func login(completionHandler: @escaping (Bool) -> Void) {
        guard !email.isEmpty else{
            print("Please Enter your Email Address")
            toastMassage = "Please Enter your Email Address"
            completionHandler(false)
            return
        }
        
        guard !password.isEmpty else{
            print("Please Enter your Password")
            toastMassage = "Please Enter your Password"
            completionHandler(false)
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let authError = error{
                self.loginErrorMassage = authError.localizedDescription
                self.isLoggedIn = false
                completionHandler(false)
            }else {
                self.loginErrorMassage = nil
                self.isLoggedIn = true
                completionHandler(true)
            }
        }
        
        
        
    }
    
    func signOut() async{
        do{
            try Auth.auth().signOut()
            await MainActor.run {
                self.isLoggedIn = false
            }
            
        }catch{
            print("Unable to log out")
        }
        
        
    }
    
    
}
