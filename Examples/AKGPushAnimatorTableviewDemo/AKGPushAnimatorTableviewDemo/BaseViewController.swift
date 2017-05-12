//
//  BaseViewController.swift
//  AKGPushAnimatorTableviewDemo
//
//  Created by AHMET KAZIM GUNAY on 12/05/2017.
//  Copyright © 2017 AHMET KAZIM GUNAY. All rights reserved.
//

import UIKit
import AKGPushAnimator

class BaseViewController: UIViewController, UINavigationControllerDelegate {
    
    let pushAnimator = AKGPushAnimator()
    let interactionAnimator = AKGInteractionAnimator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if operation == .push {
            interactionAnimator.attachToViewController(toVC)
        }
        pushAnimator.isReverseTransition = operation == .pop
        return pushAnimator
    }
    
    func navigationController(_ navigationController: UINavigationController, interactionControllerFor animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return interactionAnimator.transitionInProgress ? interactionAnimator : nil
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
