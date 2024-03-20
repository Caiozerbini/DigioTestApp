//
//  MainViewController.swift
//  DigioTestApp
//
//  Created by Caio César Carneiro Zerbini on 20/03/24.
//

import UIKit
import Combine

class MainViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var spotlightCollectionView: UICollectionView!
    @IBOutlet weak var digioCashImageView: UIImageView!
    @IBOutlet weak var productsCollectionView: UICollectionView!
    
    // MARK: - Properties
    
    let viewModel: MainViewModel
    var cancellables: Set<AnyCancellable> = []
    var spotlightDataSource: SpotlightCarouselDataSource
    var productsDataSource: ProductsCarouselDataSource
    
    //MARK: - Initializers
    
    init(viewModel: MainViewModel) {
        self.viewModel = viewModel
        self.spotlightDataSource = SpotlightCarouselDataSource(viewModel: self.viewModel)
        self.productsDataSource = ProductsCarouselDataSource(viewModel: self.viewModel)
        super.init(nibName: "MainViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerCustomCells()
        spotlightCollectionView.dataSource = spotlightDataSource
        spotlightCollectionView.delegate = spotlightDataSource
        productsCollectionView.dataSource = productsDataSource
        productsCollectionView.delegate = productsDataSource
        bindViewModel()
        viewModel.fetchInitialData()
        
        digioCashImageView.clipsToBounds = true
        digioCashImageView.layer.cornerRadius = 10
    }
    
    //MARK: - Private Methods
    
    private func bindViewModel() {
        viewModel.statePublisher.sink { [weak self] state in
            if state == .loaded {
                DispatchQueue.main.async {
                    self?.spotlightCollectionView.reloadData()
                    self?.digioCashImageView.sd_setImage(with: URL(string: self?.viewModel.mainData?.cash.bannerURL ?? ""))
                    self?.productsCollectionView.reloadData()
                }
            }
            
        }.store(in: &cancellables)
    }
    
    private func registerCustomCells() {
        spotlightCollectionView.register(SpotlightCollectionCell.self, forCellWithReuseIdentifier: "spotlightCell")
        productsCollectionView.register(ProductsCollectionCell.self, forCellWithReuseIdentifier: "productsCell")
    }
    
}
