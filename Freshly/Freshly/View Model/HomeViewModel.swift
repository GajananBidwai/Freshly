//
//  HomeViewModel.swift
//  Freshly
//
//  Created by Neosoft on 03/07/25.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    
    static let shared: HomeViewModel = HomeViewModel()
    
    @Published var selectedTab: Int = 0
    @Published var txtSearch: String = ""
    
}


