//
//  AKGPushAnimator.swift
//  AKGPushAnimatorDemo
//
//  Created by AHMET KAZIM GUNAY on 30/04/2017.
//  Copyright © 2017 AHMET KAZIM GUNAY. All rights reserved.
//

import UIKit

class AKGPushAnimator: NSObject, UIViewControllerAnimatedTransitioning {

    var isReverseTransition = false
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return AKGPushAnimatorConstants.Common.duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        let containerView = transitionContext.containerView
        let toVC = transitionContext.viewController(forKey: .to)!
        let fromVC = transitionContext.viewController(forKey: .from)!
        let toView = toVC.view!
        let fromView = fromVC.view!
        
        let screenWidth = UIScreen.main.bounds.width
        
        if !isReverseTransition {
            
            containerView.addSubview(fromView)
            containerView.addSubview(toView)
            
            toView.frame = CGRect(x      : screenWidth,
                                  y      : toView.frame.origin.y,
                                  width  : toView.frame.width,
                                  height : toView.frame.height)
            
            animate(withTransitionContext: transitionContext,
                    toView: toView,
                    fromView: fromView,
                    duration: AKGPushAnimatorConstants.Common.duration,
                    delay: 0,
                    options: AKGPushAnimatorConstants.Push.animateOption,
                    animations: {
                        
                        fromView.frame = CGRect(x      : AKGPushAnimatorConstants.Common.dismissPosition,
                                                y      : fromView.frame.origin.y,
                                                width  : fromView.frame.width,
                                                height : fromView.frame.height)
                        
                        toView.frame   = CGRect(x      : 0,
                                                y      : 0,
                                                width  : toView.frame.size.width,
                                                height : toView.frame.size.height)
            })
        }
        else {
            containerView.addSubview(toView)
            containerView.addSubview(fromView)
            
            toView.frame = CGRect(x      : AKGPushAnimatorConstants.Common.dismissPosition,
                                  y      : toView.frame.origin.y,
                                  width  : toView.frame.width,
                                  height : toView.frame.height)
            
            animate(withTransitionContext: transitionContext,
                    toView: toView,
                    fromView: fromView,
                    duration: AKGPushAnimatorConstants.Common.duration,
                    delay: 0,
                    options: AKGPushAnimatorConstants.Pop.animateOption,
                    animations: {
                        
                        fromView.frame = CGRect(x      : screenWidth,
                                                y      : fromView.frame.origin.y,
                                                width  : fromView.frame.width,
                                                height : fromView.frame.height)
                        
                        toView.frame   = CGRect(x      : 0,
                                                y      : 0,
                                                width  : toView.frame.size.width,
                                                height : toView.frame.size.height)
            })
        }
    }
}

private func animate(withTransitionContext transitionContext:UIViewControllerContextTransitioning,
                     toView: UIView!,
                     fromView: UIView!,
                     duration: TimeInterval,
                     delay: TimeInterval,
                     options: UIViewAnimationOptions = [],
                     animations: @escaping () -> Swift.Void) {
    
    UIView.animate(withDuration: duration,
                   delay: delay,
                   options: options,
                   animations: animations) { (finished) in
                    
                    if (transitionContext.transitionWasCancelled) {
                        toView.removeFromSuperview()
                    } else {
                        fromView.removeFromSuperview()
                    }
                    transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
    }
}
