//
//  AccountView.swift
//  Freshly
//
//  Created by Neosoft on 23/07/25.
//

import SwiftUI

struct AccountView: View {
    @StateObject var loginVM = LoginViewModel()
    
    var body: some View {
        List{
            Button {
                Task{
                    await loginVM.signOut()
                }
            } label: {
                Text("Log out")
                    
            }

        }
    }
}

#Preview {
    AccountView()
}
