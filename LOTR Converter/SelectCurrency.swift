//
//  SelectCurrency.swift
//  LOTR Converter
//
//  Created by Seymen Kiran on 08/09/2023.
//

import SwiftUI

struct SelectCurrency: View {
    @Environment(\.dismiss) var dismiss
    @Binding var leftCurrency: Currency
    @Binding var rightCurrency: Currency
    @State var gridLayout = [GridItem(), GridItem(), GridItem()]
    var body: some View {
        ZStack {
            Image("parchment")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .background(.brown)
            
            VStack{
                Text("Select The Currency You Are Starting With")
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
               
          
                    IconGrid(currency: $leftCurrency)
                
                Text("Select The Currency You Would Like To Convert To")
                    IconGrid(currency: $rightCurrency)

                  
                       
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
                        
                    
                        
                        
                        
            
              
                //Currency Icons
                
                //Button DONE
            
            
            }
                
        }
    }


#Preview {
    SelectCurrency(leftCurrency: .constant(.silverPiece), rightCurrency: .constant(.goldPiece))
}
