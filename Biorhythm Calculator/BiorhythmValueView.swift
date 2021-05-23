//
//  BiorhythmValueView.swift
//  Biorhythm Calculator
//
//  Created by Ingo Richter on 5/22/21.
//

import SwiftUI

struct BiorhythmValueView: View {
    @Binding var brvalue: BRValue

    var body: some View {
        VStack {
            HStack {
                Text("Target Date")
                    .modifier(TextModifier())
                Text("Physical")
                    .modifier(TextModifier())
                Text("Emotional")
                    .modifier(TextModifier())
                Text("Intellectual")
                    .modifier(TextModifier())
            }
            .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)

            HStack {
                Text(brvalue.targetdate.description)
                    .modifier(TextModifier())
                Text(brvalue.physical.toString())
                    .modifier(TextModifier())
                Text(brvalue.emotional.toString())
                    .modifier(TextModifier())
                Text(brvalue.intellectual.toString())
                    .modifier(TextModifier())
            }
            .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
        }
        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
    }
}

struct TextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .multilineTextAlignment(.center)
            .padding(.horizontal)
    }
}

extension Double {
    func toString() -> String {
        return String(format: "%.3f", self)
    }
}

struct BiorhythmValueView_Previews: PreviewProvider {
    @State static var brValue = BRValue()

    static var previews: some View {
        BiorhythmValueView(brvalue: $brValue)
    }
}
