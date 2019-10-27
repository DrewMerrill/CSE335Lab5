//
//  CityTableViewCell.swift
//  Lab4
//
//  Created by Drew Merrill on 10/9/19.
//  Copyright © 2019 Drew Merrill. All rights reserved.
//

import UIKit

class CityTableViewCell: UITableViewCell
{
    @IBOutlet weak var cityTitle: UILabel!
    @IBOutlet weak var cityImage: UIImageView!{
        didSet {
            cityImage.layer.cornerRadius = cityImage.bounds.width / 2
            cityImage.clipsToBounds = true
    
        }
    }
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
