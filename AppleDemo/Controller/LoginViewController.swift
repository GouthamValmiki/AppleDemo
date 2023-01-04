//
//  ViewController.swift
//  login
//
//  Created by Goutham Boya on 21/12/22.
//

import UIKit

class LoginViewController: UIViewController,UITextFieldDelegate {
    
    var validation = Validation()
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var vw: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        email.delegate = self
        password.delegate = self
        password.isSecureTextEntry = true
        resetform()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == email {
            email.layer.borderWidth = 1
            email.layer.borderColor = UIColor.black.cgColor
            email.layer.shadowColor = UIColor.black.cgColor
            email.layer.shadowOpacity = 1
            email.layer.shadowRadius = 1
            email.layer.shadowOffset = CGSize(width: 3, height: 3)
        }else{
            email.layer.shadowOpacity = 0
            email.layer.shadowRadius = 0
            email.layer.shadowOffset = CGSize(width: 0, height: 0)
            
        }
        if textField == password {
            password.layer.borderWidth = 1
            password.layer.borderColor = UIColor.black.cgColor
            password.layer.shadowColor = UIColor.black.cgColor
            password.layer.shadowOpacity = 1
            password.layer.shadowRadius = 1
            password.layer.shadowOffset = CGSize(width: 3, height: 3)
        }else{
            password.layer.shadowOpacity = 0
            password.layer.shadowRadius = 0
            password.layer.shadowOffset = CGSize(width: 0, height: 0)
        }
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.borderWidth = 0
        textField.layer.borderColor = .none
    }
    func resetform(){
        email.text = ""
        password.text = ""
    }
    
    @IBAction func submitAction(_ sender: Any) {
        
        guard let email = email.text, let password = password.text else {
            return
        }
        let validateEmailId = self.validation.validateEmailId(emailID: email)
        if (validateEmailId == false) {
            print("Incorrect Name")
            return
        }
        let isValidatePass = self.validation.validatePassword(password: password)
        if (isValidatePass == false) {
            print("Incorrect Pass")
            return
        }
        if (validateEmailId == true || isValidatePass == true) {
            let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "LastViewController")
            self.present(nextVC!, animated: true)
            print("Success")
            resetform()
        }
    }
    
    class LastViewController: UIViewController {
        
    }
}
