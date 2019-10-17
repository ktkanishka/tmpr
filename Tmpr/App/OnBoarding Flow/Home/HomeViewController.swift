//
//  HomeViewController.swift
//  Tmpr
//
//  Created by Kanishka Raveendra on 10/14/19.
//  Copyright © 2019 Kanishka Raveendra. All rights reserved.
//

import UIKit
import RxSwift
import PKHUD
import SwiftMessages

class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    //fileprivate let viewModel = HomeViewModel()
    //var viewModel: HomeViewModel?
    var viewModel = HomeViewModel()
    @IBOutlet weak var noDataView: UIView!
    var disposeBag =  DisposeBag()
    
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector( updateHomeFeedList ), for: UIControl.Event.valueChanged)
        refreshControl.tintColor = AppColor.appPrimaryColor
        return refreshControl
    }()
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signupButton: UIButton!
    
    @IBOutlet weak var filterButton: UIButton!
    @IBOutlet weak var kaartButton: UIButton!
    
    @IBOutlet weak var containerButtonView: UIView!
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.separatorStyle = .none
        self.tableView.backgroundColor = AppColor.appDefaultBackgroundColor
        self.view.backgroundColor = AppColor.appDefaultBackgroundColor
        
        bindViewModel()
        
        loginButton.layer.cornerRadius = 5
        loginButton.layer.borderWidth = 1
        loginButton.layer.borderColor = UIColor.black.cgColor
        
        viewModel.reloadTableView = { [weak self] (dataExists: Int) in
            //print(" reloadTableView ")
            if (dataExists == 0) {
                self?.tableView.backgroundView = self?.noDataView
            } else {
                self?.tableView.backgroundView = nil
            }
            self?.tableView?.reloadData()
            self?.refreshControl.endRefreshing()
        }
        
        tableView?.rowHeight = UITableView.automaticDimension
        tableView?.dataSource = viewModel
        tableView?.delegate = viewModel
        
        tableView?.register(HomeTCell.nib, forCellReuseIdentifier: HomeTCell.identifier)

        viewModel.tableRowDidSelectDelegate = self
        
        if #available(iOS 10.0, *) {
            tableView?.refreshControl = self.refreshControl
        } else {
            tableView?.addSubview(self.refreshControl)
        }
        
        self.updateHomeFeedList()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    func bindViewModel() {
        viewModel.showLoadingHud.bind() { [weak self] visible in
            if let `self` = self {
                PKHUD.sharedHUD.contentView = PKHUDSystemActivityIndicatorView()
                visible ? PKHUD.sharedHUD.show(onView: self.navigationController?.view) : PKHUD.sharedHUD.hide()
            }
        }
    }
    
    @objc func updateHomeFeedList() {
        self.view.endEditing(true)
        
        // Call webservice here after reload tableview.
        viewModel.getHomeFeedWS()
    }

}


extension HomeViewController : TableViewRowDidSelectDelegate {
    func didSelectTCell<T>(selectedItem: Any, dataType: T.Type) {
  
    }
}
