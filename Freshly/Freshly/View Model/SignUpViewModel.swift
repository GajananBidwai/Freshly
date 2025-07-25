//
//  SignUpViewModel.swift
//  Freshly
//
//  Created by Neosoft on 23/07/25.
//

import Foundation

final class SignUpViewModel: ObservableObject{
    static let shared = SignUpViewModel()
    
    @Published var nickName = ""
    @Published var email = ""
    @Published var password = ""
    @Published var errorMassage = ""
    
    func signUp(completion: @escaping (Bool) -> Void){
        guard !nickName.isEmpty else{
            print("Please Enter your Nick Name")
            errorMassage = "Please Enter your Nick Name"
            completion(false)
            return
        }
        
        guard !email.isEmpty else{
            print("Please Enter your Name")
            errorMassage = "Please Enter your Nick Name"
            completion(false)
            return
        }
        
        guard !password.isEmpty else{
            print("Please Enter your Password")
            errorMassage = "Please Enter your Nick Name"
            completion(false)
            return
        }
        
        Task{
            do{
                let result = try await AuthenticationManager().createUser(email: email, password: password)
                print("Successfully created user \(result)")
                completion(true)
            }catch{
                completion(false)
                print("Unable to creat user")
            }
        }
        
        
    }
    
}
