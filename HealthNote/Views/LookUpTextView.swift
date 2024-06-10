//
//  LookUpTextView.swift
//  HealthNote
//
//  Created by Fachmi Dimas Ardhana on 09/06/24.
//

import UIKit
import SwiftUI

class LookUpTextView: UITextView {
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        isEditable = false // Make it non-editable
        isSelectable = true // Ensure it's selectable
        addGestureRecognizer(UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress(_:))))
    }
    
    @objc private func handleLongPress(_ gesture: UILongPressGestureRecognizer) {
        guard gesture.state == .began else { return }
        becomeFirstResponder()
        
        let menu = UIMenuController.shared
        if !menu.isMenuVisible {
            menu.showMenu(from: self, rect: gesture.view!.bounds)
        }
    }
    
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        if action == #selector(lookUp(_:)) {
            return true
        }
        return super.canPerformAction(action, withSender: sender)
    }
    
    @objc private func lookUp(_ sender: Any?) {
        guard let selectedTextRange = selectedTextRange else { return }
        let selectedText = text(in: selectedTextRange) ?? ""
        let referenceVC = UIReferenceLibraryViewController(term: selectedText)
        if let topController = UIApplication.shared.windows.first?.rootViewController {
            topController.present(referenceVC, animated: true, completion: nil)
        }
    }
}

struct LookUpTextViewRepresentable: UIViewRepresentable {
    let text: String
    
    func makeUIView(context: Context) -> LookUpTextView {
        let textView = LookUpTextView()
        textView.text = text
        textView.font = UIFont.preferredFont(forTextStyle: .footnote)
        textView.backgroundColor = UIColor.clear
        textView.isScrollEnabled = true // Adjust as needed
        textView.autoresizesSubviews = true
        return textView
    }
    
    func updateUIView(_ uiView: LookUpTextView, context: Context) {
        uiView.text = text
    }
}
