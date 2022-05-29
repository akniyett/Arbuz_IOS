//
//  Product.swift
//  ArbuzApp
//
//  Created by Akniyet Turdybay on 28.05.2022.
//

import Foundation

struct Product {
    let name: String
    let imageName: String
    let weight: Float
    let price: Int
    let status: Status
    let description: String
    
    enum Status: String{
        case ripe = "Спелый"
        case unripe = "Не спелый"
        case thwarted = "Уже сорван"
    }
    

}


