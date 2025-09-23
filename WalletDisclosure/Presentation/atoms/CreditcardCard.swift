//
//  CreditcardCard.swift
//  WalletDisclosure
//
//  Created by Sanguo Joseph Ledoux on 9/23/25.
//

import SwiftUI

struct cardComponent: View {
    var isActive: Bool
    var borderSwicht: Namespace.ID
    var image: String
    var cardNumbers : String
    var body: some View {
        HStack {
            Circle()
                .frame(width: 15, )
                .scaleEffect(isActive ? 1 : 0)
                .frame(width: 15, )
                .foregroundStyle(isActive ? .black : .white)
                .padding(5)
                .overlay(
                    Circle()
                        .stroke(.black, lineWidth: 3)
                )
            Text("• • • • \(cardNumbers)")
                .font(.title3)
                .fontWeight(.medium)
            Spacer()
            Image(image)
                .resizable()
                .frame(width: 45, height: image == "mastercard" ? 35 : 40, )

        }
        .frame(height: 55, )
        .padding(.horizontal, 16)
        .background(isActive ? .clear : .gray.opacity(0.08))
        .clipShape(.rect(cornerRadius: 14))
        .overlay {
            if isActive {
                RoundedRectangle(cornerRadius: 14, )
                    .stroke(.black,lineWidth:2)
                    .matchedGeometryEffect(id: "border", in: borderSwicht)
            }
        }
    }
}

