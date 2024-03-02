//
//  Item.swift
//  Beat GERD
//
//  Created by Anthony Howell on 3/2/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
