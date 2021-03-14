//
//  Cart.swift
//  TableViewDemo
//
//  Created by Emad Nasrallah on 2021-03-12.
//

import Foundation
class Cart{
    var name:String
    var quantity:Double
    var totPrice:Double
    init(name:String, qty:Double, tot:Double){
        self.name=name
        self.quantity=qty
        self.totPrice=tot
    }
}
