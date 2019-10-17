//
//  HomeCoordinator.swift
//  Tmpr
//
//  Created by Kanishka Raveendra on 10/15/19.
//  Copyright © 2019 Kanishka Raveendra. All rights reserved.
//

import Foundation
import RxSwift

class HomeCoordinator: BaseCoordinator {
    
    private let disposeBag = DisposeBag()
    
    override func start() {

        let homeViewController = HomeViewController.instantiate(fromAppStoryboard: .Main)
        
        // Coordinator initializes and injects viewModel
        let homeViewModel = HomeViewModel()
        homeViewController.viewModel = homeViewModel
        
        self.navigationController.viewControllers = [homeViewController]
    }
}
