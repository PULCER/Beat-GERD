import SwiftUI
import SwiftData

struct HomeView: View {
    @Environment(\.modelContext) private var modelContext
    @EnvironmentObject var navigationViewModel: NavigationViewModel
    @Query private var hasUserAcceptedDisclaimer: [CustomUserData]
    @State private var showDisclaimerModal = false
    @Query private var CorrelativeItem: [CorrelativeItem]
    
    private var unsubmittedSymptoms: [CorrelativeItem] {
            CorrelativeItem.filter { !$0.isSubmitted && $0.correlationType == CorrelativeItemTypeEnum.symptom.rawValue }
        }
        
        private var unsubmittedTreatments: [CorrelativeItem] {
            CorrelativeItem.filter { !$0.isSubmitted && $0.correlationType == CorrelativeItemTypeEnum.treatment.rawValue }
        }

    
    var body: some View {
        VStack {
            VStack{
            Text("How Are You Feeling")
            
            List {
                Section(header: Text("Symptoms")) {
                    ForEach(unsubmittedSymptoms) { symptom in
                        Text(symptom.correlativeItemDescription)
                    }
                }
            }
            
            Text("What happened in the last 24 Hours?")
            
            List{
                Section(header: Text("Treatments")) {
                    ForEach(unsubmittedTreatments) { treatment in
                        Text(treatment.correlativeItemDescription)
                    }
                }
            }
        }
            
            Spacer()
        }
        .onAppear {
            updateShowDisclaimerModal()
        }
        .sheet(isPresented: $showDisclaimerModal) {
            DisclaimerModalView {
                acceptDisclaimer()
                showDisclaimerModal = false
            }
        }
    }
    
    private func updateShowDisclaimerModal() {
        showDisclaimerModal = hasUserAcceptedDisclaimer.isEmpty || !hasUserAcceptedDisclaimer.first!.hasUserAcceptedDisclaimer
    }
    
    private func acceptDisclaimer() {
        if let userData = hasUserAcceptedDisclaimer.first {
            userData.hasUserAcceptedDisclaimer = true
        } else {
            let newUserData = CustomUserData(hasUserAcceptedDisclaimer: true)
            modelContext.insert(newUserData)
        }
        
        do {
            try modelContext.save()
        } catch {
            print("Failed to update disclaimer status: \(error)")
        }
    }
}
