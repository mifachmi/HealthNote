//
//  Utils.swift
//  HealthNote
//
//  Created by Fachmi Dimas Ardhana on 29/05/24.
//

import Foundation
import SwiftUI
import SwiftData

func getCurrentDate() -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "EEEE, d MMM yyyy"
//    dateFormatter.dateFormat = "EEEE, d MMM yyyy, HH:mm"
    dateFormatter.timeZone = TimeZone.current
    
    let formattedDate = dateFormatter.string(from: Date())
    return formattedDate
}

func compareDates(date1String: String) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "EEEE, d MMM yyyy"
//    dateFormatter.dateFormat = "EEEE, d MMM yyyy, HH:mm"
    dateFormatter.locale = Locale(identifier: "en_US_POSIX")
    
    if let date1 = dateFormatter.date(from: date1String),
       let currentDate = dateFormatter.date(from: getCurrentDate()) {
        if date1 < currentDate {
            return "Previous \(countDifferenceDay(first: currentDate, second: date1)) days"
        } else {
            return "Today"
        }
    } else {
        return "Past"
    }
}

func countDifferenceDay(first: Date, second: Date) -> Int {
    let difference = Calendar.current.dateComponents([.day, .hour, .minute, .second], from: first, to: second)
    
    if let day = difference.day,
       let hour = difference.hour,
       let minute = difference.minute,
       let second = difference.second {
        return day
    } else {
        return -1
    }
}

extension Binding {
    func optional() -> Binding<Value?> {
        Binding<Value?>(
            get: { self.wrappedValue },
            set: { newValue in
                if let newValue = newValue {
                    self.wrappedValue = newValue
                }
            }
        )
    }
}

enum SpeechLanguage: String {
    case indonesia = "id-ID"
    case english = "en-US"
}
