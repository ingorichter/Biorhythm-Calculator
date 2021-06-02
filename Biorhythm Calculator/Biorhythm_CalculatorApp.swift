//
//  Biorhythm_CalculatorApp.swift
//  Biorhythm Calculator
//
//  Created by Ingo Richter on 5/21/21.
//

import SwiftUI

@main
struct Biorhythm_CalculatorApp: App {
    @State private var birthdate = Date()
    @State private var targetdate = Date()
    @State private var brvalue = BRValue()

    var body: some Scene {
        WindowGroup {
            ContentView(birthdate: $birthdate, targetdate: $targetdate, brvalue: brvalue);
        }
    }
}
