//
//  Book.swift
//  BookApp
//
//  Created by Mervat Mustafa on 2020-11-11.
//

import Foundation
class Book{
    var ISBN:Int
    var Title:String
    var Author:String
    var Price:Double
    var Available:Bool
    var Image:String
    init(isbn:Int,title:String,author:String,price:Double,aval:Bool,img:String) {
        self.ISBN = isbn
        self.Title = title
        self.Author = author
        self.Price = price
        self.Available = aval
        self.Image = img
        
    }
    
}
