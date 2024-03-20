//
//  MainCoordinator.swift
//  DigioTestApp
//
//  Created by Caio César Carneiro Zerbini on 20/03/24.
//

import Foundation

import Foundation
import UIKit

final class MainCoordinator: Coordinator {
    
    
    private(set) var navigationController: UINavigationController
    
    
    init(navigationController: UINavigationController = UINavigationController()) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewModel = MainViewModel(connector: DefaultConnector(), coordinator: self)
        let mainVC = MainViewController(viewModel: viewModel)
        navigationController.pushViewController(mainVC, animated: false)
    }
    
    func detailProduct(product: Product) {
        let viewController = ProductDetailViewController()
        viewController.product = product
        self.navigationController.pushViewController(viewController, animated: true)
    }
    
}
