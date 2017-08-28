//
//  LabelTwo.swift
//  TableViewController
//
//  Created by Thanh Bui on 8/26/17.
//  Copyright © 2017 Thanh Bui. All rights reserved.
//

import UIKit

class LabelTwo: UILabel {

    override func awakeFromNib() {
        super.awakeFromNib()
        self.textColor = #colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1)
        self.font = UIFont.boldSystemFont(ofSize: 12)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.textColor = #colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1)
        self.font = UIFont.boldSystemFont(ofSize: 12)
        self.numberOfLines = 0
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
