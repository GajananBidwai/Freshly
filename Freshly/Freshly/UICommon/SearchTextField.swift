//
//  SearchTextField.swift
//  Freshly
//
//  Created by Neosoft on 03/07/25.
//

import SwiftUI

struct SearchTextField: View {
    
    @State var placeholder: String = "PlaceHolder"
    @Binding var text: String
    
    var body: some View {
        HStack(spacing: 15){
            Image("search")
                .resizable()
                .frame(width: 20, height: 20)
            
            
            TextField(placeholder, text: $text)
                .font(.customfont(.regular, fontSize: 17))
                .frame(minWidth: 0, maxWidth: .infinity)
                .autocorrectionDisabled(false)
                .autocapitalization(.none)
                
        }
        .frame(height: 30 )
        .padding(15)
        .background(Color(hex: "F2F3F2"))
        .cornerRadius(16, corner: .allCorners)
    }
}

#Preview {
    @Previewable @State var txt: String = ""
    SearchTextField(text: $txt)
}
