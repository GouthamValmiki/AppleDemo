//
//  TableViewCell.swift
//  AppleDemo
//
//  Created by Goutham Boya on 19/01/23.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var vw: UIView!
    @IBOutlet weak var foodNameLbl: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var numberLbl: UILabel!
    @IBOutlet weak var detailLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var totalLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    @IBAction func handleStepper(_ sender: UIStepper) {
        numberLbl.text = String(Int(sender.value))
        
        let one = numberLbl.text
        let oneInt = Int(one!)
        let two = priceLbl.text
        let twoInt = Int(two!)
        let total = oneInt! * twoInt!
        totalLbl?.text = "\(total)"
    }
}

