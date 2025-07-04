//
//  SectionTitleAll.swift
//  Freshly
//
//  Created by Neosoft on 04/07/25.
//

import SwiftUI

struct SectionTitleAll: View {
    
    @State var title: String = "Title"
    @State var titleAll: String = "ViewAll"
    var didTap: (()->())?
    
    var body: some View {
        HStack{
            Text(title)
                .font(.customfont(.bold, fontSize: 24))
                .foregroundStyle(Color.primaryText)
            
            Spacer()
            
            Text(titleAll)
                .font(.customfont(.semibold, fontSize: 16))
                .foregroundStyle(Color.primaryApp)
        }
        .padding(20)
        .frame(height: 40)
    }
}

#Preview {
    SectionTitleAll()
        
}
