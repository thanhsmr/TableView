//
//  ExampleCell.swift
//  TableViewController
//
//  Created by Thanh Bui on 8/26/17.
//  Copyright © 2017 Thanh Bui. All rights reserved.
//

import UIKit
import EasyPeasy

class ExampleCell: BaseTableViewCell {
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setup()
        self.layout()
    }
    
    fileprivate lazy var userLabel: LabelOne = {
        let label = LabelOne(frame: CGRect.zero)
        return label
    }()
    
    fileprivate lazy var detailLabel: LabelTwo = {
        let label = LabelTwo(frame: CGRect.zero)
        label.setContentCompressionResistancePriority(100, for: .horizontal)
        label.setContentCompressionResistancePriority(1000, for: .vertical)
        return label
    }()

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {

    }
    
    fileprivate func setup() {
        self.backgroundColor = UIColor.white
        self.addSubview(self.userLabel)
        self.addSubview(self.detailLabel)
    }
    
    override func configWithData(data: Any) {
        if data is (String, String) {
            userLabel.text = (data as! (String, String)).0
            detailLabel.text = (data as! (String, String)).1
        }
    }
    
}

/**
 Autolayout constraints
 */
extension ExampleCell {
    
    fileprivate func layout() {
        self.detailLabel <- [
            Height(>=20),
            Top(10),
            Right(10),
            Bottom(10)
        ]
        // UserInfo label
        self.userLabel <- [
            Top(10),
            Left(10),
            Right(10).to(self.detailLabel)
        ]
        

    }
    
}

