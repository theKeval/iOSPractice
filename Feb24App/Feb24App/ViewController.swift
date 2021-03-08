//
//  ViewController.swift
//  Feb24App
//
//  Created by Mervat Mustafa on 2021-02-24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var errMsg: UITextField!
    
    @IBOutlet weak var height: UITextField!
    @IBOutlet weak var weight: UITextField!
    @IBOutlet weak var category: UITextField!
    
    @IBOutlet weak var bmi: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func clear(_ sender: Any) {
        //to remove all details
        height.text = ""
        weight.text = ""
        bmi.text = ""
        category.text = ""
        
    }
    @IBAction func compute(_ sender: Any) {
        //make sure no nil for the height and weight
        if height.text == "" || weight.text == "" {
            errMsg.text = "Please enter height and weight"
        }
        else{
        //clear the error message
            errMsg.text = ""
        //get the value of the weight
        let wt = Double(weight.text!)!
        //get the value of the hieght in centimeters
        //convert the value of height into meters
        let ht = Double(height.text!)!/100
        
        //bmi = weight(kg)/heigh(m) * height(m)
        let bm = wt/(ht*ht)
            bmi.text = String(format:"%.4f",bm)
        
        //find the category
        if bm < 18.5 {
            category.text="under weight"
        }
        else if bm < 24.9 {
            category.text="normal"
        }
        else if bm < 29.9 {
            category.text="over weight"
        }
        else {
            category.text="obesity"
        }
        }
        
    }
    
}

