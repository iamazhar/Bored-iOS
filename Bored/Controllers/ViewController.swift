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
    @IBOutlet weak var activityButton: UIButton!
    
    var randomActivity: RandomActivity?
    
    @IBAction func filterButtonPressed(_ sender: Any) {
        Animations.animatePopUp(filterView: filterView, view: self.view, visualEffectView: visualEffectView)
        
    }
    
    @IBAction func closeButtonPressed(_ sender: Any) {
        Animations.animateOut(filterView: filterView, visualEffectView: visualEffectView)
    }
    
    @IBAction func loadActivityPressed(_ sender: Any) {
        UIView.animate(withDuration: 0.6, delay: 0.1, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.8, options: .curveEaseInOut, animations: {
            self.activityButton.transform = CGAffineTransform(scaleX: 30.0, y: 30.0)
        }) { (success) in
            print("Animation successful")
            self.loadNewActivity()
            UIView.animate(withDuration: 0.6, delay: 0.5, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.8, options: .curveEaseInOut, animations: {
                self.activityButton.transform = CGAffineTransform.identity
            })
        }
        
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
            self.activityLabel.isHidden = false
            self.activityButton.isHidden = false
            self.instructionLabel.isHidden = false
            
            self.view.backgroundColor = UIColor.randomFlat
            if let backgroundColor = self.view.backgroundColor{
                self.changeViewsColor(backgroundColor: backgroundColor)
            }
        }
    }

}

extension ViewController{
    func changeViewsColor(backgroundColor: UIColor){
        
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut, animations: {
            self.setStatusBarStyle(UIStatusBarStyleContrast)
            self.activityButton.backgroundColor = UIColor(contrastingBlackOrWhiteColorOn: backgroundColor, isFlat: true)
            
            self.activityLabel.textColor = UIColor(contrastingBlackOrWhiteColorOn: backgroundColor, isFlat: true)
            
            self.instructionLabel.textColor = UIColor(contrastingBlackOrWhiteColorOn: backgroundColor, isFlat: true)
            self.instructionLabel.alpha = 0.8
        }) { (success) in
            //
        }
    }
}

