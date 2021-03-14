//
//  User.swift
//  LoginDemo
//
//  Created by Mervat Mustafa on 2021-03-10.
//

import Foundation
class User{
    var username:String
    var password:String
    var firstName:String
    var lastName:String
    
    init(username:String, password:String, first:String, last:String){
        self.username = username
        self.password = password
        self.firstName = first
        self.lastName = last
    }
}
