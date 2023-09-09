//
//  ExchangeRate.swift
//  LOTR Converter
//
//  Created by Seymen Kiran on 08/09/2023.
//

import SwiftUI

struct ExchangeRate: View {
    
    @State var leftImage : String
    @State var text : String
    @State var rightImage : String
    
    var body: some View {
        HStack {
            //Left Currency Image
            Image(leftImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
            
            //Exchange Rate Text
            Text(text)
            
            //Right Currency Image
            Image(rightImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
            
        }
    }
}

#Preview {
    ExchangeRate(leftImage: "goldpenny", text: "1 Gold Penny = 4 Silver Pieces", rightImage: "silverpiece")
        .previewLayout(.sizeThatFits)
}

