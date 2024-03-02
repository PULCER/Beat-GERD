import Foundation
import SwiftData

enum CorrelativeItemTypeEnum: String {
    case symptom = "Symptom"
    case treatment = "Treatment"
}

@Model
final class CorrelativeItem {
    var UUID: UUID
    var timestamp: Date
    var correlativeItemDescription: String = ""
    var isPresent: Bool = false
    var correlationType: String = "Symptom"
    var isSubmitted: Bool = false
    
    init(UUID: UUID, timestamp: Date, correlativeItemDescription: String, isPresent: Bool, type: String, isSubmitted: Bool) {
        self.UUID = UUID
        self.timestamp = timestamp
        self.correlativeItemDescription = correlativeItemDescription
        self.isPresent = isPresent
        self.correlationType = type
        self.isSubmitted = isSubmitted
    }
}

@Model
final class CustomUserData {
    var hasUserAcceptedDisclaimer: Bool = false

    init(hasUserAcceptedDisclaimer: Bool) {
        self.hasUserAcceptedDisclaimer = hasUserAcceptedDisclaimer
    }
}
