//
//  ViewController.swift
//  BurnInTester
//
//  Created by ptgms on 04.05.20.
//  Copyright © 2020 ptgms. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var jumpResButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        #if DEBUG
        jumpResButton.isHidden = false
        jumpResButton.isEnabled = true
        #else
        jumpResButton.isHidden = true
        jumpResButton.isEnabled = false
        #endif
    }

    override var prefersStatusBarHidden: Bool {
        return false
    }
}

