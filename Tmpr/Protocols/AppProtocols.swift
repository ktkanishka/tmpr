//
//  AppProtocols.swift
//  M.SMS
//
//  Created by Kanishka Raveendra on 8/15/19.
//  Copyright © 2019 Kanishka Raveendra. All rights reserved.
//

import Foundation

protocol TableViewRowDidSelectDelegate : class {
    func didSelectTCell<T>(selectedItem: Any, dataType: T.Type)
}

//protocol DataPassDelegate: class {
//    func clickOnTableviewCell(selectedSVORowItem: SVORowItem)
//}
