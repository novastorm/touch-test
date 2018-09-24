//
//  TestButton.swift
//  touchtest
//
//  Created by Adland Lee on 9/22/18.
//  Copyright © 2018 4MFD. All rights reserved.
//

import UIKit

class TestButton: UIButton {
    @IBAction func dragEnterA(_ sender: UIButton) {
        print("\(#function) \(sender.currentTitle!)")
    }
    @IBAction func dragExitA(_ sender: UIButton) {
        print("\(#function) \(sender.currentTitle!)")
        sender.resignFirstResponder()
    }
    @IBAction func dragInsideA(_ sender: UIButton) {
        //        print("\(#function) \(sender.currentTitle!)")
    }
    @IBAction func dragOutsideA(_ sender: UIButton) {
        //        print("\(#function) \(sender.currentTitle!)")
    }
}
