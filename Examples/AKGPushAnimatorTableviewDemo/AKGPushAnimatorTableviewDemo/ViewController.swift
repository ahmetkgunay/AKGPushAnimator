//
//  ViewController.swift
//  AKGPushAnimatorTableviewDemo
//
//  Created by AHMET KAZIM GUNAY on 12/05/2017.
//  Copyright © 2017 AHMET KAZIM GUNAY. All rights reserved.
//

import UIKit
import AKGPushAnimator

class ViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "cellId")
        pushAnimator.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            navigationController?.delegate = self
        }
    }
    
    deinit {
        pushAnimator.delegate = nil
    }
}

extension ViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "showDetail", sender: nil)
    }
}

extension ViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
        cell.textLabel?.text = "\(indexPath.row + 1)"
        return cell
    }
}

extension ViewController : AKGPushAnimatorDelegate {
    
    func beganTransition() {
        print("bagan transition")
    }
    
    func cancelledTransition() {
        print("cancelled transition")
    }
    
    func finishedTransition() {
        print("finished transition")
    }
}

