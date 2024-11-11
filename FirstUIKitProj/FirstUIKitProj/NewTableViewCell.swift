//
//  NewTableViewCell.swift
//  FirstUIKitProj
//
//  Created by Bhushan Abhyankar on 11/11/2024.
//

import UIKit

class NewTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabelNewCell: UILabel!
    @IBOutlet weak var imageViewNewCell: UIImageView!
    
    @IBOutlet weak var descriptionLabelNewCell: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
