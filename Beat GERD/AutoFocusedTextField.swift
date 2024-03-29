import SwiftUI

struct AutoFocusTextField: UIViewRepresentable {
    class Coordinator: NSObject, UITextFieldDelegate {
        @Binding var text: String
        var didBecomeFirstResponder = false

        init(text: Binding<String>) {
            _text = text
        }

        func textFieldDidChangeSelection(_ textField: UITextField) {
            text = textField.text ?? ""
        }
    }

    @Binding var text: String
    var placeholder: String

    func makeCoordinator() -> Coordinator {
        Coordinator(text: $text)
    }

    func makeUIView(context: Context) -> UITextField {
        let textField = UITextField()
        textField.delegate = context.coordinator
        textField.placeholder = placeholder
        textField.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        return textField
    }

    func updateUIView(_ uiView: UITextField, context: Context) {
        uiView.text = text

        let size = uiView.sizeThatFits(CGSize(width: uiView.frame.width, height: .infinity))
        if size.height > uiView.frame.height * 1.5 {
            uiView.frame.size.height = size.height
        }

        if !context.coordinator.didBecomeFirstResponder {
            uiView.becomeFirstResponder()
            context.coordinator.didBecomeFirstResponder = true
        }
    }

    func resetFocusState(context: Context) {
        context.coordinator.didBecomeFirstResponder = false
    }
}
