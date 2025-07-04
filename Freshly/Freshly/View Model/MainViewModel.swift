//
//  MainViewModel.swift
//  Freshly
//
//  Created by Neosoft on 30/06/25.
//

import SwiftUI

class MainViewModel: ObservableObject {
    static let shared: MainViewModel = MainViewModel()
    
    @Published var email: String = ""
    @Published var txtPassword: String = ""
    @Published var isShowPassoword: Bool = false
    @Published var txtUsername: String = ""
    @Published var isUserLogin: Bool = false
    
    
}


