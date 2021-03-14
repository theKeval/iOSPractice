//
//  LoginViewController.swift
//  LoginDemo
//
//  Created by Mervat Mustafa on 2021-03-10.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var errMsg: UILabel!
    @IBOutlet weak var usrName: UITextField!
    
    @IBOutlet weak var passWord: UITextField!
    
    var users = [User]()
    var personName = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        fillData()

        // Do any additional setup after loading the view.
    }
    func fillData() {
        users.append(User(username:"user1",password:"123456",first:"Saleem",last:"Shaik"))
        users.append(User(username: "user2", password: "112233", first: "Amit", last:"Bachan"))
        users.append(User(username: "user3", password: "654321", first: "Lino", last: "Hernandez"))
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        let vc = segue.destination as? ViewController
        
        
        // Pass the selected object to the new view controller.
        vc?.personName = self.personName
    }
    
    //a function to verify if the username and password are correct it returns the person name
    //if the username or password invalid it returns inavlid
    func verifyLogin() -> String{
        let userN = usrName.text
        let pass = passWord.text
        for usr in users {
            if usr.username == userN && usr.password == pass {
                let name = usr.firstName + " " + usr.lastName
                return name
            }
        }
        return "invalid"
    }

    //this fucntion to check if should perfrome the segue or not upon the condition
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        let getVerify = verifyLogin()
        if getVerify == "invalid" {
            return false
        } else {
            personName = getVerify
            return true
        }
    }
        
    @IBAction func moveToMain(_ sender: Any) {
        //check if shouldperfomrsege is true
        if shouldPerformSegue(withIdentifier: "login", sender: self) {
            performSegue(withIdentifier: "login", sender: self)
        } else {
            errMsg.text = "invalid username or password"
        }
        
    }
    
}
