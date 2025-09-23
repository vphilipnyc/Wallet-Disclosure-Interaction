//
//  MultiStateButton.swift
//  WalletDisclosure
//
//  Created by Sanguo Joseph Ledoux on 9/23/25.
//

import SwiftUI

struct MultiStateButton: View {
    @State private var buttonState = ButtonState.initial
    @Binding var walletAmount: Double
    @State private var progress = 0.0
    @Binding var activeCash: Int
    var button: Namespace.ID

    func handleButtonState() {
        if buttonState == .initial {
            buttonState = .processing
            Timer.scheduledTimer(
                withTimeInterval: 0.006,
                repeats: true,
            ) { timer in
                let increment = 1.0 / Double(2 / 0.01)
                progress += increment

                if progress >= 1.0 {
                    timer.invalidate()
                    withAnimation(
                        .bouncy(
                            duration: 0.3,

                        ).delay(0.2)
                    ) {
                        buttonState = .done

                    }
                    Timer.scheduledTimer(
                        withTimeInterval: 2,
                        repeats: false
                    ) { timer in
                        withAnimation(
                            .bouncy(
                                duration: 0.3,

                            )
                        ) {
                            buttonState = .initial
                            progress = 0
                            walletAmount +=
                                50.0 * Double(activeCash + 1)
                        }
                    }
                }
            }
        }
    }

    var body: some View {
        HStack {
            if buttonState == .initial {
                HStack {
                    Image(systemName: "plus")
                    Text("Add Cash")
                }
                .transition(
                    .asymmetric(
                        insertion: .offset(y: -50),
                        removal: .offset(y: -50)
                    )
                )
            } else if buttonState == .processing {

                ProgressView(value: progress, total: 1.0)
                    .progressViewStyle(LinearProgressViewStyle())
                    .tint(.white)
                    .frame(width: 45, )
                    .scaleEffect(2.3)
                    .transition(
                        .asymmetric(
                            insertion: .offset(y: 50),
                            removal: .offset(y: -50)
                        )
                    )
            } else {
                HStack {
                    Image(systemName: "checkmark.circle")
                    Text("Done")
                }
                .transition(
                    .asymmetric(
                        insertion: .offset(y: 50),
                        removal: .offset(y: 50)
                    )
                )
            }
            //

        }
        .onTapGesture {
            withAnimation(
                .bouncy(duration: 0.3, )
            ) {
                handleButtonState()
            }
        }
        .padding()
        .frame(width: 140, height: 55)
        .foregroundStyle(.white)
        .fontWeight(.bold)
        .background(.black.opacity(0.9))
        .clipShape(.rect(cornerRadius: 24))
        .matchedGeometryEffect(id: "button", in: button)
        .padding(.top)
    }
}
