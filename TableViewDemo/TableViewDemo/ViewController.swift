//
//  ViewController.swift
//  TableViewDemo
//
//  Created by Emad Nasrallah on 2021-03-11.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var prodList = [Product]()
    var cartItems = [Cart]()
    var price = 0.0
    var total = 0.0
    var name = ""
    var detail = ""
    var image = ""
    
    //this function to determie the number of rows in the tableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        prodList.count
    }
    
    //this function is to fill up the cells of the tableVIew by values for columns of the cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let prod = prodList[indexPath.row]//the index of the selected row in the tableView
        let cell = prodTable.dequeueReusableCell(withIdentifier: "product") as! ProdCell
        cell.setProdCell(product: prod)
        return cell
    }
    
    //this function to do the action once the user clicks any item in the tableView
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.price=prodList[indexPath.row].price
        self.name=prodList[indexPath.row].name
        self.detail=prodList[indexPath.row].details
        self.image=prodList[indexPath.row].img
        
        
    }
   

    @IBOutlet weak var prodTable: UITableView!
    @IBOutlet weak var qty: UILabel!
    @IBOutlet weak var amount: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        fillData()
        prodTable.delegate=self
        prodTable.dataSource=self
        prodTable.tableFooterView = UIView()
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cvc = segue.destination as? CartViewController
        cvc?.items = self.cartItems
        cvc?.totalAmount = self.total
    }
    
    func fillData(){
        prodList.append(Product(name:"Universal Charger",price:67.7,img: "charger", details:"【Portable Design】: The compact size ensure maximum portability wherever you go, whether it’s at home, the office or on travels【Multiple Protection】100% New Manufacturer,factory direct supply and best price, New replacement works perfectly; Built-in overload, over-voltage, and short circuit protection; High energy efficiency - friendly to the environment, and your laptop"))
        prodList.append(Product(name:"Laptop Bag",price:73.5,img: "bag",details:"Imported 15x11x14 leather messenger bag with 55 adjustabl fits up to 15 laptop / Macbook Made from the e straps.Padded compartment for Laptop (finest leather and lined with high quality canvas this bag is handcrafted by artisans working with leather for decades.Internal Compartments fits documents, files, laptop, notebook, netbook or iPad This leather messenger bag is ideal and perfect for carrying small other stuff. This bag give you feel of retro / vintage look."))
        prodList.append(Product(name:"Laptop Mouse",price:13.0,img: "mouse",details:"【2020 LATEST UPGRADE LED DESIGN】7 different color changes randomly while in use, offering soothing lighting, creating cool and fancy atmosphere for work and play. It can not be set to one specific color.BUILT-IN BATTERY AND AUTO ENERGY-SAVING】The mouse built-in rechargeable battery, with a charging cable. No need to change batteries.To saving power, the mouse will fall asleep after 10 minutes no-operation, it can be waken up by clicking any button."))
        prodList.append(Product(name:"Laptop Keyboard",price:27.7,img: "keyboard",details:"【Slim and Compact Keyboard With Numeric Keypad】: Wireless keyboard has all keys in scissor-cross low profile structure;which makes it ulra-slim(keystroke travel 2mm),responsive and less noise. And you can use the Numeric Keypad for quick typing and data entry, No troubles with typing Numeric.【Broad Compatibility】: Use with all four major operating systems supporting Bluetooth (IOS, Android, Mac OS and Windows) ,Compatible with iPads, iPhones and Bluetooth-enabled Tablets, Laptops, and Mobile Phones, such as iPad air , iPad mini, iPad Pro, iPhone Xs Max etc."))
        prodList.append(Product(name:"Laptop Cooler",price:35.5,img: "cooler",details:"High Speed Fan】 The laptop cooling pad is composed of four small fans and two large fans. Proving strong wind, effectively reduce the temperature of your laptop.【7 RGB Lighting Modes】There are extended RGB light bars on both sides. After the laptop cooling pad is powered on, it can distribute cool RGB lighting effect. Contains 7 kinds of lighting special efficacy, you can choose color breathing light or monochrome breathing light mode according to your personal preferences."))
    }

   
    @IBAction func stQty(_ sender: UIStepper) {
        qty.text = String(sender.value)
    }
    @IBAction func ok(_ sender: Any) {
        let quant = Double(qty.text!)!
        total += price*quant
        amount.text=String(total)
        
    }
    @IBAction func showCart(_ sender: Any) {
        performSegue(withIdentifier: "cart", sender: self)
    }
    @IBAction func addToCart(_ sender: Any) {
        let quant = Double(qty.text!)!
        let tot = price*quant
        self.cartItems.append(Cart(name:self.name,qty:quant,tot:tot))
        total += tot
    }
    
    @IBAction func placeOrder(_ sender: Any) {
        amount.text = String(self.total)
        self.total = 0
        cartItems.removeAll()
    }
}

