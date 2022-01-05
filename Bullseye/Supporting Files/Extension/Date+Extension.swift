//
//  Date+Extension.swift
//  Bullseye
//
//  Created by joel Alcantara on 30/12/21.
//

import Foundation
import SwiftUI

extension Date {
    var timeStringAMPM: String {
        DateFormatter(format: .timeStringAMPM).string(from: self)
    }
}

extension DateFormatter {
    
    public enum DateFormat: String {
        case timeStringAMPM = "h:mm a"
    }
    
    public convenience init(format: DateFormat) {
        self.init()
        dateFormat = format.rawValue
    }
}
