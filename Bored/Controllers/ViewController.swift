//
//  ViewController.swift
//  Bored
//
//  Created by Azhar Anwar on 06/09/18.
//  Copyright © 2018 Azhar Anwar. All rights reserved.
//

import UIKit
import ChameleonFramework

class ViewController: UIViewController {
    
    @IBOutlet var filterView: UIView!
    @IBOutlet weak var visualEffectView: UIVisualEffectView!
    @IBOutlet weak var activityLabel: UILabel!
    @IBOutlet weak var activityTypeLabel: UILabel!
    @IBOutlet weak var participantsLabel: UILabel!
    @IBOutlet weak var instructionLabel: UILabel!
    
    var randomActivity: RandomActivity?
    
    @IBAction func filterButtonPressed(_ sender: Any) {
        Animations.animatePopUp(filterView: filterView, view: self.view, visualEffectView: visualEffectView)
        
    }
    
    @IBAction func closeButtonPressed(_ sender: Any) {
        Animations.animateOut(filterView: filterView, visualEffectView: visualEffectView)
    }
    
    @IBAction func loadActivityPressed(_ sender: Any) {
        loadNewActivity()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadNewActivity()
    }
    
    func loadNewActivity(){
        DispatchQueue.main.async {
            self.randomActivity = APIService.shared.performActivityRequest()
            guard let activity = self.randomActivity else{return}
            self.activityLabel.text = activity.activity
            self.changeViewsColor()
        }
    }

}

extension ViewController{
    func changeViewsColor(){
        self.view.backgroundColor = UIColor.randomFlat
        if let backgroundColor = self.view.backgroundColor{
            self.setStatusBarStyle(UIStatusBarStyleContrast)
            activityLabel.textColor = UIColor(contrastingBlackOrWhiteColorOn: backgroundColor, isFlat: true)
            instructionLabel.textColor = UIColor(contrastingBlackOrWhiteColorOn: backgroundColor, isFlat: true)
            instructionLabel.alpha = 0.5
        }
    }
}

