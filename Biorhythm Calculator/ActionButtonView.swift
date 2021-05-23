//
//  ActionButtonView.swift
//  Biorhythm Calculator
//
//  Created by Ingo Richter on 5/22/21.
//

import SwiftUI

struct ActionButtonView: View {
    let onCalc: () -> Void
    let onReset: () -> Void

    var body: some View {
        HStack() {
            Button(action: onCalc, label: {
                Text("Calc")
                    .font(.title)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.blue, lineWidth: 2)
                    )
            })
            .padding(.horizontal)
            Button(action: onReset, label: {
                Text("Reset")
                    .font(.title)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.blue, lineWidth: 2)
                    )
            })
            .padding(.horizontal)
        }
    }
}

struct ActionButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ActionButtonView {
            print("calc called")
        } onReset: {
            print("reset called")
        }
    }
}
