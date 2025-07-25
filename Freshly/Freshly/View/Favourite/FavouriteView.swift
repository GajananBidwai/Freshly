//
//  FavouriteView.swift
//  Freshly
//
//  Created by Neosoft on 08/07/25.
//

import SwiftUI

struct FavouriteView: View {
    var body: some View {
        ZStack{
            
            ScrollView{
                
            }
            
            VStack{
                HStack{
                    Spacer()
                    
                    Text("Favourite")
                         .font(.customfont(.bold, fontSize: 20))
                        . frame(height: 46)
                    
                    Spacer()
                }
                .padding(.top, .topInsets)
                .background(Color.white)
                .shadow(color: Color.black.opacity(0.2), radius: 2)
                
                Spacer()
            }
        }
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
}

#Preview {
    FavouriteView()
}
