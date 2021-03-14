//
//  CartCellTableViewCell.swift
//  TableViewDemo
//
//  Created by Emad Nasrallah on 2021-03-12.
//

import UIKit

class CartCellTableViewCell: UITableViewCell {

    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var quantity: UILabel!
    @IBOutlet weak var name: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setCart(cartItem:Cart){
        price.text = String(cartItem.totPrice)
        quantity.text = String(cartItem.quantity)
        name.text = cartItem.name
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
