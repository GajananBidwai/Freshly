//
//  ProductListView.swift
//  Freshly
//
//  Created by Neosoft on 14/07/25.
//

import SwiftUI
import Kingfisher
struct ProductListView: View {
    
    let product: ProductEntity
    
    var body: some View {
        VStack(alignment: .leading){
            ScrollView(.vertical){
                HStack(){
                    
                    KFImage(URL(string: "\(product.image)"))
                        .resizable()
                        .frame(width: 100, height: 130,alignment: .leading)
                    Spacer()
                    
                    VStack(alignment: .leading){
                        
                        Text("\(product.title)")
                            .font(.customfont(.bold, fontSize: 21))
                        
                        HStack{
                            Text("\(product.category)")
                                .font(.customfont(.bold, fontSize: 15))
                                .foregroundStyle(Color.secondaryText)
                            
                            Spacer()
                            
                            Text("₹\(product.price, specifier: "%.2f")")
                                .font(.customfont(.bold, fontSize: 22))
                                .foregroundStyle(Color.primaryApp)
                        }
                        
                            
                        
                        Text("\(product.productDescription)")
                            .font(.customfont(.regular, fontSize: 12))
                            .lineSpacing(2)
                            
                        Spacer()
                            
                    }
                    .frame(alignment: .leading)
                }
                .padding(15)
                .frame(width: 380, height: 150)
                .overlay {
                    RoundedRectangle(cornerSize: CGSize(width: 16, height: 16))
                        .stroke(Color.placeholder.opacity(0.5), lineWidth: 2 )
                }
            }
            
        }
    }
}

#Preview {
    ProductListView(product: ProductEntity(id: 1, title: "", price: 1.1, productDescription: "", category: "", image: "", quantity: 1, rating: RatingData(rate: 1.1, count: 1)))
}
