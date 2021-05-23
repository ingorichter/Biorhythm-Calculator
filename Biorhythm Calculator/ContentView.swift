//
//  ContentView.swift
//  Biorhythm Calculator
//
//  Created by Ingo Richter on 5/21/21.
//

import SwiftUI

struct ContentView: View {
    @Binding var birthdate: Date
    @Binding var targetdate: Date
    @Binding var brvalue: BRValue

    var body: some View {
        VStack {
            Form {
                Section(header: Text("Dates")) {
                    DatesPickerView(birthdate: $birthdate, targetdate: $targetdate)
                }
                Section {
                    ActionButtonView(onCalc: calc, onReset: reset)
                }
                Section {
                    BiorhythmValueView(brvalue: $brvalue)
                }
                Section {
                    GraphView()
                }
            }
        }
    }
}


extension ContentView {
    func calc() {
        brvalue = BiorhythmCalculator.calcBiorhythm(birthdate: birthdate, targetdate: targetdate)

        print("calc called")
    }
    
    func reset() {
        birthdate = Date()
        targetdate = Date()
        brvalue = BRValue()
        print("reset called")
    }
}

struct ContentView_Previews: PreviewProvider {
    @State static var birthdate = Date()
    @State static var targetdate = Date()
    @State static var brvalue = BRValue()

    static var previews: some View {
        ContentView(birthdate: $birthdate, targetdate: $targetdate,brvalue: $brvalue);
    }
}
