//
//  ExchangeInfo.swift
//  LOTR Converter 18
//
//  Created by Sina on 2024-10-23.
//

import SwiftUI

struct ExchangeInfo: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack{
            // Background parchment image
            Image(.parchment)
                .resizable()
                .ignoresSafeArea(.all)
                .background(.brown)
            
            VStack{
                //title text
                Text("Exchange Rates")
                    .font(.largeTitle)
                    .tracking(2)
                
                //description text
                Text("Here at the Prancing Pony, we are happy to offer you a place where you can exchange all the known currencies in the entire world except one. We used to take Brandy Bucks, but after finding out that it was a person instead of a piece of paper, we realized it had no value to us. Below is a simple guide to our currency exchange rates:")
                    .font(.title2)
                    .padding()
                
                //exchange rates
                ExchangeRate(
                    leftImage: .goldpiece,
                    exchangeText: "1 Gold Piece = 4 Gold Pennies",
                    rightImage: .goldpenny
                )
                
                ExchangeRate(
                    leftImage:.goldpenny,
                    exchangeText: "1 Gold Penny = 4 Silver Pieces",
                    rightImage: .silverpiece
                )
                
                ExchangeRate(
                    leftImage: .silverpiece,
                    exchangeText: "1 Silver Piece = 4 Silver Pennies",
                    rightImage: .silverpenny
                )
                
                ExchangeRate(
                    leftImage: .silverpenny,
                    exchangeText: "1 Silver Penny = 100 Copper Pennies",
                    rightImage: .copperpenny
                )
                
                //done button
                Button("Done"){
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
                .tint(.brown)
                .font(.title)
                .padding()
                .foregroundStyle(.white)
            }
        }
        .foregroundStyle(.black)
    }
}

#Preview {
    ExchangeInfo()
}

