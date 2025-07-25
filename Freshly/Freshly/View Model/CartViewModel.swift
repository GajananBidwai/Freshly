//
//  CartViewModel.swift
//  Freshly
//
//  Created by Neosoft on 15/07/25.
//

import Foundation
import SwiftData

class CartViewModel: ObservableObject{
    @Published var cartProduct: [ProductEntity] = []
    
    func addToCart(product: ProductEntity, context: ModelContext){
        
        guard !product.isInCart else { return }
        product.isInCart = true
        try? context.save()
        cartProduct.append(product)
    }
    
    func removeFromCart(product: ProductEntity, context: ModelContext){
        guard product.isInCart else { return}
        product.isInCart = false
        try? context.save()
        
        if let index = cartProduct.firstIndex(of: product){
            cartProduct.remove(at: index)
        }
    }
}
