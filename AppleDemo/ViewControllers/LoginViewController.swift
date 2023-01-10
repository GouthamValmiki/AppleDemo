//
//  ViewController.swift
//  login
//
//  Created by Goutham Boya on 21/12/22.
//

import UIKit

class LoginViewController: UIViewController,UITextFieldDelegate {
    
    var validation = Validation()
    var DataManager = [Employee]()
    
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
    
    @IBAction func loginAction(_ sender: Any) {
        
        if email.text!.isEmpty && password.text!.isEmpty {
            //Alert saying "Please enter credentials"
            showAlert(title: "Alert", message: "Please enter credentials")
            return
        }
        let validateEmailId = self.validation.validateEmailId(emailID: email.text!)
        let isValidatePass = self.validation.validatePassword(password: password.text!)
        
        if !validateEmailId {
            showAlert(title: "Alert", message: "Please enter valid email address")
        }else if !isValidatePass {
            showAlert(title: "Alert", message: "Incorrect Password")
        }
        if (validateEmailId && isValidatePass) {
            let employeeArray = getUserData()
            if  employeeArray.isEmpty {
                performSegue(withIdentifier: "HomeViewController", sender: self)
                print("Login Success")
            }
            
        }
    }
    
    // MARK: Utility Methods
    fileprivate func showAlert(title: String, message: String) {
        
        let myAlert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let actionOK = UIAlertAction(title: "OK", style: .default, handler: { (_) in})
        let actionCancel = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
        myAlert.addAction(actionOK)
        myAlert.addAction(actionCancel)
        self.present(myAlert, animated: true, completion: nil)
    }
}
