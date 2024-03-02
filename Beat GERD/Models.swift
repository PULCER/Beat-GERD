import Foundation
import SwiftData

@Model
final class Symptom {
    var UUID: UUID
    var timestamp: Date
    var symptomDescription: String = ""
    var isSymptomPresent: Bool = false
    
    init(UUID: UUID, timestamp: Date, symptomDescription: String, isSymptomPresent: Bool) {
        self.UUID = UUID
        self.timestamp = timestamp
        self.symptomDescription = symptomDescription
        self.isSymptomPresent = isSymptomPresent
    }
}

@Model
final class Treatment {
    var UUID: UUID
    var timestamp: Date
    var treatmentDescription: String = ""
    var isTreatmentPresent: Bool = false
    
    init(UUID: UUID, timestamp: Date, treatmentDescription: String, isTreatmentPresent: Bool) {
        self.UUID = UUID
        self.timestamp = timestamp
        self.treatmentDescription = treatmentDescription
        self.isTreatmentPresent = isTreatmentPresent
    }
}

@Model
final class CustomUserData {
    var hasUserAcceptedDisclaimer: Bool = false

    init(hasUserAcceptedDisclaimer: Bool) {
        self.hasUserAcceptedDisclaimer = hasUserAcceptedDisclaimer
    }
}
