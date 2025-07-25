//
//  AlertView.swift
//  Freshly
//
//  Created by Neosoft on 15/07/25.
//

import SwiftUI

struct AlertView: View {
    @State private var showAlert = false
    let alertMassage: String
    let buttonText: String
    
    var body: some View {
        Button("Show Alert"){
            showAlert = true
        }
        .alert("Alert", isPresented: $showAlert) {
            Button(buttonText, role: .cancel){
                print("Button Tap")
            }
        } message: {
            Text(alertMassage)
        }



    }
}

#Preview {
    AlertView(alertMassage: "Alert", buttonText: "Okay")
}
