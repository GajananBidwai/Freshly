//
//  ProductViewModel.swift
//  Freshly
//
//  Created by Neosoft on 04/07/25.
//

import SwiftUI
import Foundation

class ProductViewModel: ObservableObject{
    
    @Published var product: [Product] = []
 //   var viewModel: ProductViewModel = ProductViewModel()
    
    func fetchData(){
        APIHelper().fetchData(url: "https://fakestoreapi.com/products") { result in
            DispatchQueue.main.async {
                switch result{
                case .success(let product):
                    self.product = product
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    
    
}

