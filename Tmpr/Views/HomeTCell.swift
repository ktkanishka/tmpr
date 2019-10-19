//
//  HomeTCell.swift
//  Tmpr
//
//  Created by Kanishka Raveendra on 10/14/19.
//  Copyright © 2019 Kanishka Raveendra. All rights reserved.
//

import UIKit
import Kingfisher

class HomeTCell: UITableViewCell {

    @IBOutlet weak var restuarantImgView: UIImageView!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    var itemHome: HomeModel? {
        didSet {
            guard itemHome != nil else {
                return
            }
            
            if let resURL = itemHome?.photo_url {
                let url = URL(string: resURL)
                let image = UIImage(named: "placeholder")
                let processor = RoundCornerImageProcessor(cornerRadius: 8)
                self.restuarantImgView.kf.setImage(with: url, placeholder: image, options: [.processor(processor)])
            }
            
            if let status = itemHome?.status, let distance = itemHome?.distance {
                statusLabel.text = String(format: "%@ . %@", status, distance)
            } else {
                // this value might not be correct, should be done according to business logic
                statusLabel.text = "SERVING"
            }
            
            if let price = itemHome?.price {
                priceLabel.text = String(format: "€ %.2i", price)
            } else {
                priceLabel.text = "€ 0.00"
            }
            
            if let title = itemHome?.title {
                titleLabel.text = title
            } else {
                titleLabel.text = "-"
            }
            
            if let startTime = itemHome?.open_time,  let endTime = itemHome?.end_time{
                timeLabel.text = String(format: "%@ - %@", startTime, endTime)
            } else {
                timeLabel.text = "-"
            }
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
        
        priceLabel.roundCorners(corners: [.topLeft], radius: 28)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
}
