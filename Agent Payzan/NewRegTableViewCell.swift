//
//  NewRegTableViewCell.swift
//  Agent Payzan
//
//  Created by Nani Mac on 06/10/17.
//  Copyright © 2017 Naveen. All rights reserved.
//

import UIKit

class NewRegTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var detailsTextField: UITextField!
    
    
    @IBOutlet weak var detailLbl: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
