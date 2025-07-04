//
//  SignInView.swift
//  Freshly
//
//  Created by Neosoft on 30/06/25.
//

import SwiftUI
import CountryPicker

struct SignInView: View {
    
    @State var phoneNumber = ""
    @State var showPicker = false
    @State var countryObj: Country?
    @State var navigateToLogin =  false
    
    var body: some View {
        NavigationStack{
            ZStack{
                Image("bottom_bg")
                    .resizable()
                    .scaledToFit()
                    .frame(width: .screenWidth, height: .screenHeight)
                
                VStack(){
                    Image("sign_in_top")
                        .resizable()
                        .scaledToFit()
                    Spacer()
                }
                
                ScrollView{
                    VStack(alignment: .leading){
                        Text("Get your groceries with nectar")
                            .font(.customfont(.semibold, fontSize: 27))
                            .foregroundStyle(Color.primaryText)
                            .multilineTextAlignment(.leading)
                            .padding(.bottom, 25)
                        
                        HStack{
                            Button {
                                showPicker = true
                                
                            } label: {
                                if let countryObj = countryObj {
                                    
                                    Text("\(countryObj.isoCode.getFlag())")
                                        .font(.system(size: 35))
                                    
                                    Text("+\(countryObj.phoneCode)")
                                        .font(.customfont(.semibold, fontSize: 18))
                                        .foregroundStyle(Color.primaryText)
                                }   
                            }
                            
                            TextField("Enter Numer", text: $phoneNumber)
                                .frame(minWidth: 0, maxWidth: .infinity)
                            
                        }
                        
                        NavigationLink {
                            LoginView()
                        } label: {
                            Text("Continue with email Sign In")
                                .font(.customfont(.semibold, fontSize: 18))
                                .foregroundStyle(Color.white)
                                
                        }
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 60, maxHeight: 60)
                        .background(Color.init(hex: "5383EC"))
                        
                        .cornerRadius(15, corner: .allCorners)
                        .padding(.bottom, 8 )
                        
                        
                        NavigationLink {
                            SignUPView()
                        } label: {
                            Text("Continue with email Sign up")
                                .font(.customfont(.semibold, fontSize: 18))
                                .foregroundStyle(Color.white)
                        }
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 60, maxHeight: 60)
                        .background(Color.primaryApp)
                        
                        .cornerRadius(15, corner: .allCorners)
                        .padding(.bottom, 8 )

                        
                        Divider()
                            .padding(.bottom, 20)
                        
                        Text("Or connect with social media")
                            .font(.customfont(.semibold, fontSize: 14))
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .center )
                            .foregroundStyle(Color.textTitle )
                            .multilineTextAlignment(.leading)
                            .padding(.bottom, 25)
                        
                        Button {
                            
                            
                        } label: {
                            HStack{
                                Image("google_logo")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 20, height: 20)
                                
                                
                                Text("Continue with Google")
                                    .font(.customfont(.semibold, fontSize: 18))
                                    .foregroundStyle(.white)
                                    .multilineTextAlignment(.center)
                                
                                
                            }
                            
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 60, maxHeight: 60)
                            .background(Color.init(hex: "5383EC"))
                            
                            .cornerRadius(15, corner: .allCorners)
                            .padding(.bottom, 8 )
                        }
                            
                        
                        
                        
                        Button {
                            
                        } label: {
                            
                            Image("fb_logo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                            
                            
                            Text("Continue With Facebook")
                                .font(.customfont(.semibold, fontSize: 18))
                                .foregroundStyle(.white)
                                .multilineTextAlignment(.center)
                        }
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 60, maxHeight: 60)
                        .background(Color.init(hex: "4A66AC"))
                        .cornerRadius(15, corner: .allCorners)
                        
                        
                        
                    }
                    .padding(.horizontal, 20)
                    .frame(width: .screenWidth, alignment: .leading)
                    .padding(.top, .topInsets + .screenWidth * 0.7)
                }
            }
            .onAppear(perform: {
                self.countryObj = Country(phoneCode: "91", isoCode: "IN")
            })
            .sheet(isPresented: $showPicker, content: {
                CountryPickerUI(country: $countryObj)
            })
            .navigationTitle("")
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
            .ignoresSafeArea()
        }
    }
}

#Preview {
    SignInView()
}
