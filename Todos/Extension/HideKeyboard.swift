//
//  HideKeyboard.swift
//  Todos
//
//  Created by 찌오 on 9/2/24.
//

import Foundation
import SwiftUI

extension UIApplication {
    func hideKeyboard() {
        guard let window = (connectedScenes.first as? UIWindowScene)?.windows.first else { return }
        let tapRecognizer = UITapGestureRecognizer(target: window, action: #selector(UIView.endEditing))
        tapRecognizer.cancelsTouchesInView = false
        tapRecognizer.delegate = self
        window.addGestureRecognizer(tapRecognizer)
    }
 }
 
extension UIApplication: UIGestureRecognizerDelegate {
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return false
    }
}
