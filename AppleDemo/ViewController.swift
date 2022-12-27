//
//  ViewController.swift
//  login
//
//  Created by Goutham Boya on 21/12/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var vw: UIView!
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
        
        print("colorBottom =\(colorBottom)")
                
        self.vw.layer.insertSublayer(gradientLayer, at:0)
     
        
    }
}

class SecondVC: UIViewController {
    
    @IBAction func create(_ sender: UIButton) {
        
        print("Account Created")
    }
}

class ThirdVC: UIViewController{
    
    @IBAction func save(_ sender: UIButton) {
        print("Saved")
    }
    
    
}
