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

enum RowItemType {
    case row
}

protocol RowItemProtocol {
    var type: RowItemType { get }
    var sectionTitle: Date { get }
}

class HomeViewModel: NSObject {
    
    fileprivate let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = KEY.APP_DATE_FORMAT
        return formatter
    }()
    
    var reloadTableView: ((_ dataExists: Int) -> Void)?
    weak var tableRowDidSelectDelegate: TableViewRowDidSelectDelegate?
    var dataSourceItems = [RowItemProtocol]()
    
    var disposeBag = DisposeBag()
    
    let didLogin = PublishSubject<Void>()
    let didFailLogin = PublishSubject<Error>()
    
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
                        
                        self.dataSourceItems.removeAll()
                        
                        let responseArray = data as! Dictionary<String, [HomeModel]>
                        //print("DATA: \(responseArray.count)")
                        if (responseArray.count != 0) {
                            
                            //Sort array of dictionary
                            let sortedArray = responseArray.sorted {
                                guard let d1 = self.formatter.date(from:$0.key), let d2 = self.formatter.date(from:$1.key) else { return false }
                                return d1 > d2
                            }
                            
                            for (key, array) in sortedArray {
                                if (array.count != 0) {
                                    if let date = self.formatter.date(from: key) {
                                        let homeRowItem = HomeRowItem(array: array, headingDate: date)
                                        self.dataSourceItems.append(homeRowItem)
                                    }
                                }
                            }
                            self.reloadTableView?(1)
                        } else {
                            self.reloadTableView?(0)
                        }
                        break
                    
                    case .failed:
                        break
                    
                    case .requestError(let message):
                        print("ERROR:\(message)")
                        self.reloadTableView?(0)
                        let okAlert = SingleButtonAlert(
                            title: "Error!",
                            message: "Could not connect to server. Check your network and try again later.",
                            action: AlertAction(buttonTitle: "OK", handler: { print("Ok pressed!") })
                        )
                        self.onShowError?(okAlert)
                        break
                }
        })
    }
    
}

extension HomeViewModel: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataSourceItems.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let itemRow = dataSourceItems[section] as? HomeRowItem
        return itemRow?.listArray.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let itemRow = dataSourceItems[indexPath.section]
        if let item = itemRow as? HomeRowItem,
            let cell = tableView.dequeueReusableCell(withIdentifier: HomeTCell.identifier, for: indexPath) as? HomeTCell {
            let selectedItem = item.listArray[indexPath.row]
            cell.selectionStyle = .none
            cell.itemHome = selectedItem
            return cell
        }
        
        return UITableViewCell()
    }
}

extension HomeViewModel: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if let headerView:HomeHeader =
            tableView.dequeueReusableHeaderFooterView(withIdentifier: HomeHeader.identifier)
                as? HomeHeader {

            let taskRowItem = dataSourceItems[section]
            headerView.sectionTitle = taskRowItem.sectionTitle
            return headerView
        }
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 70.0
    }
    
}

class HomeRowItem: RowItemProtocol {
   
    var type: RowItemType {
        return .row
    }
    
    var sectionTitle: Date
    
    var listArray: [HomeModel]
    
    init ( array: [HomeModel], headingDate: Date ) {
        self.listArray = array
        self.sectionTitle = headingDate
    }
}
