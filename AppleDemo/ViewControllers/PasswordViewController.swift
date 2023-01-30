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
    }
    @IBAction func save(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
    }
}

