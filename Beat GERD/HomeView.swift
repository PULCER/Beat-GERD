import SwiftUI
import SwiftData

struct HomeView: View {
    @Environment(\.modelContext) private var modelContext
    @EnvironmentObject var navigationViewModel: NavigationViewModel
    @Query private var hasUserAcceptedDisclaimer: [CustomUserData]
    @State private var showDisclaimerModal = false
    
    var body: some View {
        VStack {
            Text("Home")
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
