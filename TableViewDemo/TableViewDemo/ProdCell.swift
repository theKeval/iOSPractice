//
//  ProdCell.swift
//  TableViewDemo
//
//  Created by Emad Nasrallah on 2021-03-11.
//

import UIKit

class ProdCell: UITableViewCell {

    @IBOutlet weak var prodName: UILabel!
    @IBOutlet weak var prodImg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBOutlet weak var prodPrice: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //this function to show values of the selected product in the cell columns
    func setProdCell (product: Product){
        prodName.text=product.name
        prodPrice.text=String(product.price)
        prodImg.image=UIImage(named:product.img[0])
    }

}
