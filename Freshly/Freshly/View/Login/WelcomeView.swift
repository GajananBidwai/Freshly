//
//  WelcomeView.swift
//  Freshly
//
//  Created by Neosoft on 27/06/25.
//

import SwiftUI

struct WelcomeView: View {
    @EnvironmentObject var loginVM: LoginViewModel
    @State private var isNavigate = false
    
    var body: some View {
        NavigationStack{
            ZStack{
                Image("welcom_bg")
                    .resizable()
                
                VStack{
                    Spacer()
                    Image("app_logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60, height: 60)
                    
                    VStack{
                        Text("Welcome to our Store")
                            .font(.customfont(.bold, fontSize: 60))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                        
                        Text("Get Your Groceries in as fast as one hour")
                            .font(.customfont(.bold, fontSize: 16))
                            .foregroundColor(.white.opacity(0.7))
                            .padding(.bottom, 30)
                        
                        NavigationLink {
                            SignInView()
                        } label: {
                            RoundedButton(title: "Get Started") {
                                isNavigate = true
                            }
                            
                        }
                        .navigationDestination(isPresented: $isNavigate) {
                            SignInView()
                        }
                        
                        Spacer()
                            .frame(height: 80)
                    }
                    
                }
                .padding(.horizontal, 20)
            }
            .ignoresSafeArea()
        }
        
    }
}

#Preview {
    NavigationView {
        WelcomeView()
    }
    
}
