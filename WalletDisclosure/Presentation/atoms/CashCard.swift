//
//  CashCard.swift
//  WalletDisclosure
//
//  Created by Sanguo Joseph Ledoux on 9/23/25.
//

import SwiftUI

struct CashcardComponent : View {
    var isActive : Bool
    var id : Int
    var cashborder : Namespace.ID
    var body: some View {
        Text("$\(50 * (id+1))")
            .padding(14)
            .frame(maxWidth: .infinity)
            .background(.gray.opacity(0.1))
            .clipShape(.rect(cornerRadius: 12))
            .overlay {
                if isActive {
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(.black, lineWidth: 2.5)
                        .matchedGeometryEffect(
                            id: "cash-border",
                            in: cashborder
                        )
                }
            }
    }
}
