//
//  ProductCell.swift
//  Freshly
//
//  Created by Neosoft on 04/07/25.
//

import SwiftUI
import Kingfisher
import SwiftData
struct ProductCell: View {
    
    
//    @State var productName: String = "Banana"
//    @State var price: Double = 0
//    @State var imxageUrl: String
//    @State var product: Product
    var product: ProductEntity
    var didAddCart: ()-> Void
    var body: some View {
        
        VStack{
            
            KFImage(URL(string: product.image)).placeholder {
                ProgressView() // show a loading indicator while downloading
            }
            .resizable()
            .scaledToFit()
            .frame(width: 170, height: 130)
            
            
            Spacer()
            
            Text(product.title)
                .font(.customfont(.bold, fontSize: 16))
                .foregroundStyle(Color.primaryText)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            
            Text("\(product.rating.count)")
                .font(.customfont(.medium, fontSize: 14))
                .foregroundStyle(Color.secondaryText)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            
            Spacer()
            
            HStack{
                Text("₹\(product.price, specifier: "%.2f")")
                    .font(.customfont(.bold, fontSize: 20))
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                
                
                Spacer()
                
                Button {
                    didAddCart()
                    
                } label: {
                    Image(product.isInCart ? "minus" : "add")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 15, height: 15)
                }
                .frame(width: 40, height: 40)
                .background(Color.primaryApp)
                .cornerRadius(13, corner: .allCorners)
                
                
            }
            
        }
        .padding(15)
        .frame(width: 180, height: 230)
        .overlay {
            RoundedRectangle(cornerSize: CGSize(width: 16, height: 16))
                .stroke(Color.placeholder.opacity(0.5), lineWidth: 2 )
            
                
        }
    }
}
//#Preview {
//    ProductCell(product: Product(id: 1, title: "", price: 1.1, description: "", category: "", image: "", rating: Rating(rate: 1.1, count: 1)))
//}
