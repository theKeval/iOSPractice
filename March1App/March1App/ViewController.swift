//
//  ViewController.swift
//  March1App
//
//  Created by Mervat Mustafa on 2021-03-01.
//

import UIKit

class ViewController: UIViewController {
    
    //create the car list
    var carList = [Car]()

    
    @IBOutlet weak var driverAge: UISwitch!
    @IBOutlet weak var errMsg: UILabel!
    @IBOutlet weak var days: UILabel!
    @IBOutlet weak var childSeat: UISwitch!
    @IBOutlet weak var returnedMillage: UITextField!
    @IBOutlet weak var finalAmount: UILabel!
    @IBOutlet weak var carImage: UIImageView!
    @IBOutlet weak var currentMillage: UILabel!
    @IBOutlet weak var carName: UITextField!
    @IBOutlet weak var dailyRate: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fillData()
        // Do any additional setup after loading the view.
    }

    @IBAction func findCar(_ sender: Any) {
        if carName.text == "" {
            errMsg.text = "Please enter the car name"
        }
        else {
            let ourCar = searchByCarName(name: carName.text!)
            if ourCar == nil{
                errMsg.text = "The car is not found"
            }
            else{
            errMsg.text = ""
            dailyRate.text = String(ourCar!.carRate)
            currentMillage.text = String(ourCar!.carMillage)
            carImage.image = UIImage(named: ourCar!.carImage)
            }
        }
    }
    @IBAction func changeDays(_ sender: UIStepper) {
        var day = 0.0
        day = sender.value
        days.text = String(day)
    }
    
    @IBAction func calculate(_ sender: Any) {
        var dRate = Double(dailyRate.text!)!
        let getDays = Double(days.text!)!
        if driverAge.isOn{ //if the driver age is less than 20
            dRate=dRate*1.1 //add 10% to the daily rate
        }
        if childSeat.isOn{ //if the car has a child seat
            dRate+=10.0
        }
        if returnedMillage.text == "" {
            errMsg.text = "Please enter the returned millage"
        }
        else {
            errMsg.text = ""
            let newMillage = Double(returnedMillage.text!)!
            let oldMillage = Double(currentMillage.text!)!
            let millagediff = newMillage - oldMillage
            //suppose the daily limit for each car is 100 miles a day
            //the customer has to pay 10% of daily rate for each extra mile
            var extra = 0.0
            let limit = getDays * 200.0
            if millagediff > limit{
                 extra = Double(millagediff-limit) * dRate * 0.01
                
            }
            
            let total = getDays*dRate+extra
            finalAmount.text = String(total)
            
        }
    }
    
    func fillData()
    {
        carList.append(Car(name:"Nissan Rogue",rate:45,img:"rogue",millage:17234))
        carList.append(Car(name:"Ford Edge",rate:50,img:"edge",millage:11231))
        carList.append(Car(name:"Chrysler 300",rate:75,img:"chrysler",millage:8756))
        carList.append(Car(name:"Ford Mustang",rate:245,img:"mustang",millage:2350))
        carList.append(Car(name:"Dodge Charger",rate:55,img:"charger",millage:21987))
    }
    func searchByCarName(name:String) -> Car!
    {
        for car in carList{
            if car.carName == name {
                return car
            }
        }
        return nil
    }
}

