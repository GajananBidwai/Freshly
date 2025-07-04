//
//  ProductCell.swift
//  Freshly
//
//  Created by Neosoft on 04/07/25.
//

import SwiftUI

struct ProductCell: View {
    
    var didAddCart: (()-> ())?
    @State var productName: String = "Banana"
    @State var price: Double = 0
    @State var imageUrl: String
    
    var body: some View {
        
        VStack{
            
            AsyncImage(url: URL(string: imageUrl)) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .scaledToFit()
                } else if phase.error != nil {
                    Color.red // error placeholder
                } else {
                    ProgressView()
                }
            }
            .frame(width: 200, height: 130)
            
            Spacer()
            
            Text(productName)
                .font(.customfont(.bold, fontSize: 16))
                .foregroundStyle(Color.primaryText)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            
            Text("7pcs, price")
                .font(.customfont(.medium, fontSize: 14))
                .foregroundStyle(Color.secondaryText)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            
            Spacer()
            
            HStack{
                Text("₹\(price, specifier: "%.2f")")
                    .font(.customfont(.bold, fontSize: 20))
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    
                
                Spacer()
                  
                Button {
                    didAddCart?()
                } label: {
                    Image("add")
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
                .stroke(Color.placeholder  .opacity(0.5), lineWidth: 2 )
            
                
        }
    }
}

#Preview {
    ProductCell(
            productName: "Banana",
            price: 10.0,
            imageUrl: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg"
        )
}
