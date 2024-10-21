//
//  KeyboardResponsiveModifier.swift
//  Tata 1mg
//
//  Created by Yashom on 21/10/24.
//

import SwiftUI

import SwiftUI

// Custom modifier for keyboard handling
struct KeyboardResponsiveModifier: ViewModifier {
    @Binding var isKeyboardVisible: Bool // Bind this to the parent view
    @State private var keyboardOffset: CGFloat = 0
    
    func body(content: Content) -> some View {
        content
            .offset(y: -keyboardOffset) // Move the whole view when the keyboard appears
            .animation(.easeOut(duration: 0.3), value: keyboardOffset)
            .onAppear {
                observeKeyboard()
            }
            .onDisappear {
                removeKeyboardObservers()
            }
            .onTapGesture {
                // Dismiss keyboard when user taps outside text fields
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            }
    }
    
    // Observe keyboard show/hide events
    private func observeKeyboard() {
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main) { notification in
            if let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect {
                self.keyboardOffset = keyboardFrame.height / 4
                self.isKeyboardVisible = true
            }
        }
        
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main) { _ in
            self.keyboardOffset = 0
            self.isKeyboardVisible = false
        }
    }
    
    // Remove observers when the view disappears
    private func removeKeyboardObservers() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
}

extension View {
    // View extension to apply the keyboard-responsive modifier
    func keyboardResponsive(isKeyboardVisible: Binding<Bool>) -> some View {
        self.modifier(KeyboardResponsiveModifier(isKeyboardVisible: isKeyboardVisible))
    }
}
