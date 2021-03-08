//
//  ModelCalss.swift
//  Feb26Excercise
//
//  Created by Keval on 2/26/21.
//

import Foundation

class MyData{
    
    var name: String
    var price: Double
    var discountRate: Double
    var stock: Int
    var imgName: String
    
    init(name: String, price: Double, discountRate: Double, stock: Int, imgName: String) {
        self.name = name
        self.price = price
        self.discountRate = discountRate
        self.stock = stock
        self.imgName = imgName
    }
    
}
