//
//  AuthenticationManager.swift
//  Freshly
//
//  Created by Neosoft on 22/07/25.
//

import Foundation
import FirebaseAuth

struct AuthResultModel{
    let uid: String
    let email: String?
    let photoUrl: String?
    
    init(user: User) {
        self.uid = user.uid
        self.email = user.email
        self.photoUrl = user.photoURL?.absoluteString 
    }
}

final class AuthenticationManager{
    static let shared = AuthenticationManager()
    
    func getAuthenticatedUser() throws -> AuthResultModel{
        guard let user = Auth.auth().currentUser else {
            
            throw URLError(.badServerResponse )
        }
        
        return AuthResultModel(user: user )
    }
    
    func createUser(email: String, password: String) async throws -> AuthResultModel{
        let authDataResult = try await Auth.auth().createUser(withEmail: email, password: password)
        return AuthResultModel(user: authDataResult.user)
        
    }
    

}
