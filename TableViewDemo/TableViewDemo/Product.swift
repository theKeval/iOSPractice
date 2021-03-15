//
//  Product.swift
//  TableViewDemo
//
//  Created by Emad Nasrallah on 2021-03-11.
//

import Foundation
class Product {
    var category:String
    var name:String
    var price:Double
    var img:[String]
    var details:String
    
    init(cat:String, name:String, price:Double, img:[String], details:String)
    {
        self.category=cat
        self.name=name
        self.price=price
        self.img=img
        self.details=details
    }
}
