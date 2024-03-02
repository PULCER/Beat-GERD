import SwiftUI

struct DisclaimerModalView: View {
    @Environment(\.modelContext) private var modelContext
    @Binding var isPresented: Bool
    @Query private var CustomUser
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Important Disclaimer")
                .font(.headline)
            
            Text("This app does not contain any medical advice. It is a habit tracking journal designed for informational purposes only and is not intended as a substitute for professional medical advice, diagnosis, or treatment.")
                .font(.body)
            
            Text("Consult Your Physician: Always seek the advice of your physician or other qualified health provider with any questions you may have regarding a medical condition.")
                .font(.body)
            
            Button("Accept and Continue") {
                CustomUserData.hasUserBeenShownWarningModal.toggle()
            }
            .padding()
            .foregroundColor(.white)
            .background(Color.blue)
            .cornerRadius(10)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 8)
    }
}
    

