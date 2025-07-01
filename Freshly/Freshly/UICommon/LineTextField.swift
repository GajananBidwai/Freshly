//
//  LineTextField.swift
//  Freshly
//
//  Created by Neosoft on 30/06/25.
//

import SwiftUI

struct LineTextField: View {
    
    
    @State var title: String = "Title"
    @State var placeHolder: String = "Placeholder"
    @Binding var txt: String
    @State var keyBoardType: UIKeyboardType = .default
    @State var isPassword: Bool = false
    
    var body: some View {
        VStack{
            Text(title)
                .font(.customfont(.semibold, fontSize: 16))
                .foregroundStyle(Color.textTitle)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            
            if (isPassword){
                SecureField(placeHolder, text: $txt)
            }else {
                TextField(placeHolder, text: $txt)
                    .keyboardType(keyBoardType)
            }
            
            
            Divider()
        }
    }
}
 
struct LineSecureField: View {
    @State var title: String = "Title"
    @State var placholder: String = "Placholder"
    @Binding var txt: String
    @Binding var isShowPassword: Bool
    
    
    var body: some View {
        VStack {
            Text(title)
                .font(.customfont(.semibold, fontSize: 16))
                .foregroundColor(.textTitle)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            
            if (isShowPassword) {
                TextField(placholder, text: $txt)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .modifier( ShowButton(isShow: $isShowPassword))
                    
                    .frame(height:40)
            }else{
                SecureField(placholder, text: $txt)
                    .autocapitalization(.none)
                     .modifier( ShowButton(isShow: $isShowPassword))
                     .frame(height:40)
                
            }
            Divider()
        }
    }
}

#Preview {
    
    @Previewable @State var txt: String = ""
    
    LineTextField(txt: $txt)
        .padding(20)
}
