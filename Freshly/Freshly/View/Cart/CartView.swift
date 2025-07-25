//
//  CartView.swift
//  Freshly
//
//  Created by Neosoft on 15/07/25.
//

import SwiftUI
import Kingfisher
import SwiftData

struct CartView: View {
    @Query(filter: #Predicate<ProductEntity> { $0.isInCart == true })
    var cartItems: [ProductEntity]
  //  @EnvironmentObject var cartVM: CartViewModel
    
    var body: some View {
        ScrollView{
            VStack{
                HStack{
                    Text("Cart")
                        .font(.customfont(.bold, fontSize: 26))
                        .foregroundStyle(Color.primaryApp)
                    
                    
                }
                Divider()
                
                if cartItems.isEmpty{
                    Text("Your cart is Empty")
                        .font(.customfont(.semibold, fontSize: 20))
                        .foregroundStyle(Color.primaryApp)
                }else{
                    ForEach(cartItems){ result in
                        ProductListView(product: result)
                        
                    }
                             
                }
                
                Spacer()
            }
            .padding(.top, 30)
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
            .ignoresSafeArea()
        }
        
        
        
        
    }
}

#Preview {
    CartView()
        .environmentObject(CartViewModel())
}
