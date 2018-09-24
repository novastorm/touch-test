//
//  ViewController.swift
//  touchtest
//
//  Created by Adland Lee on 9/20/18.
//  Copyright © 2018 4MFD. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var buttonA: UIButton!
    @IBOutlet weak var buttonB: UIButton!
    
    weak var currentButton: UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture(_:)))
        panGestureRecognizer.delegate = self
        view.addGestureRecognizer(panGestureRecognizer)
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture(_:)))
        tapGestureRecognizer.delegate = self
        view.addGestureRecognizer(tapGestureRecognizer)
        
        buttonA.backgroundColor = .gray
        buttonB.backgroundColor = .gray
    }
    
    @objc
    func handleTapGesture(_ gesture: UITapGestureRecognizer) {
        let touchPoint = gesture.location(in: view)
        let targetView = view.hitTest(touchPoint, with: nil)
        
        switch gesture.state {
        case .began:
            print("Tap Began")
            if targetView is UIButton {
                currentButton = targetView as? UIButton
                currentButton?.backgroundColor = .red
            }
        default:
            break
        }
    }
    
    @objc
    func handlePanGesture(_ gesture: UIPanGestureRecognizer) {
        let touchPoint = gesture.location(in: view)
        let targetView = view.hitTest(touchPoint, with: nil)
        
        switch gesture.state {
        case .began:
            print("Pan Began")
        case .changed:
//            print("Pan Changed")
            
            if targetView is UIButton && currentButton == nil {
                currentButton = targetView as? UIButton
                if let title = currentButton?.currentTitle {
                    print("Pan touch Enter: \(title)")
                }
                currentButton?.backgroundColor = .red
                currentButton?.sendActions(for: .touchDragEnter)
            }
            
            if currentButton != nil && !currentButton!.isEqual(targetView) {
                if let title = currentButton?.currentTitle {
                    print("Pan touch Exit: \(title)")
                }
                currentButton?.backgroundColor = .gray
                currentButton?.sendActions(for: .touchDragExit)
                currentButton = nil
            }
        case .ended:
            print("Pan Ended")
            currentButton?.sendActions(for: .touchUpInside)
            currentButton?.backgroundColor = .gray
            currentButton = nil
        case .cancelled:
            print("Pan Cancelled")
        case .failed:
            print("Pan Failed")
        default:
            fatalError()
        }
    }
    
    @IBAction func dragEnterA(_ sender: UIButton) {
        print("\(#function) \(sender.currentTitle!)")
    }
    @IBAction func dragExitA(_ sender: UIButton) {
        print("\(#function) \(sender.currentTitle!)")
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
    }
    @IBAction func dragInsideB(_ sender: UIButton) {
//        print("\(#function) \(sender.currentTitle!)")
    }
    @IBAction func dragOutsideB(_ sender: UIButton) {
//        print("\(#function) \(sender.currentTitle!)")
    }
    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        print("view \(#function)", touches)
//        print("event", event!)
//        super.touchesBegan(touches, with: event)
//    }
//
//    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
//        for touch in touches {
//            let touchPoint = touch.location(in: view)
//            let targetView = view.hitTest(touchPoint, with: nil)
//
//            if targetView is UIButton && currentButton == nil {
//                currentButton = targetView as? UIButton
//                if let title = currentButton?.currentTitle {
//                    print("View touch Enter: \(title)")
//                }
//                currentButton?.sendActions(for: .touchDragEnter)
//            }
//
//            if currentButton != nil && !currentButton!.isEqual(targetView) {
//                if let title = currentButton?.currentTitle {
//                    print("View touch Exit: \(title)")
//                }
//                currentButton?.sendActions(for: .touchDragExit)
//                currentButton = nil
//            }
//        }
//        super.touchesMoved(touches, with: event)
//    }
//
//    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//        currentButton = nil
//        super.touchesEnded(touches, with: event)
//    }
//
//    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
//        print("view \(#function)", touches, event as Any)
//        super.touchesCancelled(touches, with: event)
//    }
}

extension ViewController: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
