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
    var image = ["Pizza","Burger","Egg","Breakfast","Chilli Chicken"]
    var price = ["Rs 70/-","Rs 100/-","Rs 50/-","Rs 150/-","Rs 200/-"]
    var arr = ["Spicy","Yummy","Good Taste","Excellent","Awesome"]
    @IBOutlet weak var pagerCollectionView: UICollectionView!
    @IBOutlet weak var foodCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(autoScroll), userInfo: nil, repeats: true)
    }
    @objc func autoScroll() {
        if currentcellIndex < image.count-1 {
            currentcellIndex = currentcellIndex + 1
        }else{
            currentcellIndex = 0
        }
        pagerCollectionView.scrollToItem(at: IndexPath(item: currentcellIndex, section: 0), at: .right, animated: true)
    }
}
extension HistoryViewController: UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        image.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == pagerCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
            cell.foodLbl.text = image[indexPath.row]
            cell.priceLbl.text = price[indexPath.row]
            cell.img.image = UIImage(named: image[indexPath.row])
            return cell
        }else{
            if collectionView == foodCollectionView {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell2", for: indexPath) as! CollectionViewCell2
                cell.foodLbl.text = image[indexPath.row]
                cell.lbl.text = arr[indexPath.row]
                cell.vw2.layer.shadowColor = UIColor.black.cgColor
                cell.vw2.layer.cornerRadius = 5
                cell.vw2.layer.shadowOpacity = 1
                cell.vw2.layer.shadowRadius = 1
                cell.vw2.layer.shadowOffset = CGSize(width: 0, height: 1)
                cell.img.image = UIImage(named: image[indexPath.row])
                cell.img.layer.cornerRadius = 5
                return cell
            }
            return UICollectionViewCell()
        }
    }
}
