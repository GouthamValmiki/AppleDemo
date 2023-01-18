//
//  FinalViewController.swift
//  AppleDemo
//
//  Created by Goutham Boya on 06/01/23.
//

import UIKit

class HomeViewController: UIViewController,UIPopoverPresentationControllerDelegate {
    
    @IBOutlet weak var vw: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tabBarController?.navigationItem.hidesBackButton = true
        //        self.tabBarController?.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "ellipsis"), style: .done, target: self, action: #selector (getter: next))
        //        self.tabBarController?.navigationItem.rightBarButtonItem?.tintColor = .darkGray
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.tabBarController?.navigationItem.rightBarButtonItem?.isHidden = true
    }
    //    @objc func next(){
    ////        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
    ////        let vc = storyboard.instantiateViewController(withIdentifier: "PopupView")
    ////        vc.modalPresentationStyle = UIModalPresentationStyle.popover
    ////        let popover: UIPopoverPresentationController = vc.popoverPresentationController!
    ////        popover.backgroundColor = .blue
    ////        popover.delegate = self
    ////        present(vc, animated: true, completion:nil)
    //        let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PopupView")
    //        self.addChild(popOverVC)
    //
    //            popOverVC.view.frame = self.view.frame
    //            self.view.addSubview(popOverVC.view)
    //        popOverVC.didMove(toParent: self)
    //      }
    @IBAction func PopUpClicked(_ sender: UIButton) -> Void {
        
        if sender.isSelected {
            vw.isHidden = true
        }else{
            vw.isHidden = false
        }
//        let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PopupView") as! PopupView
        
//        popOverVC.modalPresentationStyle = UIModalPresentationStyle.pageSheet
//        self.addChild(popOverVC)
//
//        popOverVC.view.frame = self.view.frame
//        self.view.addSubview(popOverVC.view)
//        popOverVC.didMove(toParent: self)
        performSegue(withIdentifier: "PopupView", sender: self)
    }

}
