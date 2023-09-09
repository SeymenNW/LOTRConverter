//
//  ExchangeInfo.swift
//  LOTR Converter
//
//  Created by Seymen Kiran on 02/09/2023.
//

import SwiftUI

struct ExchangeInfo: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
       
        ZStack {
            // Background Image
            
            Image("parchment")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .background(.brown)
            
            VStack {
                //Title Text
                Text("Exchange Rates")
                    .font(.largeTitle)
                
                //Body Text
                Text("Here at the Prancing pony place we are really happy that you chose us to do the hard tasks we're extremely happy so thank you so much and don't forget to recommend this app to your friends we'd feel really dissapointed if our app didn't make to thousdans of people!")
                    .padding(20)
                    .font(.title2)
                
                //Exchange Rates
               ExchangeRate(leftImage: "goldpiece", text: "1 Gold Piece = 4 Gold Pennies", rightImage: "goldpenny") 
                ExchangeRate(leftImage: "goldpenny", text: "1 Gold Penny = 4 Silver Pieces", rightImage: "silverpiece")
                
                ExchangeRate(leftImage: "silverpiece", text: "1 Silver Piece = 4 Silver Pennies", rightImage: "silverpenny")
                
                ExchangeRate(leftImage: "silverpenny", text: "1 Silver Penny = 100 Copper Pennies", rightImage: "copperpenny")
                
                
                
                //Done Button
                Button("Done") {
                    dismiss()
                }
                .padding(10)
                .font(.largeTitle)
                .frame(width: 130, height: 50)
                .background(.orange)
                .cornerRadius(30)
                .foregroundColor(.white)
                .fontWeight(.bold)
                
            }
            .foregroundColor(.black)
        }
    }
}



#Preview {
    ExchangeInfo()
    }
