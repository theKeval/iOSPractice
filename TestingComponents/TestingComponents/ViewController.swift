//
//  ViewController.swift
//  TestingComponents
//
//  Created by Keval on 3/8/21.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var pickerManuf: UIPickerView!
    @IBOutlet weak var pickerModel: UIPickerView!
    @IBOutlet weak var lablePrice: UILabel!
    
//    var data: [String, [String]] = [
//    "abc" : ["xyz", "pqr"]
//    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == pickerManuf {
            // add code here
        }
        else {
            
        }
    }
    
}

