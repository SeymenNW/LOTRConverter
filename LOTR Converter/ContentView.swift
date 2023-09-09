//LOTR Converter for iOS 17.0.
// Useless App but good for learning Swift.

import SwiftUI

struct ContentView: View {
    @State var leftAmount = ""
@State var rightAmount = ""
    
    @State var leftCurrency : Currency = .silverPiece
    @State var rightCurrency : Currency = .goldPenny
    
    @State var showSelectCurrency = false
    @State var showExchangeInfo = false
    
    @State var leftAmountTemp = ""
    @State var rightAmountTemp = ""
    
    @State var leftTyping = false
    @State var rightTyping = false
    
    
    
    var body: some View {
        ZStack {
            // Background IMage goes here
            Image("background")
                .resizable()
                .ignoresSafeArea(.all)
                 
            
            
            
            VStack {
                //Prancing Pony
                Image("prancingpony")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                
                
                //Currency Exchange Text
                Text("Currency Exchange")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                
                
                // Currency Conversion Section
                HStack {
                    //LEFT Conversion Section
                    VStack{
                        
                        
                        
                        
                        
                        HStack {
                            Image(CurrencyImage.allCases[Currency.allCases.firstIndex(of: leftCurrency)!].rawValue)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                            
                            Text(CurrencyText.allCases[Currency.allCases.firstIndex(of: leftCurrency)!].rawValue)
                                .font(.headline)
                                .foregroundColor(.white)
                            
                        }
                        .padding(.bottom, -5)
                        .onTapGesture {
                            showSelectCurrency.toggle()
                        }
                        .sheet(isPresented: $showSelectCurrency) {
                            SelectCurrency(leftCurrency: $leftCurrency, rightCurrency: $rightCurrency )
                        }
                        
                        TextField("Amount", text: $leftAmount, onEditingChanged:{
                            typing in
                            leftTyping = typing
                            leftAmountTemp = leftAmount
                        })
                            .padding(7)
                            .background(Color(UIColor.systemGray6))
                            .cornerRadius(20)
                            .keyboardType(.decimalPad)
                            .onChange(of: leftTyping ? leftAmount : leftAmountTemp) {
                                _ in
                                rightAmount = leftCurrency.convert(amountString: leftAmount, to: rightCurrency)
                                
                            }
                            .onChange(of: leftCurrency) { _ in
                                leftAmount = rightCurrency.convert(amountString: rightAmount, to: leftCurrency)
                            }
                        
                    }
                    
                    //Equal Sign
                    Image(systemName: "equal")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                    
                    
                    //Right Conversion Section
                    VStack {
                        
                        //Currency
                        
                        HStack{
                            //Currency Image
                            Text(CurrencyText.allCases[Currency.allCases.firstIndex(of: rightCurrency)!].rawValue)
                                .foregroundColor(.white)
                                .font(.headline)
                            
                            
                            Image(CurrencyImage.allCases[Currency.allCases.firstIndex(of: rightCurrency)!].rawValue)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                                .multilineTextAlignment(.trailing)
                            
                            //Currency Text
                            
                            
                        }
                        .padding(.bottom, -5)
                        .onTapGesture {
                            showSelectCurrency.toggle()
                        }
                        .sheet(isPresented: $showSelectCurrency) {
                            SelectCurrency(leftCurrency: $leftCurrency, rightCurrency: $rightCurrency )
                        }
              
                        
                        TextField("Amount", text: $rightAmount, onEditingChanged: {
                            typing in
                            rightTyping = typing
                            rightAmountTemp = rightAmount
                        })
                            .padding(7)
                            .background(Color(UIColor.systemGray6))
                            .cornerRadius(20)
                            .multilineTextAlignment(.trailing)
                            .keyboardType(.decimalPad)
                            .onChange(of: rightTyping ? rightAmount : rightAmountTemp) {
                                _ in
                                leftAmount = rightCurrency.convert(amountString: rightAmount, to: leftCurrency)
                            }
                            .onChange(of: rightCurrency) { _ in
                                rightAmount = leftCurrency.convert(amountString: leftAmount, to: rightCurrency)
                            }
                    }
                    
                }
                .padding()	
                .background(.black.opacity(0.5))
                .cornerRadius(50)
                	
                Spacer()
                
                
                HStack {
                    Spacer()
                    Button {
                        showExchangeInfo.toggle()
                    } label: {
                        Image(systemName: "info.circle.fill")
                         
                    }
                    .foregroundColor(.white)
                .font(.largeTitle)
                .padding(.trailing) 
                .sheet(isPresented: $showExchangeInfo) {
                    ExchangeInfo()
                }
                    
                }
                
          
                }
            }
            
        }
    }
        
        struct ContentView_Previews: PreviewProvider {
            static var previews: some View {
                ContentView()
            }
        }
    
