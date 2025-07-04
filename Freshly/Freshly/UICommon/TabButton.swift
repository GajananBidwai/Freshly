//
//  TabButton.swift
//  Freshly
//
//  Created by Neosoft on 03/07/25.
//

import SwiftUI

struct TabButton: View {
    @State var title: String = "Title"
    @State var icon: String = "store_tab"
    var isSelect: Bool = false
    var didSelect: ( ()->() )?
    
    
    var body: some View {
        Button {
            debugPrint("Tab button tap")
            didSelect?()
        } label: {
            VStack{
                Image(icon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 25)
                
                Text(title)
                    .font(.customfont(.semibold, fontSize: 14))
                    
                    
            }
            .foregroundStyle(isSelect  ? Color.primaryApp : Color.primaryText)
            .frame(minWidth: 0, maxWidth: .infinity)
        }
    }
}

#Preview {
    TabButton()
}
