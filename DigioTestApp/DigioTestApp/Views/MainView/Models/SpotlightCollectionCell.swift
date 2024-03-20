//
//  SpotlightCollectionCell.swift
//  DigioTestApp
//
//  Created by Caio César Carneiro Zerbini on 20/03/24.
//

import UIKit
import SDWebImage

class SpotlightCollectionCell: UICollectionViewCell {
    
    //MARK: - Properties
    
    let bannerImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.layer.cornerRadius = 14
        iv.clipsToBounds = true
        return iv
    }()
    
    //MARK: - Lifecycle
    
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
    
    //MARK: - Private Methods
    
    private func setupViews() {
        addSubview(bannerImageView)
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
    
    //MARK: - Public Methods
    
    //TODO
    func setBanner(with spotlight: Spotlight) {
        bannerImageView.sd_setImage(with: URL(string: spotlight.bannerURL))
    }
    
    // MARK: - Overrides
    
    override func layoutSubviews() {
        super.layoutSubviews()
        bannerImageView.frame = bounds
    }
    
}
