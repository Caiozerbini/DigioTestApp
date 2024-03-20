//
//  MainViewModelTests.swift
//  DigioTestAppTests
//
//  Created by Caio César Carneiro Zerbini on 20/03/24.
//

import Foundation
import XCTest
@testable import DigioTestApp

class MainViewModelTests: XCTestCase {
    
    var viewModel: MainViewModel!
    var mockConnector: MockConnector!
    var mockCoordinator: MockCoordinator!
    
    let mockImageUrl = "https://aquitemplacas.com.br/img/produtos/g/36-atencao-area-de-teste.jpg"
    
    override func setUp() {
        super.setUp()
        mockConnector = MockConnector()
        mockCoordinator = MockCoordinator()
        viewModel = MainViewModel(connector: mockConnector, coordinator: mockCoordinator)
    }
    
    override func tearDown() {
        viewModel = nil
        mockConnector = nil
        mockCoordinator = nil
        super.tearDown()
    }
    
    func testFetchInitialData_Success() {
        // Given
        let mainData = MainViewResponse(spotlight: [Spotlight(name: "Spotlight", bannerURL: mockImageUrl, description: "Test")], cash: Cash(title: "Cash", bannerURL: mockImageUrl, description: "Test"), products: [Product(name: "Product", imageURL: mockImageUrl, description: "Test")])
        mockConnector.fetchMainDataResult = .success(mainData)
        
        let expectation = XCTestExpectation(description: "Fetch data success")
        
        // When
        viewModel.fetchInitialData()
        
        // Then
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            XCTAssertEqual(self.viewModel.state, .loaded)
            XCTAssertEqual(self.viewModel.mainData, mainData)
            expectation.fulfill()
        }
        
        // Then
        wait(for: [expectation], timeout: 3)
    }
    
    func testFetchInitialData_Failure() {
        // Given
        let error = NSError(domain: "Test", code: 0, userInfo: nil) // Example error
        mockConnector.fetchMainDataResult = .failure(error)
        
        // When
        viewModel.fetchInitialData()
        
        // Then
        XCTAssertEqual(viewModel.state, .failed)
        XCTAssertNil(viewModel.mainData)
    }
    
    // MARK: - Mocks
    
    class MockConnector: Connector {
        
        var fetchMainDataResult: Result<MainViewResponse, Error> = .success(MainViewResponse(spotlight: [Spotlight(name: "Spotlight", bannerURL: "https://aquitemplacas.com.br/img/produtos/g/36-atencao-area-de-teste.jpg", description: "Test")], cash: Cash(title: "Cash", bannerURL: "https://aquitemplacas.com.br/img/produtos/g/36-atencao-area-de-teste.jpg", description: "Test"), products: [Product(name: "Product", imageURL: "https://aquitemplacas.com.br/img/produtos/g/36-atencao-area-de-teste.jpg", description: "Test")]))
        
        func fetchMainData() async throws -> MainViewResponse {
            switch fetchMainDataResult {
            case .success(let data):
                return data
            case .failure(let error):
                throw error
            }
        }
    }
    
    class MockCoordinator: Coordinator {
        
        private(set) var navigationController: UINavigationController
        
        var startCalled = false
        var detailProductCalled = false
        var productPassed: Product?
        
        
        init(navigationController: UINavigationController = UINavigationController()) {
            self.navigationController = navigationController
        }
        
        func start() {
            startCalled = true
        }
        
        func detailProduct(product: Product) {
            detailProductCalled = true
            productPassed = product
        }
    }
}
