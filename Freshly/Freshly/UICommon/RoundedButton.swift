//
//  RoundedButton.swift
//  Freshly
//
//  Created by Neosoft on 27/06/25.
//

import SwiftUI

struct RoundedButton: View {
    var title = "Title"
    var didTap: ()-> Void
    
    var body: some View {
        
        Button(action: didTap) {
            Text("\(title)")
                .font(.customfont(.regular, fontSize: 20))
                .foregroundColor(.white)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 60, maxHeight: 60)
                .background(Color.primaryApp)
                .cornerRadius(17, corner: .allCorners)
        }

        
        

    }
}

//#Preview {
//    RoundedButton(didTap: () -> Void)
//        .padding()
//}
