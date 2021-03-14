//
//  DetailedViewController.swift
//  TourismPlaces
//
//  Created by Mervat Mustafa on 2020-11-17.
//

import UIKit

class DetailedViewController: UIViewController {
   
    @IBOutlet weak var placeDetails: UITextView!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var placeTitle: UITextField!
    var placeName = ""
    var imgName = ""
    var plDetails = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        placeTitle.text = placeName
        img.image = UIImage(named: imgName)
        placeDetails.text = plDetails
        

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
