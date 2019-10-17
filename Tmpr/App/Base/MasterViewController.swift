//
//  MasterViewController.swift
//  2six4
//
//  Created by Macbook on 2/8/18.
//  Copyright © 2018 Macbook. All rights reserved.
//

import UIKit
import PKHUD

class MasterViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.barTintColor = AppColor.appPrimaryColor
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.backgroundColor = AppColor.appPrimaryColor
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.isTranslucent = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getVersion() -> String {
        let dictionary = Bundle.main.infoDictionary!
        let version = dictionary["CFBundleShortVersionString"] as! String
        //let build = dictionary["CFBundleVersion"] as! String
        return "Temper Works V\(version)"
    }
    
    // MARK: - HUD
    
    func showHUD() {
        HUD.show(.progress)
    }
    
    func hideHUD() {
        HUD.flash(.success, delay: 1.0)
    }        
    
}



