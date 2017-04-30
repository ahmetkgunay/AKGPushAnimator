//
//  FirstViewController.swift
//  AKGPushAnimatorDemo
//
//  Created by AHMET KAZIM GUNAY on 30/04/2017.
//  Copyright © 2017 AHMET KAZIM GUNAY. All rights reserved.
//

import UIKit

class FirstViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showSecond" {
            navigationController?.delegate = self
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
