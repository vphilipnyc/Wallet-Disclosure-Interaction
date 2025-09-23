//
//  ContentView.swift
//  WalletDisclosure
//
//  Created by Sanguo Joseph Ledoux on 9/23/25.
//

import SwiftUI


struct ContentView: View {
    @State private var visaDigits = " • • • • 6756"
    @State private var isExpanded = false
    @State private var walletAmount = 34.01

    @Namespace var button

    var body: some View {
        VStack(alignment: .leading) {
            CompactAddCashcardContent(
                isExpanded: $isExpanded,
                walletAmount: $walletAmount,
                button: button
            )
            if isExpanded {
                Divider()
                ExpandedCard(walletAmount: $walletAmount, button: button)
            }
        }
        .overlay(
            RoundedRectangle(cornerRadius: 28)
                .stroke(.black.opacity(0.4))
        )
        .padding()
    }
}




#Preview {
    ContentView()
}
