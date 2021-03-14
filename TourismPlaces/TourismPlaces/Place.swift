//
//  Place.swift
//  TourismPlaces
//
//  Created by Mervat Mustafa on 2020-11-17.
//

import Foundation
class Place{
    var name:String
    var image:String
    var country:String
    var details:String
    init(name:String, image:String, country:String, details:String){
        self.name = name
        self.image = image
        self.details = details
        self.country = country
    }
    
}
