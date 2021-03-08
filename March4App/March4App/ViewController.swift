//
//  ViewController.swift
//  March4App
//
//  Created by Mervat Mustafa on 2021-03-04.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        pizzaList.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pizzaList[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        price.text = String(priceList[row])
        originalPrice = priceList[row]
        large.isSelected = false
        small.isSelected = true
        medium.isSelected = false
      
    }
    
    let pizzaList = ["Neapolitan Pizza","Chicago Pizza","Margarita","Sicilian Pizza","Greek Pizza"]
    let priceList = [7.99,8.7,8.5,6.99,9.0]
    let toppings = ["chicken":1.7,"beef":1.2,"pep":2.0,"mash":1.0]
    var originalPrice:Double = 7.99

    @IBOutlet weak var small: UIButton!
    @IBOutlet weak var chickenCB: UIButton!
    @IBOutlet weak var large: UIButton!
    @IBOutlet weak var beefCB: UIButton!
    @IBOutlet weak var pepCB: UIButton!
    @IBOutlet weak var mashCB: UIButton!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var medium: UIButton!
    @IBOutlet weak var pizzaPicker: UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        price.text = String(priceList[0])
        pizzaPicker.dataSource = self
        pizzaPicker.delegate = self
    }
    
    @IBAction func toLarge(_ sender: UIButton) {
        large.isSelected = true
        small.isSelected = false
        medium.isSelected = false
        let currentPrice = originalPrice*2.0
        price.text = String(currentPrice)
    }
    @IBAction func toMedium(_ sender: Any) {
        large.isSelected = false
        small.isSelected = false
        medium.isSelected = true
        let currentPrice = originalPrice*1.5
        price.text = String(currentPrice)
    }
    
    @IBAction func addBeef(_ sender: UIButton) {
        var currentPrice = Double(price.text!)!
        if beefCB.isSelected{
            beefCB.isSelected = false
            currentPrice -= toppings["beef"]!
        }
        else{
            beefCB.isSelected = true
            currentPrice += toppings["beef"]!
        }
        price.text = String(currentPrice)
    }
    @IBAction func addMash(_ sender: UIButton) {
        var currentPrice = Double(price.text!)!
        if mashCB.isSelected{
            mashCB.isSelected = false
            currentPrice -= toppings["mash"]!
        }
        else{
            mashCB.isSelected = true
            currentPrice += toppings["mash"]!
        }
        price.text = String(currentPrice)
    }
    @IBAction func addPep(_ sender: UIButton) {
        var currentPrice = Double(price.text!)!
        if pepCB.isSelected{
            pepCB.isSelected = false
            currentPrice -= toppings["pep"]!
        }
        else{
            pepCB.isSelected = true
            currentPrice += toppings["pep"]!
        }
        price.text = String(currentPrice)
    }
    @IBAction func addChicken(_ sender: UIButton) {
        var currentPrice = Double(price.text!)!
        if chickenCB.isSelected{
            chickenCB.isSelected = false
            currentPrice -= toppings["chicken"]!
        }
        else {
            chickenCB.isSelected = true
            currentPrice += toppings["chicken"]!
        }
        price.text = String(currentPrice)
    }
    @IBAction func toSmall(_ sender: Any) {
        large.isSelected = false
        small.isSelected = true
        medium.isSelected = false
        price.text = String(self.originalPrice)
    }
    
}

