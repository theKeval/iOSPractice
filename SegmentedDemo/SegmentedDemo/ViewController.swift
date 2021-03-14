//
//  ViewController.swift
//  SegmentedDemo
//
//  Created by Emad Nasrallah on 2021-03-11.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var capital: UILabel!
    
    @IBOutlet weak var currency: UILabel!
    @IBOutlet weak var flag: UIImageView!
    @IBOutlet weak var country: UISegmentedControl!
    
    var countryList = [Country]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        fillData()
        flag.image = UIImage(named:"canada")
    }
    func fillData(){
        countryList.append(Country(name:"Canada",capital:"Ottawa", currency: "CAD"))
        countryList.append(Country(name:"India",capital:"Delhi", currency: "INR"))
        countryList.append(Country(name:"Colombia",capital:"Bogota", currency: "COP"))
        countryList.append(Country(name:"DR",capital:"Santo Domingo", currency: "DOP"))
        countryList.append(Country(name:"Jordan",capital:"Amman", currency: "JOD"))
                                             
        
        
    }


    @IBAction func changeCountry(_ sender: Any) {
        let i = country.selectedSegmentIndex
        capital.text = countryList[i].capital
        currency.text = countryList[i].currency
        flag.image = UIImage(named:countryList[i].name.lowercased())
        }
    
}

