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
    @ObservedObject var brvalue = BRValue()
    
    var body: some View {
//        ZStack {
//            LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom)
//                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 20) {
                Form {
                    Section {
                        DatesPickerView(birthdate: $birthdate, targetdate: $targetdate)
                        ActionButtonView(onCalc: calc, onReset: reset)
                        BiorhythmValueView(brvalue: brvalue)
                    }
                }
                Spacer()
                GraphView()
                    .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxWidth: .infinity, minHeight: 0, idealHeight: 100, maxHeight: .infinity, alignment: .center)
                    .padding()
            }
        }
//    }
}

extension ContentView {
    func calc() {
        let temp = BiorhythmCalculator.calcBiorhythm(birthdate: birthdate, targetdate: targetdate)
        
        brvalue.$birthdate = temp.$birthdate
        brvalue.$emotional = temp.$emotional
        
        print("calc called")
    }
    
    func reset() {
        birthdate = Date()
        targetdate = Date()
        
        brvalue.birthdate = birthdate
        brvalue.targetdate = targetdate
        brvalue.emotional = 0.0
        brvalue.intellectual = 0.0
        brvalue.physical = 0.0
        print("reset called")
    }
}

struct ContentView_Previews: PreviewProvider {
    @State static var birthdate = Date()
    @State static var targetdate = Date()
    @State static var brvalue = BRValue()
    
    static var previews: some View {
        ContentView(birthdate: $birthdate, targetdate: $targetdate,brvalue: brvalue)
            .previewDevice("iPhone 8 Plus");
    }
}
