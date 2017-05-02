//
//  AKGPushAnimator.swift
//  AKGPushAnimatorDemo
//
//  Created by AHMET KAZIM GUNAY on 30/04/2017.
//  Copyright © 2017 AHMET KAZIM GUNAY. All rights reserved.
//

import UIKit

public class AKGPushAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    var isReverseTransition = false
    
    // MARK: Variables with Getters
    
    var animatorScreenWidth : CGFloat {
        get {
            return UIScreen.main.bounds.width
        }
    }
    
    var animatorScreenHeight : CGFloat {
        get {
            return UIScreen.main.bounds.height
        }
    }
    
    var toViewPushedFrame : CGRect {
        get {
            return CGRect(x      : 0,
                          y      : 0,
                          width  : self.animatorScreenWidth,
                          height : self.animatorScreenHeight)
        }
    }
    
    var fromViewPushedFrame : CGRect {
        get {
            return CGRect(x      : AKGPushAnimatorConstants.Common.dismissPosition,
                          y      : 0,
                          width  : self.animatorScreenWidth,
                          height : self.animatorScreenHeight)
        }
    }
    
    var fromViewPopedFrame : CGRect {
        get {
            return CGRect(x      : self.animatorScreenWidth,
                          y      : 0,
                          width  : self.animatorScreenWidth,
                          height : self.animatorScreenHeight)
        }
    }
    
    var toViewPopedFrame : CGRect {
        get {
            return CGRect(x      : 0,
                          y      : 0,
                          width  : self.animatorScreenWidth,
                          height : self.animatorScreenHeight)
        }
    }
    
    // MARK: UIViewControllerAnimatedTransitioning
    
    public func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return AKGPushAnimatorConstants.Common.duration
    }
    
    public func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        let containerView = transitionContext.containerView
        
        guard let toVC = transitionContext.viewController(forKey: .to),
            let fromVC = transitionContext.viewController(forKey: .from),
            let toView = toVC.view,
            let fromView = fromVC.view else { return }
        
        if !isReverseTransition {
            
            containerView.addSubview(fromView)
            containerView.addSubview(toView)
            
            toView.frame = CGRect(x      : animatorScreenWidth,
                                  y      : toView.frame.origin.y,
                                  width  : animatorScreenWidth,
                                  height : animatorScreenHeight)
            
            animate(withTransitionContext: transitionContext,
                    toView: toView,
                    fromView: fromView,
                    duration: AKGPushAnimatorConstants.Common.duration,
                    delay: 0,
                    options: AKGPushAnimatorConstants.Push.animateOption,
                    animations: {
                        
                        fromView.frame = self.fromViewPushedFrame
                        toView.frame   = self.toViewPushedFrame
            })
        }
        else {
            containerView.addSubview(toView)
            containerView.addSubview(fromView)
            
            toView.frame = CGRect(x      : AKGPushAnimatorConstants.Common.dismissPosition,
                                  y      : toView.frame.origin.y,
                                  width  : animatorScreenWidth,
                                  height : animatorScreenHeight)
            
            animate(withTransitionContext: transitionContext,
                    toView: toView,
                    fromView: fromView,
                    duration: AKGPushAnimatorConstants.Common.duration,
                    delay: 0,
                    options: AKGPushAnimatorConstants.Pop.animateOption,
                    animations: {
                        
                        fromView.frame = self.fromViewPopedFrame
                        toView.frame   = self.toViewPopedFrame
            })
        }
    }
}

private func animate(withTransitionContext transitionContext:UIViewControllerContextTransitioning,
                     toView: UIView,
                     fromView: UIView,
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
