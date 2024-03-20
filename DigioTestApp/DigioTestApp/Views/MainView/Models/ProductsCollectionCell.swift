//
//  ProductsCollectionCell.swift
//  DigioTestApp
//
//  Created by Caio César Carneiro Zerbini on 20/03/24.
//

import Foundation
import SDWebImage

class ProductsCollectionCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    let backView: UIView = {
        let vw = UIView()
        return vw
    }()
    
    let logoImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureLayout()
        configureShadow()
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureLayout()
        configureShadow()
        setupViews()
    }
    
    // MARK: - Private Methods
    
    private func setupViews() {
        addSubview(backView)
        addSubview(logoImageView)
        
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            logoImageView.widthAnchor.constraint(equalToConstant: 60),
            logoImageView.heightAnchor.constraint(equalToConstant: 60),
            logoImageView.centerXAnchor.constraint(equalTo: backView.centerXAnchor, constant: 2),
            logoImageView.centerYAnchor.constraint(equalTo: backView.centerYAnchor)
        ])
    }
    
    private func configureLayout() {
        contentView.layer.cornerRadius = 14
        contentView.layer.masksToBounds = true
        contentView.backgroundColor = .secondarySystemGroupedBackground
    }
    
    private func configureShadow() {
        layer.shadowRadius = 2
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowOpacity = 0.25
        layer.shadowColor = UIColor.black.cgColor
        layer.cornerRadius = 14
        layer.masksToBounds = false
    }
    
    // MARK: - Public Methods
    
    //TODO
    func setProduct(with product: Product) {
        logoImageView.sd_setImage(with: URL(string: product.imageURL))
    }
    
    // MARK: - Overrides
    
    override func layoutSubviews() {
        super.layoutSubviews()
        backView.frame = bounds
    }
    
}

