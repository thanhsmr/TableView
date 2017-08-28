//
//  BaseTableViewCell.swift
//  TableViewController
//
//  Created by Thanh Bui on 8/25/17.
//  Copyright © 2017 Thanh Bui. All rights reserved.
//

import UIKit

protocol BaseTableViewCellDelegate {
    
}

class BaseTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configWithData(data: Any) {
        
    }

}
