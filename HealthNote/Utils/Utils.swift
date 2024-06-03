//
//  Utils.swift
//  HealthNote
//
//  Created by Fachmi Dimas Ardhana on 29/05/24.
//

import Foundation

func getCurrentDate() -> String {
    //let currentData = Date()
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "EEEE, d MMM yyyy"
    dateFormatter.timeZone = TimeZone.current
    
    let formattedDate = dateFormatter.string(from: Date())
    return formattedDate
}
