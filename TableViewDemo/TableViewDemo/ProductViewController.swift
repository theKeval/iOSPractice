//
//  ProductViewController.swift
//  TableViewDemo
//
//  Created by Emad Nasrallah on 2021-03-12.
//

import UIKit

class ProductViewController: UIViewController {

    @IBOutlet weak var qty: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productDetails: UITextView!
    @IBOutlet weak var productName: UILabel!
    var name = ""
    var img = ""
    var details = ""
    var price = 0.0
    
    //array for the cart
    var cartItems = [Cart]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        productName.text = name
        productImage.image=UIImage(named:img)
        productDetails.text=details

        // Do any additional setup after loading the view.
    }
    

    @IBAction func addQty(_ sender: UIStepper) {
        qty.text = String(sender.value)
    }
    
    @IBAction func addToCart(_ sender: Any) {
        let total = price * Double(qty.text!)!
        
        cartItems.append(Cart(name:self.name, qty: Double(qty.text!)!, tot: total))
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cvc = segue.destination as? CartViewController
        
        //passing the whole array of cart items into the cart view controller
        cvc?.items = self.cartItems
    }
    
    @IBAction func showCart(_ sender: Any) {
        performSegue(withIdentifier: "cart", sender: self)
        
    }
    @IBAction func placeOrder(_ sender: Any) {
    }
}
