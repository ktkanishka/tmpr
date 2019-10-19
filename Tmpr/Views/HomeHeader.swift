//
//  HomeHeader.swift
//  Tmpr
//
//  Created by Kanishka Raveendra on 10/19/19.
//  Copyright © 2019 Kanishka Raveendra. All rights reserved.
//

import UIKit

class HomeHeader: UITableViewHeaderFooterView {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    fileprivate let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE d MMMM"
        return formatter
    }()
    
    var sectionTitle: Date? {
        didSet {
            guard let titleDate = sectionTitle else {
                return
            }
            
            titleLabel.text = formatter.string(from: titleDate)
        }
    }
    
    static var nib:UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

}
