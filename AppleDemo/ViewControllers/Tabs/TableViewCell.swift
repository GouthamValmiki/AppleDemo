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
    @IBOutlet weak var lbl: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var digitLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    @IBAction func handleStepper(_ sender: UIStepper) {
        digitLbl.text = String(Int(sender.value))
        
    }
}

