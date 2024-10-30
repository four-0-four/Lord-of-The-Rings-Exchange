//
//  ContentView.swift
//  LOTR Converter 18
//
//  Created by Sina on 2024-10-16.
//

import SwiftUI

struct ContentView: View {
    @State var showInfor: Bool = false
    @State var showConverter: Bool = false
    
    @State var leftAmount: String = ""
    @State var rightAmount: String = ""
    
    @State var leftCurrency: Currency = .silverPenny
    @State var rightCurrency: Currency = .goldPiece
    var body: some View {
        ZStack {
            Image(.background)
                .resizable()
                .ignoresSafeArea()
            VStack {
                Image("prancingpony")
                    .resizable()
                    .scaledToFit()
                    .frame(width:160, height: 250)
                    .padding(.vertical,5)
                
                Text("Currency Exchange")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                
                HStack{
                    currencyInput(
                        title: leftCurrency.name,
                        imageName: leftCurrency.image,
                        fromAmount: $leftAmount,
                        toAmount: $rightAmount,
                        fromCurrency: $leftCurrency,
                        toCurrency: $rightCurrency
                    )
                    
                    Image(systemName: "equal")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                    
                    currencyInput(
                        title: rightCurrency.name,
                        imageName: rightCurrency.image,
                        fromAmount: $rightAmount,
                        toAmount: $leftAmount,
                        fromCurrency: $rightCurrency,
                        toCurrency: $leftCurrency,
                        isLeft: false
                    )
                    }
                    .padding()
                    .background(.black.opacity(0.5))
                    .clipShape(.capsule)
                    .onTapGesture {
                        showConverter = true
                    }
                
                Spacer()
                
                HStack{
                    Spacer()
                    
                    Button(action: {
                        showInfor.toggle()
                    }){
                        Image(systemName: "info.circle.fill")
                            .foregroundColor(.white)
                            .font(.largeTitle)
                            .padding()
                    }
                    .padding(.horizontal)
                    .sheet(isPresented: $showInfor){
                        ExchangeInfo()
                    }
                    .sheet(isPresented: $showConverter){
                        SelectCurrency(selectedCurrencyFrom: $leftCurrency, selectedCurrencyTo: $rightCurrency)
                    }
                    .onChange(of:rightCurrency){
                        rightAmount = leftCurrency.convert(amountString: leftAmount, currency: rightCurrency)
                    }
                    .onChange(of:leftCurrency){
                        leftAmount = rightCurrency.convert(amountString: rightAmount, currency: leftCurrency)
                    }
                }
            }
        }
    }
}


struct currencyInput: View {
    var title: String
    var imageName: ImageResource
    
    @Binding var fromAmount: String
    @Binding var toAmount: String
    
    @Binding var fromCurrency: Currency
    @Binding var toCurrency: Currency
    
    @FocusState var isTyping
    
    var isLeft: Bool = true
    
    var body: some View{
        VStack{
            HStack{
                if(!isLeft){
                    Text(title)
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(minWidth:100)
                    Image(imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width:25,height:25)
                }else{
                    Image(imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width:25,height:25)
                    Text(title)
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(minWidth:100)
                }
            }
            .padding(.bottom,-2)
            
            TextField("", text: $fromAmount, prompt:
                        Text("Enter Amount")
                        .foregroundColor(.gray)
            )
                .keyboardType(.numberPad)
                .padding(.vertical,7)
                .padding(.horizontal, 15)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(.gray)
                )
                .frame(width:140)
                .focused($isTyping)
                .onChange(of: fromAmount){
                    if(isTyping){
                        toAmount = fromCurrency.convert(amountString: fromAmount, currency: toCurrency)
                    }
                }
                .foregroundColor(.white)
                .keyboardType(.decimalPad)
            
        }
    }
}

#Preview {
    ContentView()
}
