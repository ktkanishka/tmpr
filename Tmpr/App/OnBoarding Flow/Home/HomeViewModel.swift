//
//  HomeViewModel.swift
//  Tmpr
//
//  Created by Kanishka Raveendra on 10/14/19.
//  Copyright © 2019 Kanishka Raveendra. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

enum SVORowItemType {
    case row
}

protocol RowItemProtocol {
    var type: SVORowItemType { get }
    var sectionTitle: String { get }
    var rowCount: Int { get }
    var isCollapsible: Bool { get }
    var isCollapsed: Bool { get set }
}

protocol SVOViewPresentable {
    var searhValue: Variable<String> {get}
}

extension RowItemProtocol {
    var rowCount: Int {
        return 1
    }
    
    var isCollapsible: Bool {
        return true
    }
}

class HomeViewModel: NSObject {
    
    var reloadSections: ((_ section: Int) -> Void)?
    var reloadTableView: ((_ dataExists: Int) -> Void)?
    //var reloadCollectionViewCallback : (()->())!
    
    weak var tableRowDidSelectDelegate: TableViewRowDidSelectDelegate?
    var dataSourceItems = [RowItemProtocol]()
    
    var disposeBag =  DisposeBag()
    
    var onShowError: ((_ alert: SingleButtonAlert) -> Void)?
    let showLoadingHud: Bindable = Bindable(false)
    
    override init() {
        super.init()
    }
    
    @objc func getHomeFeedWS() {
        showLoadingHud.value = true
        HomeModel.getHomeFeed(completion:
            { (result, data) in
                self.showLoadingHud.value = false
                
                switch result {
                case .success:
                    
                    print("DATA: \(data)")
                    self.dataSourceItems.removeAll()
                    
//                    if (self.dataSourceItems.count == 0) {
//                        print("nodata")
                        for taskItem in data as! Array<HomeItemModel> {
                            let taskRowItem = HomeRowItem(itemHome: taskItem)
                            print("\(String(describing: taskRowItem.item.title))")
                            self.dataSourceItems.append(taskRowItem)
                        }
                        self.reloadTableView?(1)
//                    } else {
//                        self.reloadTableView?(0)
//                    }
                    
                    
                    break
                    
                case .failed:
                    break
                    
                case .requestError(let message):
                    print("ERROR CUSTOM:\(message)")
                    self.reloadTableView?(0)
//                    let okAlert = SingleButtonAlert(
//                        title: "Error!",
//                        message: "Could not connect to server. Check your network and try again later.",
//                        action: AlertAction(buttonTitle: "OK", handler: { print("Ok pressed!") })
//                    )
//                    self.onShowError?(okAlert)
                    break
                }
        })
    }
    
}

extension HomeViewModel: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSourceItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let item = dataSourceItems[indexPath.section]
        let itemRow: RowItemProtocol!
        itemRow = dataSourceItems[indexPath.row]

        switch itemRow.type {
            case .row:
                if let item = itemRow as? HomeRowItem,
                    let cell = tableView.dequeueReusableCell(withIdentifier: HomeTCell.identifier, for: indexPath) as? HomeTCell {
                    cell.selectionStyle = .none
                    cell.itemHome = item.item
                    return cell
                }
        }

        return UITableViewCell()
    }
}

extension HomeViewModel: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        if let headerView:MerchandisingHeader =
//            tableView.dequeueReusableHeaderFooterView(withIdentifier: MerchandisingHeader.identifier)
//                as? MerchandisingHeader {
//            
//            //let svoRowItem = dataSourceItems[section]
//            let taskRowItem: RowItemProtocol!
//            //            if (searchActive) {
//            //                svoRowItem = filteredDataSourceItems[section]
//            //            } else {
//            taskRowItem = dataSourceItems[section]
//            //            }
//            headerView.item = taskRowItem
//            headerView.section = section
//            headerView.delegate = self
//            return headerView
//        }
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print("DidSelect SVO: \(svoRowItem.sectionTitle)")
        let homeRowItem: RowItemProtocol!
        homeRowItem = dataSourceItems[indexPath.row]
        //self.tableRowDidSelectDelegate?.didSelectTCell(selectedItem: taskRowItem, dataType: RowItemProtocol.self)
    }
    
}

class HomeRowItem: RowItemProtocol {
    var type: SVORowItemType {
        return .row
    }
    
    var sectionTitle: String {
        return ""
    }
    
    var rowCount: Int {
        return 1
    }
    
    var isCollapsed = false
    
    var item:HomeItemModel
    init(itemHome: HomeItemModel) {
        self.item = itemHome
    }
}
