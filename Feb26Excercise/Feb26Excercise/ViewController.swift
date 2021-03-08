//
//  ViewController.swift
//  Feb26Excercise
//
//  Created by Keval on 2/26/21.
//

import UIKit

class ViewController: UIViewController {
    
    
    var dataSet = [MyData]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        dataSet.append(MyData(name: "chair", price: 20, discountRate: 15, stock: 10, imgName: "chair"))
        dataSet.append(MyData(name: "table", price: 30, discountRate: 7, stock: 7, imgName: "table"))
        dataSet.append(MyData(name: "cupboard", price: 1000, discountRate: 17, stock: 4, imgName: "cupboard"))
        
    }
    

    @IBOutlet weak var fieldName: UITextField!
    @IBOutlet weak var errMsg: UILabel!
    @IBOutlet weak var txtPrice: UILabel!
    @IBOutlet weak var imgHolder: UIImageView!
    @IBOutlet weak var sliderQuantity: UISlider!
    @IBOutlet weak var txtQuantity: UILabel!
    @IBOutlet weak var txtGrandTotal: UILabel!
    
    var selectedProduct: String = ""
    var selectedQuantity: Int = 1
    
    var productTotal: Double = 0.0
    var grandTotal: Double = 0.0
    
    @IBAction func quantityCheck(_ sender: Any) {
        selectedQuantity = Int(sliderQuantity.value)
        txtQuantity.text = String(selectedQuantity)
    }
    
    @IBAction func find(_ sender: Any) {
        for item in dataSet {
            if item.name.lowercased() == fieldName.text?.lowercased() {
                txtPrice.text = "Price of \(item.name) is \(item.price)"
                imgHolder.image = UIImage(named: item.imgName)
                selectedProduct = item.name
                return
            }
        }
        
        errMsg.text = "There is no item available"
    }
    
    
    @IBAction func addToCart(_ sender: Any) {
        for item in dataSet {
            if item.name == selectedProduct {
                if item.stock >= selectedQuantity {
                    // proceed with available quantity
                    let discounted_rate = item.price - ((item.price * item.discountRate)/100)
                    let tax = item.price * 1.13
                    let prodPrice = discounted_rate + tax
                    productTotal = prodPrice * Double(selectedQuantity)
                    grandTotal += productTotal
                    
                    txtGrandTotal.text = "Grand total: \(grandTotal)"
                    errMsg.text = ""
                    
                    item.stock -= selectedQuantity
                    
                    fieldName.text = ""
                    txtPrice.text = ""
                    imgHolder.image = nil
                    sliderQuantity.value = 1
                    txtQuantity.text = ""
                    errMsg.text = ""
                }
                else {
                    errMsg.text = "Sorry, We don't have enough quantity"
                }
            }
        }
    }
    
    
}

