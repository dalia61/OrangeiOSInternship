//
//  myTableViewCell.swift
//  O-Store
//
//  Created by Dalia on 30/08/2022.
//

import UIKit

class myTableViewCell: UITableViewCell {

    @IBOutlet weak var labelIcon: UILabel!
    @IBOutlet weak var imageIcon: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
