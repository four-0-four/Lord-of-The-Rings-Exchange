//
//  ExchangeRate.swift
//  LOTR Converter 18
//
//  Created by Sina on 2024-10-24.
//

import SwiftUI

struct ExchangeRate: View {
    let leftImage: ImageResource
    let exchangeText: String
    let rightImage: ImageResource
    
    var body: some View {
        HStack{
            //Left currency image
            Image(leftImage)
                .resizable()
                .scaledToFit()
                .frame(height:33)
            
            //Exchange rate text
            Text(exchangeText)
            
            //Right currency image
            Image(rightImage)
                .resizable()
                .scaledToFit()
                .frame(height:33)
        }
    }
}

#Preview{
    ExchangeRate(
        leftImage: .goldpiece,
        exchangeText: "1 Gold Piece = 4 Gold Pennies",
        rightImage: .goldpenny
    )
}

