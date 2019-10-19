//
//  AppCoordinator.swift
//  Tmpr
//
//  Created by Kanishka Raveendra on 10/15/19.
//  Copyright © 2019 Kanishka Raveendra. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

protocol HomeEventListener {
    func didTappedLogIn()
    func didTappedSignUp()
}

class AppCoordinator: BaseCoordinator {
    
    var window = UIWindow(frame: UIScreen.main.bounds)

    override func start() {
        //self.navigationController.navigationBar.isHidden = true
        self.window.rootViewController = self.navigationController
        self.window.makeKeyAndVisible()
        
        // TODO: here you could check and show appropriate screen
        let coordinator = HomeCoordinator()
        coordinator.navigationController = self.navigationController
        self.start(coordinator: coordinator)
    }
}

extension AppCoordinator: HomeEventListener {
    func didTappedLogIn() {
        // TODO: Navigate to loginviewcontroller
    }
    
    func didTappedSignUp() {
        // TODO: Navigate to signupviewcontroller
    }
}
