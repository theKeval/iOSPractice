//
//  ViewController.swift
//  LoginDemo
//
//  Created by Mervat Mustafa on 2021-03-10.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var name: UILabel!
    var personName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        name.text = "Welcome "+personName
        // Do any additional setup after loading the view.
    }


}

