//
//  BaseCoordinator.swift
//  Tmpr
//
//  Created by Kanishka Raveendra on 10/15/19.
//  Copyright © 2019 Kanishka Raveendra. All rights reserved.
//

import Foundation
import UIKit

protocol Coordinator: AnyObject {
    var navigationController: UINavigationController { get set }
    var parentCoordinator: Coordinator? { get set }
    
    func start()
    func start(coordinator: Coordinator)
    func didFinish(coordinator: Coordinator)
}

class BaseCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    var parentCoordinator: Coordinator?
    var navigationController = UINavigationController()
    
    func start() {
        fatalError("Start method must be implemented")
    }
    
    func start(coordinator: Coordinator) {
        self.childCoordinators.append(coordinator)
        coordinator.parentCoordinator = self
        coordinator.start()
    }
    
    func didFinish(coordinator: Coordinator) {
        if let index = self.childCoordinators.firstIndex(where: { $0 === coordinator }) {
            self.childCoordinators.remove(at: index)
        }
    }
}
