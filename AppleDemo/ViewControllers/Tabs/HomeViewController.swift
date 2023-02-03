//
//  FinalViewController.swift
//  AppleDemo
//
//  Created by Goutham Boya on 06/01/23.
//

import UIKit
import CoreLocation

class HomeViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UIPopoverPresentationControllerDelegate, TableViewCellDelegate {
  
    var price = [Int]()
    var employ = [String]()
    var details = [String]()
//    var totalPrice = 0.0
    @IBOutlet weak var totalAmount: UILabel!
    @IBOutlet weak var tblvw: UITableView!
    @IBOutlet weak var latitLbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = Bundle.main.path(forResource: "MyList", ofType: "plist")
        let dict = NSDictionary(contentsOfFile: path!)
        
        employ = dict?.object(forKey: "Employ") as! [String]
        price = dict?.object(forKey: "Price") as! [Int]
        details = dict?.object(forKey: "Details") as! [String]
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.navigationItem.hidesBackButton = true
        
        let locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        getReverSerGeoLocation(location: CLLocation(latitude: 12.978898, longitude: 77.57767))
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
        cell.priceLbl.text = String(Int(price[indexPath.row]))
        cell.vw.layer.shadowColor = UIColor.black.cgColor
        cell.vw.layer.cornerRadius = 5
        cell.vw.layer.shadowOpacity = 1
        cell.vw.layer.shadowRadius = 1
        cell.vw.layer.shadowOffset = CGSize(width: 0, height: 1)
        cell.detailLbl.text = details[indexPath.row]
        cell.delegate = self
        
        
//        cell.totalLbl.text = "\(totalPriceArray)"
//        totalPrice += Double((cell.numberLbl.text ?? "" ) ?? 0, +(cell.totalLbl.text ?? "" )) ?? 0
//        self.totalAmount.text = "\(totalPrice)
        return cell
    }
    func changeLbl(in cell: TableViewCell) {
    
        let total = cell.totalLbl.text ?? ""
        totalAmount.text = "₹ \(total)"
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
extension HomeViewController: CLLocationManagerDelegate {
    
    func locationManager(
        _ manager: CLLocationManager,
        didUpdateLocations locations: [CLLocation]
    ) {
        if let location = locations.last {
            manager.stopUpdatingLocation()
            let latitude = location.coordinate.latitude
            let longitude = location.coordinate.longitude
            print("latitude = \(latitude)")
            print("logitude = \(longitude)")
        }
    }
    func getReverSerGeoLocation(location : CLLocation) {
        print("getting Address from Location cordinate")
        
        CLGeocoder().reverseGeocodeLocation(location) {
            placemarks , error in
            if error == nil && placemarks!.count > 0 {
                guard let placemark = placemarks?.last else {
                    return
                }
                print(placemark.thoroughfare!)
                print(placemark.subThoroughfare!)
                print("postalCode :-",placemark.postalCode!)
                print("City :-",placemark.locality!)
                print("subLocality :-",placemark.subLocality!)
                print("subAdministrativeArea :-",placemark.subAdministrativeArea!)
                print("Country :-",placemark.country!)
                self.latitLbl.text = "\(placemark.thoroughfare!), \(placemark.subLocality!) \r\n \(placemark.locality!) - \(placemark.postalCode!), \(placemark.country!)"
            }
        }
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
    
        print("error = \(error)")
    }
    
    class PopupViewController: UIViewController{
        
    }
}

//struct Products {
//    var name: String
//    var cost : Int
//    var details: String
//
//}
