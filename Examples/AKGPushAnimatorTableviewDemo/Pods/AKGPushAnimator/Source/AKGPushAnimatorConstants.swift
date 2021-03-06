//
//  AKGPushAnimatorConstants.swift
//  AKGPushAnimatorDemo
//
//  Created by AHMET KAZIM GUNAY on 30/04/2017.
//  Copyright © 2017 AHMET KAZIM GUNAY. All rights reserved.
//

import UIKit

struct AKGPushAnimatorConstants {
    
    struct Common {
        static let duration = 0.27
        static let dismissPosition : CGFloat = -50
        static let shadowOpacity : Float = 1
        static let shadowColor : UIColor = .black
    }
    
    struct Push {
        static let animateOption : UIViewAnimationOptions = .curveEaseOut
        
    }
    
    struct Pop {
        static let animateOption : UIViewAnimationOptions = .curveEaseInOut
    }
}
