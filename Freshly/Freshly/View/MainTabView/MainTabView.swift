//
//  MainTabView.swift
//  Freshly
//
//  Created by Neosoft on 03/07/25.
//

import SwiftUI

struct MainTabView: View {
    @StateObject var homeViewModel = HomeViewModel.shared
    @StateObject var productViewModel = ProductViewModel()
    
    
    var body: some View {
        VStack{
            TabView(selection: $homeViewModel.selectedTab) {
                HomeView().tag(0)
                HomeView().tag(1)
                HomeView().tag(2)
                HomeView().tag(3)
                HomeView().tag(4)
                
                
                 
            }
            .onAppear {
                UIScrollView.appearance().isScrollEnabled = false
                productViewModel.fetchData()
                print(productViewModel.product)
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .onChange(of: homeViewModel.selectedTab) { newValue in
                debugPrint("selected tab: \(newValue)")
            }
            
            HStack{
                
                TabButton(title: "Store", icon: "store_tab", isSelect: homeViewModel.selectedTab == 0) {
                    
                    DispatchQueue.main.async {
                        withAnimation {
                            homeViewModel.selectedTab = 0
                        }
                    }
                }
                
                TabButton(title: "Explore", icon: "explore_tab", isSelect: homeViewModel.selectedTab == 1) {
                    DispatchQueue.main.async {
                        withAnimation {
                            homeViewModel.selectedTab = 1
                            
                        }
                    }
                }
                
                
                TabButton(title: "Cart", icon: "cart_tab", isSelect: homeViewModel.selectedTab == 2) {
                    DispatchQueue.main.async {
                        withAnimation {
                            homeViewModel.selectedTab = 2
                        }
                    }
                }
                
                
                TabButton(title: "Favourite", icon: "fav_tab", isSelect: homeViewModel.selectedTab == 3) {
                    DispatchQueue.main.async {
                        withAnimation {
                            homeViewModel.selectedTab = 3
                            
                        }
                    }
                }
                
                
                TabButton(title: "Account", icon: "account_tab", isSelect: homeViewModel.selectedTab == 4) {
                    DispatchQueue.main.async {
                        withAnimation {
                            homeViewModel.selectedTab = 4
                        }
                    }
                }
                
               
                
                

            }
            .padding(.top, 10)
            .padding(.horizontal, 10)
            .background(Color.white)
            .cornerRadius(15, corner: .allCorners)
            .padding(.bottom, .bottomInsets)
            .shadow(color: Color.black.opacity(0.15), radius: 3, x: 0, y: -2)
          
        }
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
}

#Preview {
    MainTabView()
}
