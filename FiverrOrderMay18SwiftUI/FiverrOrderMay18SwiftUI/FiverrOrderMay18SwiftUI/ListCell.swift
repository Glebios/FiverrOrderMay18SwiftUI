//
//  ListCell.swift
//  FiverrOrderMay18SwiftUI
//
//  Created by Gleb Serediuk on 21.05.2022.
//

import SwiftUI

struct ListCell: View {
    
    let title: String
    let description: String
    let value: String
    let icon: String?
    
    let action: (() -> ())?
    
    var body: some View {
        
        HStack(alignment: .top) {
            
            if let icon = icon {
                Image(icon)
                    .padding()
                    .scaledToFill()
                    .frame(width: 22, height: 22, alignment: .center)
            }
            
            VStack(alignment: .leading, spacing: 5) {
                Text(title)
                    .font(.title3)
                    .foregroundColor(.white)
                    .fontWeight(.medium)
                Text(description)
                    .font(.body)
                    .foregroundColor(.white)
                    .fontWeight(.medium)
            } //: VStack
            Spacer()
            
            Text(value)
                .font(.title3)
                .foregroundColor(.white)
                .fontWeight(.regular)
        } //: HStack
        .onTapGesture {
            action?()
        }
        .padding(.horizontal, 20)
    } //: Body
    
}


struct ListCell_Previews: PreviewProvider {
    static var previews: some View {
        ListCell(title: "Title", description: "Description", value: "Value", icon: nil, action: {print("action")})
            .background(.blue)
    }
}
