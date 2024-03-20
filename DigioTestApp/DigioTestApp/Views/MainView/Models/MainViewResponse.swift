//
//  MainViewResponse.swift
//  DigioTestApp
//
//  Created by Caio César Carneiro Zerbini on 20/03/24.
//

import Foundation

struct MainViewResponse: Codable, Equatable {
    let spotlight: [Spotlight]
    let cash: Cash
    let products: [Product]
    
    static func == (lhs: MainViewResponse, rhs: MainViewResponse) -> Bool {
        guard lhs.spotlight == rhs.spotlight else { return false }
        guard lhs.cash == rhs.cash else { return false }
        guard lhs.products == rhs.products else { return false }
        return true
    }
}

struct Spotlight: Codable, Equatable {
    let name: String
    let bannerURL: String
    let description: String
    
    static func == (lhs: Spotlight, rhs: Spotlight) -> Bool {
        return lhs.name == rhs.name &&
        lhs.bannerURL == rhs.bannerURL &&
        lhs.description == rhs.description
    }
}

struct Cash: Codable, Equatable {
    let title: String
    let bannerURL: String
    let description: String
    
    static func == (lhs: Cash, rhs: Cash) -> Bool {
        return lhs.title == rhs.title &&
        lhs.bannerURL == rhs.bannerURL &&
        lhs.description == rhs.description
    }
}

struct Product: Codable, Equatable {
    let name: String
    let imageURL: String
    let description: String
    
    static func == (lhs: Product, rhs: Product) -> Bool {
        return lhs.name == rhs.name &&
        lhs.imageURL == rhs.imageURL &&
        lhs.description == rhs.description
    }
}
