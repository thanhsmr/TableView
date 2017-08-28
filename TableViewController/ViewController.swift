//
//  ViewController.swift
//  TableViewController
//
//  Created by Thanh Bui on 8/25/17.
//  Copyright © 2017 Thanh Bui. All rights reserved.
//

import UIKit

class ViewController: BaseTableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView = UITableView.init(frame: self.view.bounds)
        tableView.delegate = self;
        tableView.dataSource = self;
        self.view.addSubview(tableView)
        
        numberOfSection = 1
        numberOfRowInSection.append(3)
        
        var detailArrayData = [(String, String)]()
        detailArrayData.append(("data 1", "detail 1"))
        detailArrayData.append(("data 2", "detail 2 detail 2 detail 2 detail 2 detail 2 detail 2 detail 2 detail 2 detail 2 detail 2 detail 2 detail 2"))
        detailArrayData.append(("data 3", "detail 3"))
        
        arrayData.append(detailArrayData)
        
        arrayCellId.append("ExampleCell")
        
        isPullToRefresh = true;
        self.setupUI()
        
        tableView.reloadData()
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getData() {
        RequestManager.shared.getArticleNew(urlString: "string") { (data :[Article]?, error : Bool) in
            if error {
                
            } else {
                
            }
        }
    }


}

