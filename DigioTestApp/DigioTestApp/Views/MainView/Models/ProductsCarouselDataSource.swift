//
//  ProductsCarouselDataSource.swift
//  DigioTestApp
//
//  Created by Caio César Carneiro Zerbini on 20/03/24.
//

import Foundation
import UIKit

final class ProductsCarouselDataSource: NSObject, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    // MARK: - Properties
    
    let viewModel: MainViewModel
    
    // MARK: - Initializer
    
    init(viewModel: MainViewModel) {
        self.viewModel = viewModel
    }
    
    // MARK: - Collection DataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.mainData?.products.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "productsCell", for: indexPath) as? ProductsCollectionCell else {
            fatalError("Unable to dequeue ProductsCollectionCell")
        }
        if let products = viewModel.mainData?.products[indexPath.row] {
            cell.setProduct(with: products)
        }
        return cell
    }
    
    // MARK: - Collection Delegate
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let product = viewModel.mainData?.products[indexPath.row] {
            viewModel.coordinator.detailProduct(product: product)
        }
    }
    
    // MARK: - Collection Layout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 115, height: 115)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 50
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 40, bottom: 0, right: 0)
    }
    
}

