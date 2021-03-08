//
//  Car.swift
//  March1App
//
//  Created by Mervat Mustafa on 2021-03-01.
//

import Foundation
class Car {
    var carName:String
    var carRate:Double
    var carImage:String
    var carMillage: Int
    
    init(name:String, rate:Double, img:String, millage:Int)
    {
        self.carImage = img
        self.carMillage = millage
        self.carName = name
        self.carRate = rate
    }
}
