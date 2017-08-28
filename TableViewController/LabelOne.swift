//
//  LabelOne.swift
//  TableViewController
//
//  Created by Thanh Bui on 8/26/17.
//  Copyright © 2017 Thanh Bui. All rights reserved.
//

import UIKit

class LabelOne: UILabel {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.textColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
        self.font = UIFont.systemFont(ofSize: 14)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.textColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
        self.font = UIFont.systemFont(ofSize: 14)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
