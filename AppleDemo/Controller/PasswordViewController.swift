//
//  ThirdVC.swift
//  AppleDemo
//
//  Created by Goutham Boya on 27/12/22.
//

import UIKit

class PasswordViewController: UIViewController {
    
    @IBOutlet var vw: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        setGradientBackground()
    }
    func setGradientBackground() {
        
        
        let colorTop =  UIColor(red: 44.0/255.0, green: 80.0/255.0, blue: 50.0/255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 180.0/255.0, green: 94.0/255.0, blue: 58.0/255.0, alpha: 1.0).cgColor
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.vw.bounds
        
        self.vw.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    @IBAction func save(_ sender: UIButton) {
    
        self.navigationController?.popToRootViewController(animated: true)
    }
}

