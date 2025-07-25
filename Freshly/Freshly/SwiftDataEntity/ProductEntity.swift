//
//  ProductEntity.swift
//  Freshly
//
//  Created by Neosoft on 09/07/25.
//

import Foundation
import SwiftData

@Model
class ProductEntity: Identifiable{
    var id: Int
    var title: String
    var price: Float
    var productDescription: String
    var category: String
    var image: String
    var quantity: Int
    var isInCart: Bool = false 
    var rating: RatingData
    
    init(id: Int, title: String, price: Float, productDescription: String, category: String, image: String, quantity: Int, rating: RatingData) {
        self.id = id
        self.title = title
        self.price = price
        self.productDescription = productDescription
        self.category = category
        self.image = image
        self.quantity = quantity
        self.rating = rating
    }
    
}

@Model
class RatingData{
    var rate: Float
    var count: Int
    
    init(rate: Float, count: Int) {
        self.rate = rate
        self.count = count
    }
    
}


