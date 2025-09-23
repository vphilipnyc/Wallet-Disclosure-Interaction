//
//  CompactCard.swift
//  WalletDisclosure
//
//  Created by Sanguo Joseph Ledoux on 9/23/25.
//

import SwiftUI

struct CompactAddCashcardContent : View {
    @Binding var isExpanded : Bool
    @Binding var walletAmount : Double
    var button : Namespace.ID
    var body: some View {
        HStack {
            ZStack {
                LinearGradient(
                    colors: [
                        .gray.opacity(0.06), .gray.opacity(0.11),
                        .gray.opacity(0.16),
                    ],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                Image(systemName: "wallet.bifold.fill")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundStyle(.black.opacity(0.5))
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.black)
                    )
            }
            .frame(width: 60, height: 60)
            .clipShape(.rect(cornerRadius: 14))
            VStack(alignment: .leading, ) {
                Text("Wallet")
                    .foregroundStyle(.gray)
                Text("$\(walletAmount.formatted())")
                    .contentTransition(.numericText())
                    .font(.title2.bold())
            }
            Spacer()
            if !isExpanded {
                Button {
                    withAnimation(.bouncy){
                        isExpanded.toggle()
                    }
                } label: {
                    HStack {
                        Image(systemName: "plus")
                        Text("Add Cash")
                    }
                    .padding()
                    .frame(width: 140, height: 55)
                    .foregroundStyle(.white)
                    .fontWeight(.bold)
                    .background(.black.opacity(0.9))
                    .clipShape(.rect(cornerRadius: 24))
                }

                .matchedGeometryEffect(id: "button", in: button)
            }else {
                Button{
                    withAnimation(.bouncy){
                        isExpanded = false
                    }
                } label: {
                    Image(systemName: "xmark")
                }
                .padding(8)
                .background(.gray.opacity(0.2))
                .foregroundStyle(.black)
                .clipShape(.circle)
                .transition(.offset(y:200).combined(with: .opacity))
            }
        }
        .padding()
    }
}
