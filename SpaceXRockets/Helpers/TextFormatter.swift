//
//  TextFormatter.swift
//  SpaceXRockets
//
//  Created by Dmitry Loginov on 04.03.2024.
//

import Foundation

enum DateFormat: String {
    case yyyyMMdd           = "yyyy-MM-dd"
    case MMddyyyy           = "MM/dd/yyyy"
    case yyyyMMddTHHmmssZ   = "yyyy-MM-dd'T'HH:mm:ssZ"
    case MMMMdyyyy          = "MMMM d, yyyy"
}

final class TextFormatter {
    
    static func convertDateFormat(date: String, from input: DateFormat, to output: DateFormat) -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US")
        formatter.dateFormat = input.rawValue
        
        let currentDate = formatter.date(from: date)
        formatter.dateFormat = output.rawValue
        
        let resultString = formatter.string(from: currentDate!)
        
        return resultString
    }
}
