//
//  HistoryViewController.swift
//  AppleDemo
//
//  Created by Goutham Boya on 09/01/23.
//

import UIKit

class HistoryViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
 configureItem()
        // Do any additional setup after loading the view.
    }
        func configureItem(){
            navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "gear"), style: .done, target: self, action: nil)
        }
}
