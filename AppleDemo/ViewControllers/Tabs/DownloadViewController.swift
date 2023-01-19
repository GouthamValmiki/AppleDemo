//
//  DownloadViewController.swift
//  AppleDemo
//
//  Created by Goutham Boya on 09/01/23.
//

import UIKit

class DownloadViewController: UIViewController {

    var accDetails = ["My Account","My Wallet","Address","Payment & Refunds","Help"]
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
extension DownloadViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        accDetails.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! AccountCell
        cell.lbl.text = accDetails[indexPath.row]
        
        
        return cell
    }
    
    
}
