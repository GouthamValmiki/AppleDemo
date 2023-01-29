//
//  FinalViewController.swift
//  AppleDemo
//
//  Created by Goutham Boya on 06/01/23.
//

import UIKit

class HomeViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UIPopoverPresentationControllerDelegate {
    var number = 0
    var employ = ["Pizza","Burger","Chilli Chicken","Burger","Egg","Drinks"]
    @IBOutlet weak var totalLbl: UILabel!
    @IBOutlet weak var tblvw: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
      
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.navigationItem.hidesBackButton = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.tabBarController?.navigationItem.rightBarButtonItem?.isHidden = true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        employ.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.lbl.text = employ[indexPath.row]
        cell.lbl.font = UIFont(name: "Baskerville", size: 20)
        cell.img.image = UIImage(named: employ[indexPath.row])
        cell.img.layer.cornerRadius = 40
        cell.img.layer.borderWidth = 2
        //cell.img.backgroundColor = randomColor()
        cell.vw.layer.shadowColor = UIColor.black.cgColor
        cell.vw.layer.cornerRadius = 5
        cell.vw.layer.shadowOpacity = 1
        cell.vw.layer.shadowRadius = 1
        cell.vw.layer.shadowOffset = CGSize(width: 0, height: 1)
        return cell
    }
    func randomCGFloat() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
    func randomColor() -> UIColor {
        let r = randomCGFloat()
        let g = randomCGFloat()
        let b = randomCGFloat()
        // If you wanted a random alpha, just create another
        // random number for that too.
        return UIColor(red: r, green: g, blue: b, alpha: 1)
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
        //        popOverVC.view.frame = self.view.frame
        //        self.view.addSubview(popOverVC.view)
        //        popOverVC.didMove(toParent: self)
        //      }
        
        @IBAction func btn(_ sender: UIButton) {
            let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let popupVC = storyboard.instantiateViewController(withIdentifier: "hello") as! PopupViewController
            popupVC.modalPresentationStyle = .popover
            popupVC.preferredContentSize = CGSizeMake(100, 100)
            let pVC = popupVC.popoverPresentationController
            pVC?.permittedArrowDirections = .any
            pVC?.delegate = self
            pVC?.sourceView = sender
            pVC?.sourceRect = CGRect(x: 100, y: 100, width: 1, height: 1)
            present(popupVC, animated: true, completion: nil)
        }
    }
    class PopupViewController: UIViewController{
        
    }
