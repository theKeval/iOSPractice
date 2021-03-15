//
//  ViewController.swift
//  TableViewDemo
//
//  Created by Emad Nasrallah on 2021-03-11.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var prodList = [Product]()
    var tempProd = [Product]()
    var cartItems = [Cart]()
    var price = 0.0
    var total = 0.0
    var name = ""
    var detail = ""
    var image: [String] = [""]
    
    //this function to determie the number of rows in the tableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tempProd.count
    }
    
    //this function is to fill up the cells of the tableVIew by values for columns of the cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let prod = tempProd[indexPath.row]//the index of the selected row in the tableView
        let cell = prodTable.dequeueReusableCell(withIdentifier: "product") as! ProdCell
        cell.setProdCell(product: prod)
        return cell
    }
    
    //this function to do the action once the user clicks any item in the tableView
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.price=tempProd[indexPath.row].price
        self.name=tempProd[indexPath.row].name
        self.detail=tempProd[indexPath.row].details
        self.image=tempProd[indexPath.row].img
        
        
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
        
        let pvc = segue.destination as? ProductViewController
        pvc?.name = self.name
        pvc?.img = self.image
        pvc?.details = self.detail
    }
    
    @IBAction func showMore(_ sender: Any) {
        performSegue(withIdentifier: "more", sender: self)
    }
    func fillData(){
        prodList.append(Product(cat:"Accessories",name:"Universal Charger",price:67.7,img: ["charger", "charger2", "charger3"], details:"【Portable Design】: The compact size ensure maximum portability wherever you go, whether it’s at home, the office or on travels【Multiple Protection】100% New Manufacturer,factory direct supply and best price, New replacement works perfectly; Built-in overload, over-voltage, and short circuit protection; High energy efficiency - friendly to the environment, and your laptop"))
        prodList.append(Product(cat:"Accessories",name:"Laptop Bag",price:73.5,img: ["bag", "laptop_bag_2", "laptop_bag_3", "laptop_bag_4"],details:"Imported 15x11x14 leather messenger bag with 55 adjustabl fits up to 15 laptop / Macbook Made from the e straps.Padded compartment for Laptop (finest leather and lined with high quality canvas this bag is handcrafted by artisans working with leather for decades.Internal Compartments fits documents, files, laptop, notebook, netbook or iPad This leather messenger bag is ideal and perfect for carrying small other stuff. This bag give you feel of retro / vintage look."))
        prodList.append(Product(cat:"Accessories",name:"Laptop Mouse",price:13.0,img: ["mouse", "mouse_2", "mouse_3"],details:"【2020 LATEST UPGRADE LED DESIGN】7 different color changes randomly while in use, offering soothing lighting, creating cool and fancy atmosphere for work and play. It can not be set to one specific color.BUILT-IN BATTERY AND AUTO ENERGY-SAVING】The mouse built-in rechargeable battery, with a charging cable. No need to change batteries.To saving power, the mouse will fall asleep after 10 minutes no-operation, it can be waken up by clicking any button."))
        prodList.append(Product(cat:"Accessories",name:"Laptop Keyboard",price:27.7,img: ["keyboard", "keyboard_2", "keyboard_3"],details:"【Slim and Compact Keyboard With Numeric Keypad】: Wireless keyboard has all keys in scissor-cross low profile structure;which makes it ulra-slim(keystroke travel 2mm),responsive and less noise. And you can use the Numeric Keypad for quick typing and data entry, No troubles with typing Numeric.【Broad Compatibility】: Use with all four major operating systems supporting Bluetooth (IOS, Android, Mac OS and Windows) ,Compatible with iPads, iPhones and Bluetooth-enabled Tablets, Laptops, and Mobile Phones, such as iPad air , iPad mini, iPad Pro, iPhone Xs Max etc."))
        prodList.append(Product(cat:"Accessories",name:"Laptop Cooler",price:35.5,img: ["cooler", "cooling_pad_2", "cooling_pad_3"],details:"High Speed Fan】 The laptop cooling pad is composed of four small fans and two large fans. Proving strong wind, effectively reduce the temperature of your laptop.【7 RGB Lighting Modes】There are extended RGB light bars on both sides. After the laptop cooling pad is powered on, it can distribute cool RGB lighting effect. Contains 7 kinds of lighting special efficacy, you can choose color breathing light or monochrome breathing light mode according to your personal preferences."))
        prodList.append(Product(cat:"Phones",name: "iPhone 12", price: 1200, img: ["iphone12"], details: "The iPhone 12 Pro and 12 Pro Max cost $999 and $1,099 respectively, and come with triple-lens cameras and premium designs."))
        prodList.append(Product(cat:"Phones",name: "iphoneX", price: 877, img: ["iphonex"], details: "However, in 2020, the iPhone X is not a sensible choice. Compared to the iPhone XR and iPhone 11, the iPhone X offers an OLED display which looks way better and sharper. However, the benefits stop there. ... The performance is still great but an iPhone XR will perform better any given day"))
        prodList.append(Product(cat:"Phones",name: "iPhone 8", price: 777, img: ["iphone8"], details: "With the iPhone 8 and 8 Plus are both still solid phones worth considering — perhaps the key factor will be the price. Purchasing an iPhone 8 will allow you to spend less money. Or, alternatively, you could likely purchase an iPhone 8 and Apple Watch Series 3 and still come out spending less money"))
        prodList.append(Product(cat:"Phones",name: "Galaxy s10", price: 989, img: ["galaxys10"], details: "If you don't need the absolute latest and greatest, the year-old flagship remains a top-tier device with specs and cameras that will still be competitive against 2020's better phones"))
        prodList.append(Product(cat:"Phones",name: "Galaxy 21 ulta", price: 1200, img: ["galaxys21"], details: "It's simple: Don't buy the Galaxy S21 Ultra, not because it is not a good phone because it is a fairly good phone, but because it is not a good value for money. Some more details: we have concerns about its design, the camera performance is nice enough and display is something we find quite good"))
        prodList.append(Product(cat:"Phones",name: "Galaxy Note 10", price: 1000, img: ["galaxynote10"], details: "The Galaxy Note 10 Plus is a fantastic big-screen phone. ... But if you want a really big screen, the Galaxy Note 10 Plus is worth the splurge, as it also offers more RAM and microSD expansion, along with longer battery life"))
        prodList.append(Product(cat:"PC parts",name: "SSD", price: 135, img: ["ssd"], details: "SSDs in general are more reliable than HDDs, which again is a function of having no moving parts. ... SSDs commonly use less power and result in longer battery life because data access is much faster and the device is idle more often. With their spinning disks, HDDs require more power when they start up than SSDs."))
        prodList.append(Product(cat:"PC parts",name: "RAM", price: 67, img: ["ram"], details: "Originally Answered: Is 16 gb if ram overkill for gaming? Nope! At this point, 16GB is actually the ideal amount of RAM for gaming, so long as it's running in Dual-channel. ... Most older games will still not require more than the 4–6 GB of RAM the used, but to keep up with the demands of newer games, more RAM is required"))
        prodList.append(Product(cat:"PC parts",name: "CPU", price: 345, img: ["cpu"], details: "Central processing unit (CPU), principal part of any digital computer system, generally composed of the main memory, control unit, and arithmetic-logic unit. ... In modern computers, the CPU is contained on an integrated circuit chip called a microprocessor. circuit board. Computer circuit board containing a microprocessor"))
        prodList.append(Product(cat:"PC parts",name: "Mother Board", price: 230, img: ["motherboard"], details: "The motherboard is the backbone that ties the computer's components together at one spot and allows them to talk to each other. Without it, none of the computer pieces, such as the CPU, GPU, or hard drive, could interact. Total motherboard functionality is necessary for a computer to work well"))
        
        
        //fill the tempProd array with items belong to the accessories category as its the first one
        for prod in prodList {
            if prod.category == "Accessories"{
                tempProd.append(prod)
            }
        }
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
    @IBAction func changeCategory(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            tempProd.removeAll()
            for prod in prodList {
                if prod.category == "Accessories" {
                    tempProd.append(prod)
                }
            }
            prodTable.reloadData()
        case 1:
            tempProd.removeAll()
            for prod in prodList {
                if prod.category == "Phones" {
                    tempProd.append(prod)
                }
            }
            prodTable.reloadData()
        default:
            tempProd.removeAll()
            for prod in prodList {
                if prod.category == "PC parts" {
                    tempProd.append(prod)
                }
            }
            prodTable.reloadData()
        }
    }
    
}

