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
        static let duration = 0.27;
        static let dismissPosition : CGFloat = -100;
    }
    
    struct Push {
        static let animateOption = UIViewAnimationOptions.curveEaseOut
        
    }
    
    struct Pop {
        static let animateOption = UIViewAnimationOptions.curveEaseInOut
    }
}
