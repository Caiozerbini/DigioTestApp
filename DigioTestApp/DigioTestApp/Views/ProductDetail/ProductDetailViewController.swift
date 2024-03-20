//
//  ProductDetailViewController.swift
//  DigioTestApp
//
//  Created by Caio César Carneiro Zerbini on 20/03/24.
//

import UIKit

class ProductDetailViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productDescriptionLabel: UILabel!
    
    // MARK: - Properties
    
    var product: Product?
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let product = product {
            setupDetails(with: product)
        }
    }
    
    // MARK: - Methods
    
    func setupDetails(with product: Product) {
            self.productImageView.sd_setImage(with: URL(string: product.imageURL))
            self.productNameLabel.text = product.name
            self.productDescriptionLabel.text = product.description
    }
    
}
