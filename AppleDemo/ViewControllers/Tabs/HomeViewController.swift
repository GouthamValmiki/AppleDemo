//
//  FinalViewController.swift
//  AppleDemo
//
//  Created by Goutham Boya on 06/01/23.
//

import UIKit

class HomeViewController: UIViewController,UIPopoverPresentationControllerDelegate {
    
//  var arrOfEmployees: [Employee] = [Employee(userId: 1, id: 1, title: "goutham", completed: true), Employee(userId: 2, id: 2, title: "valmiki", completed: true) ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tabBarController?.navigationItem.hidesBackButton = true
        self.tabBarController?.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "ellipsis"), style: .done, target: self, action: #selector (getter: next))
        self.tabBarController?.navigationItem.rightBarButtonItem?.tintColor = .darkGray
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.tabBarController?.navigationItem.rightBarButtonItem?.isHidden = true
    }
    @objc func next(){
//        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//        let vc = storyboard.instantiateViewController(withIdentifier: "PopupView")
//        vc.modalPresentationStyle = UIModalPresentationStyle.popover
//        let popover: UIPopoverPresentationController = vc.popoverPresentationController!
//        popover.backgroundColor = .blue
//        popover.delegate = self
//        present(vc, animated: true, completion:nil)
        let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PopupView")
        self.addChild(popOverVC)

            popOverVC.view.frame = self.view.frame
            self.view.addSubview(popOverVC.view)
        popOverVC.didMove(toParent: self)
      }
    
    }
    
class PopUp: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        
        
        self.showAnimate()
        
        
    }
    
    
    func showAnimate()
    {
        self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.view.alpha = 0.0;
        UIView.animate(withDuration: 0.25, animations: {
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            
        });
    }
    
    func removeAnimate()
    {
        UIView.animate(withDuration: 0.25, animations: {
            self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.view.alpha = 0.0;
            
        }, completion:{(finished : Bool)  in
            if (finished)
            {
                self.view.removeFromSuperview()
            }
        });
    }
}
