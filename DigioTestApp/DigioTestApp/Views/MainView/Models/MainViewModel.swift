//
//  MainViewModel.swift
//  DigioTestApp
//
//  Created by Caio César Carneiro Zerbini on 20/03/24.
//

import Foundation
import Combine

final class MainViewModel {
    
    enum State {
        case initialized, loading, loaded, failed
    }
    
    let coordinator: Coordinator
    let connector: Connector
    private(set) var mainData: MainViewResponse?
    private(set) var state: State = .initialized {
        didSet {
            statePublisher.send(state)
        }
    }
    private(set) var statePublisher: PassthroughSubject<State, Never> = .init()
    
    init(connector: Connector, coordinator: Coordinator) {
        self.connector = connector
        self.coordinator = coordinator
    }
    
    func fetchInitialData() {
        Task {
            do {
                state = .loading
                mainData = try await connector.fetchMainData()
                state = .loaded
            } catch {
                state = .failed
                print("Main View Model - Failed to fetch data ❌ \(error.localizedDescription)")
            }
        }
    }
}
