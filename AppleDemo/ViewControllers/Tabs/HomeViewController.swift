//
//  FinalViewController.swift
//  AppleDemo
//
//  Created by Goutham Boya on 06/01/23.
//

import UIKit

class HomeViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UIPopoverPresentationControllerDelegate {
    var price = ["One item: 150","One item: 100","One item: 200","One item: 120","One item: 30","One item: 25"]
    var employ = ["Pizza","Burger","Chilli Chicken","Burger","Egg","Drinks"]
    var details = ["A slice a day keeps the sad away",
                   "Life is better with a burger",
                   "Live life with a little spice",
                   "Life is better with a burger",
                   "Daily one is better for your health",
                   "No working during drinking hours"]
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
        cell.foodNameLbl.text = employ[indexPath.row]
        cell.foodNameLbl.font = UIFont(name: "Baskerville", size: 20)
        cell.foodNameLbl.font = UIFont.boldSystemFont(ofSize: 20)
        cell.img.image = UIImage(named: employ[indexPath.row])
        cell.img.layer.cornerRadius = 40
        cell.img.layer.borderWidth = 2
        cell.priceLbl.text = price[indexPath.row]
        //cell.img.backgroundColor = randomColor()
        cell.vw.layer.shadowColor = UIColor.black.cgColor
        cell.vw.layer.cornerRadius = 5
        cell.vw.layer.shadowOpacity = 1
        cell.vw.layer.shadowRadius = 1
        cell.vw.layer.shadowOffset = CGSize(width: 0, height: 1)
//        cell.stepper.tag = indexPath.row
        cell.detailLbl.text = details[indexPath.row]
        return cell
    }
    
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
