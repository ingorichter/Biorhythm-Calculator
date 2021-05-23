//
//  DatesPickerView.swift
//  Biorhythm Calculator
//
//  Created by Ingo Richter on 5/22/21.
//

import SwiftUI

struct DatesPickerView: View {
    @Binding var birthdate: Date
    @Binding var targetdate: Date

    var body: some View {
        VStack {
            DatePicker("Birth Date", selection: $birthdate, displayedComponents: [.date])
                .padding(.horizontal)
            DatePicker("Target Date", selection: $targetdate, displayedComponents: [.date])
                .padding(.horizontal)
        }
    }
}

struct DatesPickerView_Previews: PreviewProvider {
    @State static var birthdate = Date()
    @State static var targetdate = Date()

    static var previews: some View {
        DatesPickerView(birthdate: $birthdate, targetdate: $targetdate)
    }
}
