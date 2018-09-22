//
//  ViewController.swift
//  touchtest
//
//  Created by Adland Lee on 9/20/18.
//  Copyright © 2018 4MFD. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    weak var currentButton: UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    

    @IBAction func dragEnterA(_ sender: UIButton) {
        print("\(#function) \(sender.currentTitle!)")
    }
    @IBAction func dragExitA(_ sender: UIButton) {
        print("\(#function) \(sender.currentTitle!)")
//        sender.resignFirstResponder()
    }
    @IBAction func dragInsideA(_ sender: UIButton) {
//        print("\(#function) \(sender.currentTitle!)")
    }
    @IBAction func dragOutsideA(_ sender: UIButton) {
//        print("\(#function) \(sender.currentTitle!)")
    }
    
    
    @IBAction func dragEnterB(_ sender: UIButton) {
        print("\(#function) \(sender.currentTitle!)")
    }
    @IBAction func dragExitB(_ sender: UIButton) {
        print("\(#function) \(sender.currentTitle!)")
        sender.resignFirstResponder()
    }
    @IBAction func dragInsideB(_ sender: UIButton) {
//        print("\(#function) \(sender.currentTitle!)")
    }
    @IBAction func dragOutsideB(_ sender: UIButton) {
//        print("\(#function) \(sender.currentTitle!)")
    }
    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        print("view \(#function)", touches, event)
//    }
//
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let touchPoint = touch.location(in: view)
            let targetView = view.hitTest(touchPoint, with: nil)
            
            if targetView is UIButton && currentButton == nil {
                currentButton = targetView as? UIButton
                print("Enter: \(currentButton?.currentTitle!)")
                currentButton?.sendActions(for: .touchDragEnter)
            }
            
            if currentButton != nil && !currentButton!.isEqual(targetView) {
                print("Exit: \(currentButton?.currentTitle!)")
                currentButton?.sendActions(for: .touchDragExit)
                currentButton = nil
            }
        }
    }
//
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        currentButton = nil
    }
//
//    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
//        print("view \(#function)", touches, event)
//    }
}

