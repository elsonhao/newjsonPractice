//
//  myTableViewCell.swift
//  jsonPractice
//
//  Created by 黃毓皓 on 2017/2/25.
//  Copyright © 2017年 ice elson. All rights reserved.
//

import UIKit

class myTableViewCell: UITableViewCell {

    @IBOutlet weak var myImageview: UIImageView!
     @IBOutlet weak var myLabel: UILabel!
    
    
    
    override func awakeFromNib() {
       
        
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
