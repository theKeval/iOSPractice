//
//  ViewController.swift
//  March5App
//
//  Created by Mervat Mustafa on 2021-03-05.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
       
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == carType{
            return tmpCars.count
        }else {
            return carMakes.count
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == carType {
            return tmpCars[row].name
        }
        else {
            return carMakes[row]
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == carMake{
        //clear the items from the tempCars array
        tmpCars.removeAll()
        
        //refill the tempCars array upon the car make
        for car in carList {
            if car.make == carMakes[row]{
                tmpCars.append(car)
            }
        }
            carType.reloadAllComponents()
       }
        else {
            dailyRate.text = String(tmpCars[row].rate)
            currentMillage.text = String(tmpCars[row].millage)
        }
    }
    
    @IBOutlet weak var less20: UIButton!
    @IBOutlet weak var navCB: UIButton!
    @IBOutlet weak var daysNo: UILabel!
    @IBOutlet weak var finalAmount: UILabel!
    @IBOutlet weak var retMillage: UITextField!
    @IBOutlet weak var childCB: UIButton!
    @IBOutlet weak var currentMillage: UILabel!
    @IBOutlet weak var more60: UIButton!
    @IBOutlet weak var less60: UIButton!
    @IBOutlet weak var carMake: UIPickerView!
    @IBOutlet weak var dailyRate: UILabel!
    @IBOutlet weak var carType: UIPickerView!
    
    var carList = [Car]()
    let carMakes = ["Ford","Nissan","Toyota","Dodge","Honda"]
    
    //this array will keep refilled with eveytime the user picks an item from the first pickerView
    var tmpCars = [Car]()
    
    var insurance = 15.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fillData()
        
        
        carMake.dataSource = self
        carMake.delegate = self
        
        carType.dataSource = self
        carType.delegate = self
    }
    func fillData(){
        carList.append(Car(make:carMakes[0],name:"Mustang",rate:200,millage:3450))
        carList.append(Car(make:carMakes[0],name:"Edge",rate:70,millage:8253))
        carList.append(Car(make:carMakes[0],name:"Focus",rate:30,millage:13367))
        carList.append(Car(make:carMakes[0],name:"Escape",rate:50,millage:10671))
        carList.append(Car(make:carMakes[1],name:"Sunny",rate:30,millage:10231))
        carList.append(Car(make:carMakes[1],name:"Rogue",rate:60,millage:4219))
        carList.append(Car(make:carMakes[1],name:"Kiks",rate:45,millage:3201))
        carList.append(Car(make:carMakes[1],name:"Pathfinder",rate:90,millage:2034))
        carList.append(Car(make:carMakes[1],name:"Murano",rate:75,millage:8501))
        carList.append(Car(make:carMakes[2],name:"Camry",rate:45,millage:20341))
        carList.append(Car(make:carMakes[2],name:"Corolla",rate:35,millage:12345))
        carList.append(Car(make:carMakes[2],name:"Yaris",rate:30,millage:30348))
        carList.append(Car(make:carMakes[3],name:"Charger",rate:80,millage:8753))
        carList.append(Car(make:carMakes[3],name:"Caravan",rate:130,millage:9023))
        carList.append(Car(make:carMakes[3],name:"Jurney",rate:70,millage:23901))
        carList.append(Car(make:carMakes[4],name:"City",rate:30,millage:3049))
        carList.append(Car(make:carMakes[4],name:"Civic",rate:35,millage:7401))
        carList.append(Car(make:carMakes[4],name:"Accord",rate:60,millage:7912))
        
        //fill the tmpCar array as the types of the first car make
        for car in carList {
            if car.make == carMakes[0] {
                tmpCars.append(car)
            }
        }
       
        
        
    }

    @IBAction func addNoDays(_ sender: UIStepper) {
        daysNo.text = String(sender.value)
    }
    @IBAction func addChileSeat(_ sender: Any) {
        var dRate = Double(dailyRate.text!)!
        if childCB.isSelected {
            childCB.isSelected = false
            dRate -= 9.0
        }else {
            childCB.isSelected = true
            dRate += 9.0
        }
        dailyRate.text = String(dRate)
    }
    @IBAction func addNavCB(_ sender: Any) {
        var dRate = Double(dailyRate.text!)!
        if navCB.isSelected {
            navCB.isSelected = false
            dRate -= 5.0
        }else {
            navCB.isSelected = true
            dRate += 5.0
        }
        dailyRate.text = String(dRate)
    }
    @IBAction func driverMore60(_ sender: Any) {
        more60.isSelected = true
        less60.isSelected = false
        less20.isSelected = false
        insurance = 18.0
    }
    @IBAction func driverLess60(_ sender: Any) {
        more60.isSelected = false
        less60.isSelected = true
        less20.isSelected = false
        insurance = 15.0
    }
    @IBAction func driveLess20(_ sender: Any) {
        more60.isSelected = false
        less60.isSelected = false
        less20.isSelected = true
        insurance = 22.0
    }
    
    @IBAction func ok(_ sender: Any) {
        let cM = Double(currentMillage.text!)!
        let rM = Double(retMillage.text!)!
        let dRate = Double(dailyRate.text!)!
        let millage = rM - cM
        let dN = Double(daysNo.text!)!
        var milAmount = 0.0
        if millage > dN * 200 //limit millages
        {
            milAmount = 0.05 * dRate * (millage - dN)
        }
        let total = (dRate + insurance) * dN + milAmount
        
        finalAmount.text = String(total)
    }
}

