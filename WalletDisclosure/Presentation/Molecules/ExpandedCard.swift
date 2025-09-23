//
//  ExpandedCard.swift
//  WalletDisclosure
//
//  Created by Sanguo Joseph Ledoux on 9/23/25.
//

import SwiftUI

struct CreditcardSection: View {
    @State private var activeCard = 0
    @Namespace var borderSwicth
    let images = ["visa", "mastercard"]
    var body: some View {
        ForEach(0..<2, id: \.self) { id in
            cardComponent(
                isActive: id == activeCard,
                borderSwicht: borderSwicth,
                image: images[id],
                cardNumbers: "\(id+1) 5 \(id*3) 8"
            )
            .onTapGesture {
                withAnimation(.bouncy(duration: 0.35)) {
                    activeCard = id
                }

            }
        }

    }
}

struct AddCashHeader: View {
    var body: some View {
        HStack {
            Text("Payment Mode")
                .foregroundStyle(.gray)
            Spacer()
            Button {
            } label: {
                HStack {
                    Image(systemName: "creditcard")

                    Text("Add Card")
                }
                .padding(10)
                .foregroundStyle(.black)
                .font(.subheadline.bold())
                .overlay(
                    RoundedRectangle(cornerRadius: 24)
                        .stroke(.gray)
                )

            }

        }
        .padding(.bottom)
    }
}

struct CashCardSection: View {
    @Namespace var cashborderSwicth
    @Binding var activeCash: Int
    var body: some View {
        Text("Cash")
            .padding(.top, 12)
            .padding(.bottom, 8)
            .foregroundStyle(.gray)

        HStack(spacing: 15, ) {
            ForEach(0..<3, id: \.self) { id in

                CashcardComponent(
                    isActive: activeCash == id,
                    id: id,
                    cashborder: cashborderSwicth
                )
                .onTapGesture {
                    withAnimation(.bouncy(duration: 0.35)) {
                        activeCash = id
                    }
                }

            }
        }
    }
}


struct ExpandedCard : View {
    @State private var activeCash = 1
    @Binding var walletAmount : Double
    var button : Namespace.ID
    var body: some View {
        VStack(alignment: .leading) {

            AddCashHeader()

            CreditcardSection()

            CashCardSection(activeCash: $activeCash)

            MultiStateButton(
                walletAmount: $walletAmount,
                activeCash: $activeCash,
                button: button
            )

        }
        .transition(
            .asymmetric(
                insertion: .offset(y: 70).combined(with: .opacity),
                removal: .identity
            )
        )
        .padding()
    }
}
