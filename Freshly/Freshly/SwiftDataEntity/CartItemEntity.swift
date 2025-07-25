//
//  CartItemEntity.swift
//  Freshly
//
//  Created by Neosoft on 16/07/25.
//

import Foundation
import SwiftData

@Model
class CartItemEntity {
    var id: Int
    var quantity: Int

    init(product: ProductEntity) {
        self.id = product.id
        self.quantity = product.quantity
    }
}
