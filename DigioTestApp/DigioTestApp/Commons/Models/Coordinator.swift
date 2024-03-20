//
//  Coordinator.swift
//  DigioTestApp
//
//  Created by Caio César Carneiro Zerbini on 20/03/24.
//

import Foundation
import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get }
    func start()
    func detailProduct(product: Product)
}
