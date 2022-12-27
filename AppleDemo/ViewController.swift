//
//  ViewController.swift
//  login
//
//  Created by Goutham Boya on 21/12/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var emailError: UILabel!
    @IBOutlet weak var passwordError: UILabel!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var vw: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setGradientBackground()
        resetForm()
    }
    func resetForm()
    {
        submitButton.isEnabled = false
        
        emailError.isHidden = false
        //        phoneError.isHidden = false
        passwordError.isHidden = false
        
        emailError.text = "Required"
        //        phoneError.text = "Required"
        passwordError.text = "Required"
        
        email.text = ""
        password.text = ""
        
    }

    @IBAction func emailChanged(_ sender: Any)
    {
        if let email = email.text
        {
            if let errorMessage = invalidEmail(email)
            {
                emailError.text = errorMessage
                emailError.isHidden = false
            }
            else
            {
                emailError.isHidden = true
            }
        }
        
        checkForValidForm()
    }
    
    func invalidEmail(_ value: String) -> String?
    {
        let reqularExpression = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let predicate = NSPredicate(format: "SELF MATCHES %@", reqularExpression)
        if !predicate.evaluate(with: value)
        {
            return "Invalid Email Address"
        }
        
        return nil
    }
    @IBAction func passwordChanged(_ sender: Any)
    {
        if let password = password.text
        {
            if let errorMessage = invalidPassword(password)
            {
                passwordError.text = errorMessage
                passwordError.isHidden = false
            }
            else
            {
                passwordError.isHidden = true
            }
        }
        
        checkForValidForm()
    }
    
    func invalidPassword(_ value: String) -> String?
    {
        if value.count < 8
        {
            return "Password must be at least 8 characters"
        }
        if containsDigit(value)
        {
            return "Password must contain at least 1 digit"
        }
        if containsLowerCase(value)
        {
            return "Password must contain at least 1 lowercase character"
        }
        if containsUpperCase(value)
        {
            return "Password must contain at least 1 uppercase character"
        }
        return nil
    }
    
    func containsDigit(_ value: String) -> Bool
    {
        let reqularExpression = ".*[0-9]+.*"
        let predicate = NSPredicate(format: "SELF MATCHES %@", reqularExpression)
        return !predicate.evaluate(with: value)
    }
    
    func containsLowerCase(_ value: String) -> Bool
    {
        let reqularExpression = ".*[a-z]+.*"
        let predicate = NSPredicate(format: "SELF MATCHES %@", reqularExpression)
        return !predicate.evaluate(with: value)
    }
    
    func containsUpperCase(_ value: String) -> Bool
    {
        let reqularExpression = ".*[A-Z]+.*"
        let predicate = NSPredicate(format: "SELF MATCHES %@", reqularExpression)
        return !predicate.evaluate(with: value)
    }
    func checkForValidForm()
    {
        if emailError.isHidden && passwordError.isHidden
        {
            submitButton.isEnabled = true
        }
        else
        {
            submitButton.isEnabled = false
        }
    }
    
    @IBAction func submitAction(_ sender: Any)
    {
     
        print("Successfully logged In")
        resetForm()
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





 
