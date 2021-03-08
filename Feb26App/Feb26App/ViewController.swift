//
//  ViewController.swift
//  Feb26App
//
//  Created by Mervat Mustafa on 2021-02-26.
//

import UIKit

class product{
    
}

class ViewController: UIViewController {
    @IBOutlet weak var quantity: UITextField!
    let prodList = ["coffee":2.5,"tea":1.7,"donut":2.0,"mocha":3.15,"latte":3.7]
    
    var grandTotal = 0.0
    @IBOutlet weak var prodPrice: UITextField!
    @IBOutlet weak var soldQTY: UISlider!
    @IBOutlet weak var prodImage: UIImageView!
    @IBOutlet weak var msg: UITextField!
    @IBOutlet weak var totalAmount: UITextField!
    @IBOutlet weak var prodName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func placeOrder(_ sender: Any) {
        grandTotal = 0.0
        msg.text = "Your order received and is getting prepared"
    }
    @IBAction func findProdcut(_ sender: Any) {
        
        if prodName.text == "" {
            msg.text = "Please enter a product name"
        }
        else{
            msg.text = ""
            let name = prodName.text?.lowercased()
            let price = getPrice(name: name!)
            if price == -1.0{
                msg.text = "The product doesn't exist"
            }else{
                msg.text = ""
                prodPrice.text=String(price)
                prodImage.image = UIImage(named:name!)
            }
        }
       
    }
    
    @IBAction func addToCart(_ sender: Any) {
        if prodPrice.text == ""{
            msg.text = "Please enter a product name"
        }
        else{
            msg.text = ""
        
        let total = Double(prodPrice.text!)! * Double(quantity.text!)! * 1.13
        grandTotal += total
        totalAmount.text = String(format: "%.2f", grandTotal)
        }
    }
    @IBAction func getQty(_ sender: Any) {
        quantity.text = String(Int(soldQTY.value))
    }
    //function to find the product and return its price or -1 if it dnoes't exist
    func getPrice(name:String) -> Double
    {
        for prod in prodList.keys {
            if prod == name {
                return prodList[prod]!
            }
        }
        return -1.0
    }
}

