//
//  ViewController.swift
//  GestureExam01
//
//  Created by Hyohwan Seo on 2022/01/04.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        initGestures()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    private func setupViews() {
        view.backgroundColor = .yellow
    }
}

extension ViewController {
    
    private func initGestures() {
        let panGesture = UIPanGestureRecognizer()
        panGesture.addTarget(self, action: #selector(handlePanGesture(_:)))
        panGesture.delegate = self
        view.addGestureRecognizer(panGesture)
        
        let swipeLeftGesture = UISwipeGestureRecognizer()
        swipeLeftGesture.direction = .left
        swipeLeftGesture.addTarget(self, action: #selector(handleSwipeGesture(_:)))
        view.addGestureRecognizer(swipeLeftGesture)
        
        let swipeRightGesture = UISwipeGestureRecognizer()
        swipeRightGesture.direction = .right
        swipeRightGesture.addTarget(self, action: #selector(handleSwipeGesture(_:)))
        view.addGestureRecognizer(swipeRightGesture)
    }
    
    @objc
    private func handlePanGesture(_ gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: gesture.view)
        let trans: CGPoint = CGPoint(x: CGFloat(Int(translation.x * 10)) / 10.0 ,
                                     y: CGFloat(Int(translation.y * 10)) / 10.0)
        print("handlePanGesture \(gesture.state.description) \(trans)")
    }
    
    @objc
    private func handleSwipeGesture(_ gesture: UISwipeGestureRecognizer) {
        print("handleSwipeGesture \(gesture.description))")
    }
}

extension ViewController: UIGestureRecognizerDelegate {
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        if gestureRecognizer is UIPanGestureRecognizer {
            if otherGestureRecognizer is UISwipeGestureRecognizer {
                return true
            }
        }
        return false
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRequireFailureOf otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        if gestureRecognizer is UIPanGestureRecognizer {
            if otherGestureRecognizer is UISwipeGestureRecognizer {
                return true
            }
        }
        return false
    }
}

extension UIGestureRecognizer.State {
    
    var description: String {
        switch self {
        case .possible: return ".possible"
        case .began: return ".began"
        case .changed: return ".changed"
        case .ended: return ".ended"
        case .cancelled: return ".cancelled"
        case .failed: return ".failed"
        default: return ".(unknown)"
        }
    }
}
