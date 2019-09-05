//
//  ViewController.swift
//  Flo
//
//  Created by Jörg Klausewitz on 02.09.19.
//  Copyright © 2019 Jörg Klausewitz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var counterView: CounterView!
    @IBOutlet weak var counterLabel: UILabel!
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var graphView: GraphView!
    
    // MARK: - Properties
    var isGraphViewShowing = false
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        counterLabel.text = String(counterView.counter)

    }
    
    @IBAction func pushButtonPressed(_ button: PushButton){
        
        if button.isAddButton{
            counterView.counter += 1
        } else{
            if counterView.counter > 0{
                counterView.counter -= 1
            }
        }
        
        counterLabel.text = String(counterView.counter)
        
        if isGraphViewShowing{
            counterViewTap(nil)
        }
        
    }
    
    
    @IBAction func counterViewTap(_ gesture: UITapGestureRecognizer?) {
        if (isGraphViewShowing) {
            //hide Graph
            UIView.transition(from: graphView,
                              to: counterView,
                              duration: 1.0,
                              options: [.transitionFlipFromLeft, .showHideTransitionViews],
                              completion:nil)
        } else {
            //show Graph
            UIView.transition(from: counterView,
                              to: graphView,
                              duration: 1.0,
                              options: [.transitionFlipFromRight, .showHideTransitionViews],
                              completion: nil)
        }
        isGraphViewShowing = !isGraphViewShowing
    }



}

