//
//  BiorhythmValueView.swift
//  Biorhythm Calculator
//
//  Created by Ingo Richter on 5/22/21.
//

import SwiftUI

struct BiorhythmValueView: View {
    @Binding var brvalue: BRValue

    var targetDate: some View {
        VStack(alignment: .center, spacing: 0) {
            Text("Target Date")
                .modifier(TextModifier())
//            Spacer()
            Text(brvalue.targetdate, style: .date)
                .modifier(TextModifier())
        }
    }
    
    var physical: some View {
        VStack(alignment: .center, spacing: 0) {
            Text("Physical")
                .modifier(TextModifier())
//            Spacer()
            Text(brvalue.physical.toString())
                .modifier(TextModifier())
        }
    }
    
    var emotional: some View {
        VStack(alignment: .center, spacing: 0) {
            Text("Emotional")
                .modifier(TextModifier())
//            Spacer()
            Text(brvalue.emotional.toString())
                .modifier(TextModifier())
        }
    }
    
    var intellectual: some View {
        VStack(alignment: .center, spacing: 0) {
            Text("Intellectual")
                .modifier(TextModifier())
//            Spacer()
            Text(brvalue.intellectual.toString())
                .modifier(TextModifier())
        }
    }
    
    var body: some View {
        HStack {
            targetDate
            Spacer()
            physical
            Spacer()
            emotional
            Spacer()
            intellectual
        }
    }
}

struct TextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .multilineTextAlignment(.center)
            .padding(.vertical, 2.0)
            .font(.footnote)
            .allowsTightening(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
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
