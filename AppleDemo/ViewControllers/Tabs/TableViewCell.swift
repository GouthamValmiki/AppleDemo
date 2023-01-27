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
    
    @IBOutlet weak var digitLbl: UILabel!
    
    @IBOutlet weak var btn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
