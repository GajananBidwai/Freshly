//
//  ProductDetailView.swift
//  Freshly
//
//  Created by Neosoft on 07/07/25.
//

import SwiftUI
import Kingfisher
import SwiftData

struct ProductDetailView: View {
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
   // @ObservedObject var productVM: ProductViewModel = ProductViewModel(context: ProductViewModel(context: modelContext))
    @State private var counter: Float = 1.0
    @State private var itemPrice: Float = 0
 //   @State var product: Product
    let product: ProductEntity
    @State var isShowDetail: Bool = false
    @State var isShowCategory: Bool = false
    @State var isFav: Bool = false
    @State var showToast = false
    @State var toastMassage = ""
    @EnvironmentObject var cartVM: CartViewModel
  //  @State var productData: ProductEntity
    @Environment(\.modelContext) private var modelContext
    @State private var buttonTitle = "Added to Cart"
    
    func showDetails(){
        isShowDetail = !isShowDetail
    }
    
    func showCategory(){
        isShowCategory = !isShowCategory
    }
    
    var body: some View {
        ZStack{
            
            ScrollView{
    
                    
                VStack{
                
                KFImage(URL(string: product.image)).placeholder {
                    ProgressView() // show a loading indicator while downloading
                }
                .resizable()
                .scaledToFit()
                .frame(height: .screenWidth * 0.8)
                .frame(maxWidth: .infinity)
                    
                    
               
                
                
                    HStack{
                        Text(product.title)
                            .font(.customfont(.bold, fontSize: 30))
                            .foregroundStyle(.black)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        
                        Button {
                            isFav = !isFav
                        } label: {
                            Image(isFav ? "favorite" : "fav")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                        }
                    }
                    
                    Text("\(product.price,specifier: "%.2f") price")
                        .foregroundStyle(Color.secondaryText)
                        .font(.customfont(.regular, fontSize: 20))
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    
                    HStack{
                        
                        
                        Button {
                            if counter > 1 {
                                counter -= 1
                                itemPrice = product.price * counter
                            }
                            
                            
                        } label: {
                            Image("subtack")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                                .padding(15)
                                .foregroundStyle(counter > 1 ? Color.primaryApp : Color.primaryText)
                                
                        }
                        
                        Text("\(Int(counter))")
                            .font(.customfont(.semibold, fontSize: 22))
                            .foregroundStyle(Color.primaryText)
                            .multilineTextAlignment(.center)
                            .frame(width: 45, height: 45, alignment: .center)
                            .overlay {
                                RoundedRectangle(cornerSize: CGSize(width: 16, height: 16 )).stroke(lineWidth: 1).opacity(0.4)
                            }
                            
                        
                        Button {
                            counter += 1
                            itemPrice = product.price * counter
                            
                        } label: {
                            Image("add_green")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                                .padding(15)
                                
                        }
                        Spacer()
                        
                        Text("\(itemPrice, specifier: "%.2f")")
                            .font(.customfont(.bold, fontSize: 28))
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
                            .foregroundStyle(Color.primaryText)
                    
                    }
                    .onAppear {
                        itemPrice = product.price
                        buttonTitle = product.isInCart ? "Removed from Cart" : "Added to Cart"
                        
                    }
                    .onChange(of: product.isInCart) { newValue in
                        buttonTitle = newValue ? "Remove from Cart" : "Add to Cart"
                    }
                    Divider()
                        
                }
                .padding(.horizontal, 20)
                .padding(.top, 15)
                
                VStack{
                    HStack{
                        Text("Product Detail")
                            .font(.customfont(.semibold, fontSize: 16 ))
                            .foregroundStyle(Color.primaryText)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        
                        Button {
                            withAnimation {
                                showDetails()
                            }
                        } label: {
                            Image(isShowDetail ? "detail_open" : "next")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 15, height: 15)
                                .padding(15)
                                .foregroundStyle(Color.primaryText)
                        }
                        
                    }
                    if(isShowDetail) {
                        Text(product.productDescription)
                            .font(.customfont(.medium, fontSize: 15))
                            .foregroundColor(.secondaryText)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.bottom , 8)
                    }
                    Divider()
                    
                
                    
                }
                .padding(.horizontal, 20)
                
                
                VStack{
                    HStack{
                        Text("Product Category")
                            .font(.customfont(.semibold, fontSize: 16 ))
                            .foregroundStyle(Color.primaryText)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        
                        Button {
                            withAnimation {
                                showCategory()
                            }
                        } label: {
                            Image(isShowCategory ? "detail_open" : "next")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 15, height: 15)
                                .padding(15)
                                .foregroundStyle(Color.primaryText)
                        }
                        
                    }
                    if(isShowCategory) {
                        Text(product.category)
                            .font(.customfont(.medium, fontSize: 16))
                            .foregroundColor(.secondaryText)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.bottom , 8)
                    }
                    Divider()
                }
                .padding(.horizontal, 20)
                
                
                VStack{
                    HStack{
                        Text("Review")
                            .font(.customfont(.semibold, fontSize: 16 ))
                            .foregroundStyle(Color.primaryText)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        
                        Spacer()
                        
                        Text("\(product.rating.rate, specifier: "%.0f")/5")
                            .font(.customfont(.bold, fontSize: 18))
                            
                        
                    }
                    Divider()
                    
                }
                .padding(.horizontal, 20)
                
                
                RoundedButton(title: buttonTitle, didTap: {
                    if product.isInCart{
                        cartVM.removeFromCart(product: product, context: modelContext)
                        showToast = true
                        toastMassage = "Removed from Cart"
                        buttonTitle = "Removed from Cart"
                        
                    }else {
                        cartVM.addToCart(product: product, context: modelContext)
                        showToast = true
                        toastMassage = "Added to Cart"
                        buttonTitle = "Added to Cart"
                    }
                })
                    .padding()
                
                
            }
            .toast(message: toastMassage, isPresented: $showToast)
            VStack{
                HStack{
                    
                    Button {
                        mode.wrappedValue.dismiss()
                    } label: {
                        Image("back")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                    }
                    
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        Image("share")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                    }
                    
                }
                
                Spacer()
            }
            .padding(.top, 20)
            .padding(.horizontal, 20)
            
        }
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        
        
    }
    
    
}
