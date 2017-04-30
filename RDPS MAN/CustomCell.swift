//
//  CustomCell.swift
//  RDPS MAN
//
//  Created by Eric on 4/27/17.
//  Copyright © 2017 Eric. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

    //@IBOutlet var name: UILabel!
    //@IBOutlet var ticketRequest: UILabel!
    //@IBOutlet var roomNumber: UILabel!
    //@IBOutlet var ticketRequest: UITextView!
    
    @IBOutlet var ticketRequest: UITextView!
    @IBOutlet var roomNumber: UILabel!
    @IBOutlet var name: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
