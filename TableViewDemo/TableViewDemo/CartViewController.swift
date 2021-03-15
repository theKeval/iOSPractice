//
//  CartViewController.swift
//  TableViewDemo
//
//  Created by Emad Nasrallah on 2021-03-12.
//

import UIKit

class CartViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = cartTable.dequeueReusableCell(withIdentifier: "cart") as! CartCellTableViewCell
        cell.setCart(cartItem: items[indexPath.row])
        return cell
    }
    
    //the function for the action when selecting an item in the tableView
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        totalAmount -= items[indexPath.row].totPrice
        items.remove(at:indexPath.row)
        cartTable.reloadData()
        total.text=String(totalAmount)
        
    }
    
    @IBOutlet weak var total: UILabel!
    @IBOutlet weak var cartTable: UITableView!
    
    var items = [Cart]()
    var totalAmount = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cartTable.dataSource=self
        cartTable.delegate=self
        
        //to remove the unneeded rows at the bottonm
        cartTable.tableFooterView = UIView()
        total.text=String(totalAmount)

       
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as? ViewController
        vc?.cartItems = self.items
        vc?.total = self.totalAmount
    }
    @IBAction func goBack(_ sender: Any) {
        performSegue(withIdentifier: "back", sender: self)
        
    }
    
}
