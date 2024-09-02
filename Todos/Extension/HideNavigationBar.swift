//
//  HideNavigationBar.swift
//  Todos
//
//  Created by Juan Kim on 9/2/24.
//

import Foundation
import SwiftUI

// navigationBar가 사라져도 slide로 뒤로가는 기능 살리기
extension UINavigationController: ObservableObject, UIGestureRecognizerDelegate {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }
    override open func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        navigationBar.isHidden = true
    }
    
    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
}
