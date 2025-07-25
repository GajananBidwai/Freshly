//
//  ProductViewModel.swift
//  Freshly
//
//  Created by Neosoft on 04/07/25.
//

import SwiftUI
import SwiftData


class ProductViewModel: ObservableObject{
    
    @Published var product: [Product] = []
    @Published var isFav: Bool = false
    @Published var isShowDetail: Bool = false
    @Published var isShowCategory: Bool = false
 //   var viewModel: ProductViewModel = ProductViewModel()
    
    var context: ModelContext
    
    init(context: ModelContext) {
        self.context = context
    }
    
    func showDetails(){
        isShowDetail = !isShowDetail
    }
    
    func showCategory(){
        isShowCategory = !isShowCategory
    }
    
    func fetchData(){
        APIHelper().fetchData(url: "https://fakestoreapi.com/products") { result in
            DispatchQueue.main.async {
                switch result{
                case .success(let product):
                    self.product = product
                    
                    for productData in product{
                        let entity = ProductEntity(id: productData.id,
                                                   title: productData.title,
                                                   price: productData.price,
                                                   productDescription: productData.description,
                                                   category: productData.category,
                                                   image: productData.image,
                                                   quantity: 1,
                                                   rating: RatingData(rate: productData.rating.rate, count: productData.rating.count))
                        self.context.insert(entity)
                    }
                    
                    do{
                        try self.context.save()
                        
                    }catch{
                        print("Failed to save to SwiftData: \(error)")
                    }
                    
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    
    
}

