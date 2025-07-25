//
//  SignUPView.swift
//  Freshly
//
//  Created by Neosoft on 01/07/25.
//

import SwiftUI

struct SignUPView: View {
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    @StateObject var viewModel = MainViewModel.shared;
    @StateObject var signUpVM = SignUpViewModel()
    @State var isNavigate = false
    @State var toastMassage = ""
    @State var showToast = false
    
    var body: some View {
        NavigationStack{
            ZStack{
                Image("bottom_bg")
                    .resizable()
                    .scaledToFill()
                    .frame(width: .screenWidth, height: .screenHeight)
                ScrollView{
                    VStack{
                        Image("color_logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40)
                            .padding(.bottom, .screenWidth * 0.12)
                        
                        
                        Text("Sign up")
                            .font(.customfont(.semibold, fontSize: 30))
                            .foregroundStyle(Color.primaryText)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.bottom, 4)
                        
                        Text("Enter your credential to continue ")
                            .font(.customfont(.semibold, fontSize: 16))
                            .foregroundStyle(Color.secondaryText)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.bottom, .screenWidth * 0.1)
                        
                        LineTextField(title: "Username", placeHolder: "Enter your username", txt: $signUpVM.nickName)
                            .padding(.bottom, .screenWidth * 0.07)
                        
                        LineTextField(title: "Email", placeHolder: "Enter your email address", txt: $signUpVM.email, keyBoardType: .emailAddress)
                            .padding(.bottom, .screenWidth * 0.07)
                        
                        LineSecureField( title: "Password", placholder: "Enter your password", txt: $signUpVM.password,isShowPassword: $viewModel.isShowPassoword)
                            .padding(.bottom, .screenWidth * 0.02)
                        
                        
                        VStack{
                            Text("By continuing you agree to our")
                                .font(.customfont(.medium, fontSize: 16))
                                .foregroundStyle(Color.secondaryText)
                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            
                            HStack{
                                Text("Term of Service")
                                    .font(.customfont(.medium, fontSize: 16))
                                    .foregroundStyle(Color.primaryApp)
                                //   .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                
                                Text("and")
                                    .font(.customfont(.medium, fontSize: 16))
                                    .foregroundStyle(Color.primaryText)
                                
                                Text("Privacy Policy.")
                                    .font(.customfont(.medium, fontSize: 16))
                                    .foregroundStyle(Color.primaryApp)
                                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            }
                            .padding(.bottom, .screenWidth * 0.02)
                        }
                    
                        RoundedButton(title: "Sign up", didTap: {
                            signUpVM.signUp { result in
                                if result == true{
                                    isNavigate = true
                                    showToast = true
                                    toastMassage = "Sign in SuccessFully...!"
                                }else {
                                    toastMassage = signUpVM.errorMassage
                                    showToast = true
                                    isNavigate = false
                                }
                            }
                        })
                        .padding(.bottom, 15)
                        .toast(message: toastMassage, isPresented: $showToast)
                        .navigationDestination(isPresented: $isNavigate) {
                            LoginView()
                        }
                        
                        
                        
                        NavigationLink {
                            
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
                    
                }
                
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
    SignUPView()
}
