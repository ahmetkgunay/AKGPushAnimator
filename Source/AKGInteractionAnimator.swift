//
//  AKGInteractionAnimator.swift
//  AKGPushAnimatorDemo
//
//  Created by AHMET KAZIM GUNAY on 30/04/2017.
//  Copyright © 2017 AHMET KAZIM GUNAY. All rights reserved.
//

import UIKit

public class AKGInteractionAnimator: UIPercentDrivenInteractiveTransition {

    var navigationController: UINavigationController!
    var shouldCompleteTransition = false
    public var transitionInProgress = false
    
    public func attachToViewController(_ viewController: UIViewController) {
        navigationController = viewController.navigationController
        addGestureRecognizer(viewController.view)
    }
    
    fileprivate func addGestureRecognizer(_ view: UIView) {
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(AKGInteractionAnimator.handlePanGesture(_:)))
        panGesture.delegate = self
        view.addGestureRecognizer(panGesture)
    }
    
    @objc func handlePanGesture(_ gestureRecognizer: UIPanGestureRecognizer) {
        let viewTranslation = gestureRecognizer.translation(in: gestureRecognizer.view?.superview)
        let velocity : CGPoint = gestureRecognizer.velocity(in: gestureRecognizer.view)
        
        switch gestureRecognizer.state {
        case .began:
            transitionInProgress = true
            navigationController.popViewController(animated: true)
        case .changed:
            var const = CGFloat(viewTranslation.x / UIScreen.main.bounds.width * 1.0)
            const = min(1.0, max(0.0, const))
            shouldCompleteTransition = const > 0.5 || velocity.x > UIScreen.main.bounds.width
            update(const)
        case .cancelled, .ended:
            transitionInProgress = false
            if !shouldCompleteTransition || gestureRecognizer.state == .cancelled {
                cancel()
            } else {
                finish()
            }
        default:
            print("Swift switch must be exhaustive, thus the default")
        }
    }
}

extension AKGInteractionAnimator : UIGestureRecognizerDelegate {
    
    private func gestureRecognizerShouldBegin(_ gestureRecognizer: UIPanGestureRecognizer) -> Bool {
        let velocity : CGPoint = gestureRecognizer.velocity(in: gestureRecognizer.view)
        return fabs(velocity.x) > fabs(velocity.y) && fabs(velocity.x) > 0;
    }
}
