//
//  TableViewCell.swift
//  AirBnb Homescreen
//
//  Created by Gogua on 11.10.2022.
//

import UIKit

class TableViewCell: UITableViewCell {

    
    @IBOutlet weak var imageBackgroundView: UIView!
    @IBOutlet weak var tableImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var alterTitle: UILabel!
    @IBOutlet weak var starredLabel: UILabel!
    @IBOutlet weak var buttonStar: UIButton!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var priceNightLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization codeta
        ///contentView.layer.cornerRadius = 16
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }
    func setupCellUI(){
       
        imageBackgroundView?.layer.cornerRadius = 20
        imageBackgroundView.clipsToBounds = true
        tableImageView?.layer.cornerRadius = 20
        tableImageView.clipsToBounds = true
    }
}
