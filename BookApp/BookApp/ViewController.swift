//
//  ViewController.swift
//  BookApp
//
//  Created by Mervat Mustafa on 2020-11-11.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    //this function to determine how many parts each row of the picker view has
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    //this fucntion detemines how many rows in the pickerview
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return bookList.count
    }
    
    //this fucntion to fill items as rows in the picker view
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        bookList[row].Title
    }
    //this function for the action when the user pickes an item from the picker view
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        Bauthor.text = bookList[row].Author
        Bprice.text = String(bookList[row].Price)
        Bimg.image = UIImage(named: bookList[row].Image)
        if bookList[row].Available {
            Baval.text = "Yes"
        }else {
            Baval.text = "No"
        }
    }
    @IBOutlet weak var Btitle: UIPickerView!
    @IBOutlet weak var Bprice: UITextField!
 
    @IBOutlet weak var Bisbn: UITextField!
    @IBOutlet weak var Bimg: UIImageView!
    @IBOutlet weak var Baval: UITextField!
    @IBOutlet weak var Bauthor: UITextField!
    var bookList = [Book]()
    override func viewDidLoad() {
        super.viewDidLoad()
        fillData()
        Btitle.dataSource = self
        Btitle.delegate = self
        // Do any additional setup after loading the view.
    }
    @IBAction func getBook(_ sender: Any, forEvent event: UIEvent) {
        for book in bookList {
            if book.ISBN == Int(Bisbn.text!){
                Bprice.text = String(book.Price)
                Bauthor.text = book.Author
                Bimg.image = UIImage(named: book.Image)
                if book.Available {
                    Baval.text = "Yes"
                }
                else{
                    Baval.text = "No"
                }
        }
    }
    }
        
    func fillData(){
        //when we have a database we can fill the data in the array from the database
        bookList.append(Book(isbn:1234567891,title:"Swift for beginners",author: "Kirna",price:75.0,aval: true,img:"swift"))
        bookList.append(Book(isbn:1234567892,title:"Java for beginners",author: "Sai",price:65.0,aval: false,img:"java"))
        bookList.append(Book(isbn:1234567893,title:"Android for beginners",author: "Sayed",price:70.0,aval: true,img:"android"))
        bookList.append(Book(isbn:1234567894,title:"Python for beginners",author: "Jigar",price:85.0,aval: true,img:"python"))
        bookList.append(Book(isbn:1234567895,title:"C# for beginners",author: "Sruti",price:55.0,aval: false,img:"cshapr"))
        
    }


}

