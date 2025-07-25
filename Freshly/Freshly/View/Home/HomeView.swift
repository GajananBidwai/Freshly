//
//  HomeView .swift
//  Freshly
//
//  Created by Neosoft on 03/07/25.
//

import SwiftUI
import SwiftData

struct HomeView: View {
    @StateObject var homeVM = HomeViewModel.shared
    @Environment(\.modelContext) private var modelContext
    @StateObject var productVM: ProductViewModel
    @Query var productData: [ProductEntity]
    @State private var navigateToMensClothing = false
    @State private var navigateToJewelery = false
    @State private var navigateToWomensClothing = false
    @State private var navigateToElectronics = false
    @State private var showAlert = false
    @State private var showToast = false
    @State private var toastMassage = ""
    @EnvironmentObject var cartVM: CartViewModel

    
    var body: some View {
        let vm = ProductViewModel(context: modelContext)
        
        ScrollView{
            headerView
            
            Image("banner_top")
                .resizable()
                .scaledToFit()
                .frame(height: 115)
                .padding(.horizontal, 20)
            
            
            SectionTitleAll(title: "Mens Clothing",titleAll: "View All"){
                navigateToMensClothing = true
                
            }
            .navigationDestination(isPresented: $navigateToMensClothing, destination: {
                ProductGridView(product: productData.filter { $0.category == "men's clothing" })
            })
            .padding(.horizontal, 20)
            
            ScrollView(.horizontal, showsIndicators: false){
                LazyHStack(spacing: 15){
                    ForEach(productData.filter{ $0.category == "men's clothing" }, id: \.self){result in
                        NavigationLink(destination: ProductDetailView(product: result)) {
                            ProductCell(product: result) {
                                if result.isInCart{
                                    cartVM.removeFromCart(product: result, context: modelContext)
                                    showToast = true
                                    toastMassage = "Removed from Cart"
                                    
                                }else {
                                    cartVM.addToCart(product: result, context: modelContext)
                                  //  showAlert = true
                                    showToast = true
                                    toastMassage = "Added to Cart"
                                    
                                    
                                }
                                
                               
                            }
                        }
                        
                        
                    }
                    
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 4)
            }
            .padding(.bottom, 15)
            .toast(message: toastMassage, isPresented: $showToast)
            
            SectionTitleAll(title: "Jewelery",titleAll: "View All"){
                navigateToJewelery = true
                
            }
            .navigationDestination(isPresented: $navigateToJewelery, destination: {
                ProductGridView(product: productData.filter { $0.category == "jewelery" })
            })
            .padding(.horizontal, 20)
            
            ScrollView(.horizontal, showsIndicators: false){
                LazyHStack(spacing: 15){
                    ForEach(productData.filter { $0.category == "jewelery" }, id: \.self){result in
                        NavigationLink {
                            ProductDetailView(product: result)
                        } label: {
                            ProductCell(product: result) {
                                if result.isInCart{
                                    cartVM.removeFromCart(product: result, context: modelContext)
                                }else {
                                    cartVM.addToCart(product: result, context: modelContext)
                               //     showAlert = true
                                }
                            }
                        }
                        
                    }
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 4)
            }
            .padding(.bottom, 15)
            
            SectionTitleAll(title: "Groceries",titleAll: "View All"){
                
                
            }
            .padding(.horizontal, 20)
            
            ScrollView(.horizontal, showsIndicators: false){
                LazyHStack(spacing: 15){
                    ForEach(0...10, id: \.self){ result in
                        CategoryCell(color: Color.init(hex: "F8A44C")) {
                            
                        }
                        
                    }
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 4)
            }
            .padding(.bottom, 8)
            
            
            SectionTitleAll(title: "Women's Clothing",titleAll: "View All"){
                navigateToWomensClothing = true
                
            }
            .navigationDestination(isPresented: $navigateToWomensClothing, destination: {
                ProductGridView(product: productData.filter { $0.category == "women's clothing" })
            })
            .padding(.horizontal, 20)
            
            
            ScrollView(.horizontal, showsIndicators: false){
                LazyHStack(spacing: 15){
                    ForEach(productData.filter { $0.category == "women's clothing"},id: \.self){result in
                        NavigationLink {
                            ProductDetailView(product: result)
                        } label: {
                            ProductCell(product: result) {
                                if result.isInCart{
                                    cartVM.removeFromCart(product: result, context: modelContext)
                                }else {
                                    cartVM.addToCart(product: result, context: modelContext)
                              //      showAlert = true
                                    
                                }
                            }
                        }
                    }
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 4)
            }
            .padding(.bottom, 15)
            
            SectionTitleAll(title: "Electronics",titleAll: "View All"){
                navigateToElectronics = true
                
            }
            .navigationDestination(isPresented: $navigateToElectronics, destination: {
                ProductGridView(product: productData.filter { $0.category == "electronics" })
            })
            .padding(.horizontal, 20)
            
            ScrollView(.horizontal, showsIndicators: false){
                LazyHStack(spacing: 15){
                    ForEach(productData.filter { $0.category == "electronics"},id: \.self){result in
                        NavigationLink {
                            ProductDetailView(product: result)
                        } label: {
                            ProductCell(product: result) {
                                if result.isInCart{
                                    cartVM.removeFromCart(product: result, context: modelContext)
                                }else {
                                    cartVM.addToCart(product: result, context: modelContext)
                             //       showAlert = true
                                }
                            }
                        }
                    }
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 4)
            }
            .padding(.bottom, 15)
            
        }
        .alert("Cart", isPresented: $showAlert) {
            Button("Go cart", role: .cancel) {
                
            }
        } message: {
            Text("Product added successfully to the cart")
        }
        
        .onAppear(perform: {
            if productData.isEmpty{
                vm.context = modelContext
                productVM.fetchData()
            }
            
        })
        .ignoresSafeArea()
        
    }
    
    
    var headerView: some View {
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
    }
    
    
    
    
}
