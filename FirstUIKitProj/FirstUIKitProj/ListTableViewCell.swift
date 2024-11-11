//
//  ListTableViewCell.swift
//  FirstUIKitProj
//
//  Created by Bhushan Abhyankar on 08/11/2024.
//

import UIKit

class ListTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabelCell: UILabel!
    @IBOutlet weak var imageViewCell: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
