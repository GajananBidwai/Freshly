//
//  HomeView .swift
//  Freshly
//
//  Created by Neosoft on 03/07/25.
//

import SwiftUI

struct HomeView: View {
    @StateObject var homeVM = HomeViewModel.shared
    @StateObject var productVM = ProductViewModel()
    var body: some View {
        ZStack{
            ScrollView{
                VStack{
                    Image("color_logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25)
                        
                    HStack{
                        Image("location")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 16, height: 16)
                            
                        Text("Pune, Maharashtra")
                            .font(.customfont(.semibold, fontSize: 20))
                    }
                    
                    SearchTextField(placeholder: "Search Store", text: $homeVM.txtSearch)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 10 )
                        
                }
                .padding(.top, .topInsets)
                
                Image("banner_top")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 115)
                    .padding(.horizontal, 20)
                
                SectionTitleAll(title: "Exclusive offer", titleAll: "View All") {
                     
                }
                .padding(.horizontal, 20)
                 
                ScrollView(.horizontal, showsIndicators: false){
                    LazyHStack(spacing: 15){
                        ForEach(productVM.product){ result in
                            ProductCell(productName: result.title, price: Double(result.price), imageUrl: result.image)
                            
                            
                            
                            
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 4)
                }
                .padding(.bottom, 15)
                
                SectionTitleAll(title: "Best Selling", titleAll: "View All") {
                    
                }
                .padding(.horizontal, 20)
                
                ScrollView(.horizontal, showsIndicators: false){
                    LazyHStack(spacing: 15){
                        ForEach(0...5, id: \.self){ result in
                            ForEach(productVM.product){ result in
                                ProductCell(productName: result.title, price: Double(result.price), imageUrl: result.image)
                                
                                
                            }
                            
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 4)
                }
                .padding(.bottom, 15)
                
                SectionTitleAll(title: "Groceries", titleAll: "View All") {
                    
                }
                .padding(.horizontal, 20)
                
                ScrollView(.horizontal, showsIndicators: false){
                    LazyHStack(spacing: 15){
                        ForEach(0...5, id: \.self){ result in
                            CategoryCell(color: Color.init(hex: "F8A44C")) {
                                
                            }
                            
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 4)
                }
                .padding(.bottom, 8)
                
                ScrollView(.horizontal, showsIndicators: false){
                    LazyHStack(spacing: 15){
                        ForEach(0...5, id: \.self){ result in
                            ForEach(productVM.product){ result in
                                ProductCell(productName: result.title, price: Double(result.price), imageUrl: result.image)
                                
                            }
                            
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 4)
                }
                .padding(.bottom, 15)
            }
        }
        .onAppear(perform: {
            productVM.fetchData()
        })
        .ignoresSafeArea()
    }
}

#Preview {
    HomeView()
}
