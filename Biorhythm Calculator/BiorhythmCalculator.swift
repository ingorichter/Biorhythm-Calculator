//
//  BiorhythmCalculator.swift
//  Biorhythm Calculator
//
//  Created by Ingo Richter on 5/22/21.
//

import Foundation

struct BRValue {
    var physical: Double
    var emotional: Double
    var intellectual: Double
    var birthdate: Date
    var targetdate: Date
    
    init(physical: Double = 0.0, emotional: Double = 0.0, intellectual: Double = 0.0, birthDate: Date = Date(), targetDate: Date = Date()) {
        self.physical = physical
        self.emotional = emotional
        self.intellectual = intellectual
        self.birthdate = birthDate
        self.targetdate = targetDate
    }
}

class BiorhythmCalculator {
    static func calcBiorhythm(birthdate: Date, targetdate: Date) -> BRValue {
        let daysBetweenDates = Int(targetdate.timeIntervalSince(birthdate) / 60 / 60 / 24)
        print(daysBetweenDates)
        
        let twoPi = 2 * Double.pi
        let physical = sin(twoPi * Double(daysBetweenDates) / 23)
        let emotional = sin(twoPi * Double(daysBetweenDates) / 28)
        let intellectual = sin(twoPi * Double(daysBetweenDates) / 33)

        
        let value = BRValue(physical: physical, emotional: emotional, intellectual: intellectual, birthDate: birthdate, targetDate: targetdate)
        
        print("BR \(value)")
        
        return value
    }
}
