//
//  LoginView.swift
//  Freshly
//
//  Created by Neosoft on 30/06/25.
//

import SwiftUI

struct LoginView: View {
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode >
    @StateObject var viewModel = MainViewModel.shared;
    @State private var isNavigate = false
    @StateObject private var loginVM = LoginViewModel()
    
    var body: some View {
        NavigationStack{
            ZStack{
                Image("bottom_bg")
                    .resizable()
                    .scaledToFill()
                    .frame(width: .screenWidth, height: .screenHeight)
                
                VStack{
                    Image("color_logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40)
                        .padding(.bottom, .screenWidth * 0.12)
                    
                    
                    Text("Loging")
                        .font(.customfont(.semibold, fontSize: 30))
                        .foregroundStyle(Color.primaryText)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, 4)
                    
                    Text("Enter your email and password")
                        .font(.customfont(.regular, fontSize: 16))
                        .foregroundStyle(Color.secondaryText)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, .screenWidth * 0.1)
                    
                    
                    LineTextField(title: "Email", placeHolder: "Enter your email address", txt: $loginVM.email, keyBoardType: .emailAddress)
                        .padding(.bottom, .screenWidth * 0.07)
                    
                    LineSecureField( title: "Password", placholder: "Enter your password", txt: $loginVM.password, isShowPassword: $viewModel.isShowPassoword)
                        .padding(.bottom, .screenWidth * 0.02)
                    
                    
                    Button {
                        
                    } label: {
                        Text("Forget Password?")
                            .foregroundStyle(Color.primaryText)
                            .font(.customfont(.semibold , fontSize: 15))
                            
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
                    .padding(.bottom, .screenWidth * 0.02)
                    
                    
                    RoundedButton(title: "Log in", didTap: {
                        loginVM.login { success in
                            if success{
                                isNavigate = true
                            }
                            else{
                                isNavigate = false
                            }
                        }
                        
                    })
                        .padding(.bottom, 15)
                        .navigationDestination(isPresented: $isNavigate) {
                            MainTabView() 
                        }
                    
                    NavigationLink {
                        SignUPView()
                    } label: {
                        HStack{
                            Text("Don't have an account?")
                                .font(.customfont(.semibold, fontSize: 16))
                                .foregroundStyle(Color.primaryText)
                            
                            Text("Sign up")
                                .font(.customfont(.semibold, fontSize: 16))
                                .foregroundStyle(Color.primaryApp)
                        }
                    }

                    
                    
                    
                    Spacer()
                }
                .padding(.top, .topInsets + 64)
                .padding(.horizontal, 20)
                .padding(.bottom, .bottomInsets)
                
                
                
                VStack{
                    HStack{
                        Button {
                            mode.wrappedValue.dismiss()
                         } label: {
                            Image("back")
                                .resizable()
                                .frame(width: 15, height: 20)
                                .scaledToFit()
                        }

                            
                        Spacer()
                    }
                    
                    Spacer()
                }
                .padding(.top, .topInsets)
                .padding(.horizontal, 20  )
            }
            .background(.white)
            .navigationTitle("")
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
            .ignoresSafeArea()
        }
        
    }
}

#Preview {
    LoginView()
}
