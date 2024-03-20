//
//  SpotlightCarouselDataSource.swift
//  DigioTestApp
//
//  Created by Caio César Carneiro Zerbini on 20/03/24.
//

import Foundation
import UIKit

final class SpotlightCarouselDataSource: NSObject, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    // MARK: - Properties
    
    let viewModel: MainViewModel
    
    // MARK: - Initializer
    
    init(viewModel: MainViewModel) {
        self.viewModel = viewModel
    }
    
    // MARK: - Collection DataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.mainData?.spotlight.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "spotlightCell", for: indexPath) as? SpotlightCollectionCell else {
            fatalError("Unable to dequeue SpotlightCollectionCell")
        }
        if let spotlight = viewModel.mainData?.spotlight[indexPath.row] {
            cell.setBanner(with: spotlight)
        }
        return cell
    }
    
    // MARK: - Collection Layout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 290, height: 140)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 50
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 20, bottom: 10, right: 0)
    }
    
}

