//
//  ViewController.swift
//  AnimationApp
//
//  Created by Alexey Efimov on 19/08/2019.
//  Copyright © 2019 Alexey Efimov. All rights reserved.
//

import Spring

class ViewController: UIViewController {

    @IBOutlet var coreAnimationView: UIView!
    
    @IBOutlet var springView: SpringView!
    @IBOutlet var springButton: SpringButton!
    
    private var originCoordinate: CGFloat?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        originCoordinate = coreAnimationView.frame.origin.x
        springView.animate()
        springButton.animate()
    }

    @IBAction func startCoreAnimation(_ sender: UIButton) {
        sender.pulsate()
        
        
        
        UIView.animate(withDuration: 0.5, delay: 0, options: [.autoreverse, .repeat], animations: {
            if self.coreAnimationView.frame.origin.x == self.originCoordinate {
                self.coreAnimationView.frame.origin.x -= 40
            } else {
                self.coreAnimationView.frame.origin.x += 40
            }
        })
    }
    
    @IBAction func startSpringButton(_ sender: SpringButton) {
        springView.animation = "wobble"
        springView.curve = "easeIn"
        springView.force = 2
        springView.duration = 1
        springView.delay = 0.3
        springView.animate()
        
        springButton.animation = "morph"
        springButton.curve = "easeOut"
        springButton.animate()
    }
}

