//
//  CustomAlertViewController.swift
//  EzPopup_Example
//
//  Created by Huy Nguyen on 6/4/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit

class CustomAlertViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var topImageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    var titleString: String?
    var messageString: String?
    var array: NSArray  = []
    {
        didSet {
            //array.printChangesFrom(oldValue)
            //self.tableView.reloadData()
        }
    }
    
    static func instantiate() -> CustomAlertViewController? {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "\(CustomAlertViewController.self)") as? CustomAlertViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = titleString
        messageLabel.text = messageString
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "\(UITableViewCell.self)")
        tableView.separatorInset = UIEdgeInsets.zero
    }

    // MARK: Actions
    
    @IBAction func closeButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

extension CustomAlertViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(UITableViewCell.self)", for: indexPath)
        let item = array[indexPath.row] as! String
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.lineBreakMode = .byWordWrapping
        cell.textLabel?.textAlignment = .center
        cell.textLabel?.text = item//"\(indexPath.row)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        //delegate?.numberPickerViewController(sender: self, didSelectNumber: indexPath.row)
    }
}
