//
//  BaseTableViewController.swift
//  TableViewController
//
//  Created by Thanh Bui on 8/25/17.
//  Copyright © 2017 Thanh Bui. All rights reserved.
//

import UIKit

class BaseTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tableView: UITableView!
    
    var numberOfSection = 0
    var numberOfRowInSection = [Int]()
    var arrayData = [[Any]]()
    var arrayCellId = [String]()
    
    var isLoadMore = false
    var isRefesh = false
    var isPullToRefresh = false
    var isAddLoadMore = false

    override func viewDidLoad() {
        super.viewDidLoad()
//        self.setupUI()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
// MARK: Lazy Init
    
    
    func setupUI() {
        self.setupTableView()
    }
    
    func setupTableView() {
        tableView.rowHeight = UITableViewAutomaticDimension;
        tableView.estimatedRowHeight = 40
        self.edgesForExtendedLayout = UIRectEdge.top
        self.automaticallyAdjustsScrollViewInsets = false
        tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        
        for cellId in arrayCellId {
            tableView.register(stringClassFromString(cellId) as! UITableViewCell.Type, forCellReuseIdentifier: cellId)
        }
        
        if isPullToRefresh {
            self.setupPullToRefresh()
        }
        
        if isAddLoadMore {
            self.setupAddLoadMore()
        }
        
    }
    
    func setupPullToRefresh() {
        let loadingView = DGElasticPullToRefreshLoadingViewCircle()
        loadingView.tintColor = UIColor(red: 78/255.0, green: 221/255.0, blue: 200/255.0, alpha: 1.0)
        tableView.dg_addPullToRefreshWithActionHandler({ [weak self] () -> Void in
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(Int64(1.5 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: {
                self?.tableView.dg_stopLoading()
            })
            }, loadingView: loadingView)
        tableView.dg_setPullToRefreshFillColor(UIColor(red: 57/255.0, green: 67/255.0, blue: 89/255.0, alpha: 1.0))
        tableView.dg_setPullToRefreshBackgroundColor(tableView.backgroundColor!)
        
    }
    
    deinit {
        tableView.dg_removePullToRefresh()
    }
    
    func setupAddLoadMore() {
        
    }
    
    func stringClassFromString(_ className: String) -> AnyClass! {
    
    /// get namespace
    let namespace = Bundle.main.infoDictionary!["CFBundleExecutable"] as! String;
    
    /// get 'anyClass' with classname and namespace
    let cls: AnyClass = NSClassFromString("\(namespace).\(className)")!;
    
    // return AnyClass!
    return cls;
    }
    
    
// MARK: Tableview DATASOURCE
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return numberOfSection;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfRowInSection[section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var baseCell : BaseTableViewCell!
        if let cell = tableView.dequeueReusableCell(withIdentifier: arrayCellId[indexPath.section]) {
            baseCell = cell as! BaseTableViewCell
        } else {
            baseCell = UINib(nibName: arrayCellId[indexPath.section], bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! BaseTableViewCell
        }
        let data = arrayData[indexPath.section][indexPath.row]
        baseCell.configWithData(data: data)
        return baseCell;
    }
    
// MARK: Tableview DELEGATE
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {

        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    

}
