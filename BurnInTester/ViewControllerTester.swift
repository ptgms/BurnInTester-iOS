//
//  ViewControllerTester.swift
//  BurnInTester
//
//  Created by ptgms on 04.05.20.
//  Copyright © 2020 ptgms. All rights reserved.
//

import UIKit

class ViewControllerTester: UIViewController {

    @IBOutlet var backGround: UIView!
    @IBOutlet weak var rotateInfo: UILabel!
    @IBOutlet weak var continueButton: UIButton!
    
    var screen = 0;
    var times = 0;
    override func viewDidLoad() {
        super.viewDidLoad()
        backGround.backgroundColor = UIColor.blue
        let gesture = UITapGestureRecognizer(target: self, action:  #selector(self.changeBack))
        self.backGround.addGestureRecognizer(gesture)
        rotateInfo.isHidden = true
        continueButton.isEnabled = false
        continueButton.isHidden = true
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    @objc func changeBack() {
        switch screen {
        case 0:
            screen += 1
            backGround.backgroundColor = UIColor.green
        case 1:
            screen += 1
            backGround.backgroundColor = UIColor.red
        case 2:
            screen += 1
            backGround.backgroundColor = UIColor.white
        case 3:
            screen += 1
            backGround.backgroundColor = UIColor.black
        case 4:
            screen = 5
            backGround.backgroundColor = UIColor.blue
            if (times==1) {
                rotateInfo.text = ""
                continueButton.isEnabled = true
                continueButton.isHidden = false
            }
            rotateInfo.isHidden = false
        case 5:
            if (times >= 1) {
                screen = 1
                backGround.backgroundColor = UIColor.green
            } else {
                break
            }
            break
        case 6:
            break;
        default:
            screen = 0
        }
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        if UIDevice.current.orientation.isLandscape {
            print("Landscape")
            rotateInfo.isHidden = true
            if (screen==5) {
                screen = 1
                backGround.backgroundColor = UIColor.green
                times += 1
            }
        } else {
            print("Portrait")
            rotateInfo.isHidden = true
            if (screen==5) {
                screen = 1
                backGround.backgroundColor = UIColor.green
                times += 1
            }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
