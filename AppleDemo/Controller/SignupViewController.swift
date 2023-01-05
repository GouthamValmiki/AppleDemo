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
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
