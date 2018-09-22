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
        
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture(_:)))
        view.addGestureRecognizer(panGestureRecognizer)
    }
    
    @objc func handlePanGesture(_ gesture: UIPanGestureRecognizer) {
        let point = gesture.location(in: view)
        let targetView = view.hitTest(point, with: nil)
        
        switch gesture.state {
        case .changed:
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
        case .ended:
            currentButton = nil
        default:
            break
        }
    }

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
}

