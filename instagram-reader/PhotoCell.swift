//
//  PhotoCellTableViewCell.swift
//  instagram-reader
//
//  Created by Ben on 2/6/15.
//  Copyright (c) 2015 Common Sense Labs. All rights reserved.
//

import UIKit

class PhotoCell: UITableViewCell {

  @IBOutlet weak var photoImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
