import SwiftUI

struct DisclaimerModalView: View {
    @Environment(\.modelContext) private var modelContext
    var onAccept: () -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Important Disclaimer")
                .font(.title)
                .foregroundColor(.primary)
            
            Text("This app does not contain any medical advice. It is a habit tracking journal designed for informational purposes only and is not intended as a substitute for professional medical advice, diagnosis, or treatment.")
                .font(.system(size: 20))
                .foregroundColor(.secondary)
            
            Text("Consult Your Physician: Always seek the advice of your physician or other qualified health provider with any questions you may have regarding a medical condition.")
                   .font(.system(size: 20))
                .foregroundColor(.secondary)
            
            Button("Accept and Continue") {
                onAccept()
            }
            .font(.title2)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 20)
            .padding(.horizontal) 
            .foregroundColor(.white)
            .background(Color.blue)
            .cornerRadius(10)

        }
        .padding()
        .background(Color(UIColor.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 8)
    }
}
