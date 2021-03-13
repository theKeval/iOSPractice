//
//  ViewController.swift
//  TestingComponents
//
//  Created by Keval on 3/8/21.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var pickerManuf: UIPickerView!
    // @IBOutlet weak var pickerModel: UIPickerView!
    @IBOutlet weak var lablePrice: UILabel!
    
//    var data: [String : Array<String>] = [
//        "Lamborghini" : ["Countach", "Gallardo", "Aventador"],
//        "Ford" : ["GT", "Fiesta", "Figo"],
//        "Porche" : ["Carrera GT", "911 Carrera"],
//        "Audi" : ["R8", "Spider"]
//    ]
    
    var manufacturers = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        pickerManuf.dataSource = self
        pickerManuf.delegate = self
        
        manufacturers.append(contentsOf: ["Lamborghini", "Ford", "Porche", "Audi"])
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return manufacturers.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return manufacturers[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        lablePrice.text = manufacturers[row]
    }
    
}

