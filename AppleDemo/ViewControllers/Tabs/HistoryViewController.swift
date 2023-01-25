//
//  HistoryViewController.swift
//  AppleDemo
//
//  Created by Goutham Boya on 09/01/23.
//

import UIKit

class HistoryViewController: UIViewController {

    var timer : Timer?
    var currentcellIndex = 0
    var image = ["Book","food","Snacks"]
    var arr = ["Books","Food","Snacks","Cool Drinks","Milk Shakes","Fruits","Popcorn"]
  
    @IBOutlet weak var collectVw: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(autoScroll), userInfo: nil, repeats: true)
    }
}
extension HistoryViewController: UICollectionViewDelegate,UICollectionViewDataSource,UITableViewDelegate,UITableViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        image.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        cell.img.image = UIImage(named: image[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arr.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TblvwCell
        cell.lbl.text = arr[indexPath.row]
        cell.lbl.font = UIFont(name: "Times New Roman", size: 20)
        return cell
    }
    @objc func autoScroll() {
        if currentcellIndex < image.count-1 {
            currentcellIndex = currentcellIndex + 1
        }else{
            currentcellIndex = 0
        }
        collectVw.scrollToItem(at: IndexPath(item: currentcellIndex, section: 0), at: .right, animated: true)
    }
        
}
class TblvwCell: UITableViewCell {
    @IBOutlet weak var lbl: UILabel!
}
