//
//  ProductGridView.swift
//  Freshly
//
//  Created by Neosoft on 14/07/25.
//

import SwiftUI

struct ProductGridView: View {
    @State var gridViewScrollView = false
    
    let product: [ProductEntity]
    var column = [GridItem(.flexible()), GridItem(.flexible())]
    var rows = [GridItem(.fixed(100)), GridItem(.fixed(100))]
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    var body: some View {
        NavigationStack{
            VStack{
                HStack{
                    Button {
                        mode.wrappedValue.dismiss()
                    } label: {
                        Image("back")
                            .resizable()
                            .frame(width: 10, height: 15)
                            .foregroundStyle(Color.black)
                    }
                    .padding(.horizontal, 13)
                    
                        
                    Spacer()
                    Button {
                        withAnimation {
                            gridViewScrollView = !gridViewScrollView
                        }
                        
                        
                    } label: {
                        Image(gridViewScrollView ? "gridView" : "tableView")
                            .resizable()
                            .frame(width: 20, height: 20, alignment: .trailing)
                        
                    }
                    .padding(.horizontal, 13)
                    
                }
                if gridViewScrollView {
                    ScrollView(){
                        LazyVGrid(columns: column) {
                            ForEach(product){ items in
                                ProductCell(product: items) {
                                    
                                }
                            }
                        }
                        .padding()
                    }
                } else {
                    
                    ScrollView {
                            VStack(spacing: 16) {
                                ForEach(product, id: \.self) { result in
                                    ProductListView(product: result)
                                }
                            }
                            .padding()
                        }
                    
                }
                
                Spacer()
                
            }
            .navigationTitle("Product")
            .navigationBarBackButtonHidden(true)
            .ignoresSafeArea()
            .padding()
                
            .onAppear {
                gridViewScrollView = true
            }
        }
       
        
        
    }
        
}

#Preview {
    ProductGridView(product: [ProductEntity(id: 1, title: "", price: 2.2, productDescription: "", category: "", image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg", quantity: 1, rating: RatingData(rate: 2.2, count: 2))])
}
