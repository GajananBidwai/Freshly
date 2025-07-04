//
//  CategoryCell.swift
//  Freshly
//
//  Created by Neosoft on 04/07/25.
//

import SwiftUI

struct CategoryCell: View {
    
    @State var color: Color = Color.yellow
    
    var didTab: ( () -> () )?
    
    var body: some View {
        HStack{
            Image("pulses")
                .resizable()
                .scaledToFit()
                .frame(width: 70, height: 70)
            
            Text("Pulses")
                .font(.customfont(.bold, fontSize: 15))
                .foregroundStyle(Color.primaryText)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                
        }
        .padding(15)
        .frame(width: 250, height: 100)
        .background(color.opacity(0.3))
        .cornerRadius(16, corner: .allCorners )
        
    }
}

#Preview {
    CategoryCell()
}
