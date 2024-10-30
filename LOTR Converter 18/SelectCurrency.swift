//
//  SwiftUIView.swift
//  LOTR Converter 18
//
//  Created by Sina on 2024-10-25.
//

import SwiftUI

struct SelectCurrency: View {
    @Environment(\.dismiss) var dismiss
    @Binding var selectedCurrencyFrom: Currency
    @Binding var selectedCurrencyTo: Currency
    
    var body: some View {
        ZStack{
            // parchment background image
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            
            VStack{
                //Text
                Text("Select the currency you are starting with:")
                    .fontWeight(.bold)
                
                //currency icons
                IconGrid(selectedCurrency: $selectedCurrencyFrom)
                
                //Text
                Text("Select the currency you would like to convert to:")
                    .fontWeight(.bold)
                
                //Currency icons
                IconGrid(selectedCurrency: $selectedCurrencyTo)
                
                //Done button
                Button("Done"){
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
                .tint(.brown)
                .font(.title)
                .padding()
                .foregroundStyle(.white)
            }
            .padding()
            .multilineTextAlignment(.center)
        }
    }
}

#Preview{
    SelectCurrency(selectedCurrencyFrom: .constant(.silverPenny), selectedCurrencyTo: .constant(.goldPiece))
}
