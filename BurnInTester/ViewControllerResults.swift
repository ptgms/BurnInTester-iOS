//
//  ViewControllerResults.swift
//  BurnInTester
//
//  Created by ptgms on 04.05.20.
//  Copyright © 2020 ptgms. All rights reserved.
//

import UIKit

class ViewControllerResults: UIViewController {

    @IBOutlet weak var marks: UISegmentedControl!
    @IBOutlet weak var UhOh: UIView!
    @IBOutlet weak var text1: UILabel!
    @IBOutlet weak var text2: UILabel!
    @IBOutlet weak var infoRes: UILabel!
    @IBOutlet weak var infoModel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UhOh.isHidden = false
        UhOh.alpha = 0.0
        let screenSize = UIScreen.main.bounds
        infoRes.text = "screensize".localized + screenSize.width.description + "x" + screenSize.height.description
        infoModel.text = "iphonemodel".localized + modelIdentifier()
        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func marksChanged(_ sender: Any) {
        switch marks.selectedSegmentIndex {
        case 0:
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseIn, animations: {
                self.UhOh.alpha = 0.0
            }, completion: nil)
            self.text1.text = "awesome".localized
            self.text2.text = "screenworks".localized
        case 1:
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseIn, animations: {
                self.UhOh.alpha = 1.0
            }, completion: nil)
            self.text1.text = "damn".localized
            self.text2.text = "screenbroke".localized
        default:
            exit(-1)
        }
        print(marks.selectedSegmentIndex)
    }
    
    func modelIdentifier() -> String {
        if let simulatorModelIdentifier = ProcessInfo().environment["SIMULATOR_MODEL_IDENTIFIER"] { return simulatorModelIdentifier }
        var sysinfo = utsname()
        uname(&sysinfo) // ignore return value
        return String(bytes: Data(bytes: &sysinfo.machine, count: Int(_SYS_NAMELEN)), encoding: .ascii)!.trimmingCharacters(in: .controlCharacters)
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
