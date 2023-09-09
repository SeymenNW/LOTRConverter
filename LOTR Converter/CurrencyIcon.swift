//
//  CurrencyIcon.swift
//  LOTR Converter
//
//  Created by Seymen Kiran on 08/09/2023.
//

import SwiftUI

struct CurrencyIcon: View {
    @State var currencyIcon : String
    @State var currencyText : String
    var body: some View {
        ZStack {
            //Currency Image
            Image(currencyIcon)
                .resizable()
                .scaledToFit()
            
            //Currency Text
            VStack {
                
                Spacer()
                Text(currencyText)
                    .padding(3)
                    .font(.caption)
                .background(.brown.opacity(0.75))
            }
            
        }
        .padding(3)
        
        .frame(width: 100, height: 100)
        .background(.brown)
        .cornerRadius(25)    }
}

#Preview {
    CurrencyIcon(currencyIcon: "goldpenny", currencyText: "Gold Penny")
}
