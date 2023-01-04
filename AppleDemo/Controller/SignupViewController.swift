//
//  SecondVC.swift
//  AppleDemo
//
//  Created by Goutham Boya on 27/12/22.
//

import UIKit

class SignupViewController: UIViewController {
    var validation = Validation()
    
    @IBOutlet weak var namefld: UITextField!
    @IBOutlet weak var emailfld:UITextField!
    @IBOutlet weak var passfld:UITextField!
    @IBOutlet weak var phone:UITextField!
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
        
        self.vw.layer.insertSublayer(gradientLayer, at:0)
        
        
    }
    
    @IBAction func create(_ sender: UIButton) {
        
            guard let name = namefld.text, let email = emailfld.text, let pass = passfld.text, let phone = phone.text else {
                return
            }
            let validateEmailId = self.validation.validateEmailId(emailID: email)
            if (validateEmailId == false) {
                print("Invalid mail")
                return
            }
            let validatePassword = self.validation.validatePassword(password: pass)
            if (validatePassword == false) {
                print("Incorrect Pass")
                return
            }
            let validateName = self.validation.validateName(name: name)
            if (validateName == false){
                print("Incorrect Name")
                return
            }
            let validaPhoneNumber = self.validation.validaPhoneNumber(phoneNumber: phone)
            if (validaPhoneNumber == false) {
            print("Phone No invalid")
            
            if (validateEmailId == true || validatePassword == true || validateName == true || validaPhoneNumber == true) {
                self.navigationController?.popToRootViewController(animated: true)
            }
        }
    
    }
}
