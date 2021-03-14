//
//  ViewController.swift
//  TourismPlaces
//
//  Created by Mervat Mustafa on 2020-11-17.
//

import UIKit

//to use pickerview we must let the class inherit from the UIPickerViewDelegate and the UIPickerViewDataSource
class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    //this function is required for the pickrview to determine how many components in the row
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        //we have one item in the row
        return 1
    }
    
    //this function to detrmine how many rows in the pickerview
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        //because we have 2 pickerview we need if to know which one we are setting up
        if pickerView == country {
            return countryList.count //number of rows
        }else {
            return countryPlaces.count //number of rows
        }
        
    }
    
    //this function to show the items of the pickerview in all rows
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        //we have 2 pickerviews so we need if
        if pickerView == self.country{
            return self.countryList[row]
        } else {
            return self.countryPlaces[row]}
        
    }
    
    //this function is doing an action when the user picks any row of the picker view
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if pickerView == self.country{
            countryPlaces.removeAll() //empty the array of country places to refill it upon the country
        //refill the array of country places
            for con in placesList{
            if con.country == countryList[row]{
                countryPlaces.append(con.name)
            }
        }
            //everytime we change the country then the places pickerview must be changed so we reload it
        self.places.reloadAllComponents()
            
            //return the position of row for the place pickerview to sero to start over
            self.places.selectRow(0, inComponent: 0, animated: true)
            //let the placename get the name of the first place of the array country places
            self.placeName = countryPlaces[0]
            //let the image show the picture of the first place of the array countryplaces
        img.image = UIImage(named: findImageName(placeName:countryPlaces[0]))
        
        //if the user picks a place
        }else if pickerView == self.places{
            //showing the place image
            img.image = UIImage(named: findImageName(placeName: countryPlaces[row]))
            //saving the place name in the placeName var.
            self.placeName = countryPlaces[row]
        }
    }
    //this fucntion gets the name of the place and returns the name of its image
    func findImageName(placeName:String) ->String{
        for con in placesList{
            if con.name == placeName{
                return con.image
            }
        }
        return ""
    }
    //this fucntion get the name of the place and returnss its details
    func findDetails(placeName:String) ->String
    {
        for con in placesList{
            if con.name == placeName{
                return con.details
            }
        }
        return ""
    }
    @IBOutlet weak var country: UIPickerView!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var places: UIPickerView!
    var placeName = ""
    var placesList = [Place]()
    let countryList = ["Canada","India","Jordan"]
    var countryPlaces = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        fillData() //filling the data by calling the funciton
       
        //its important for each pickerview
        country.dataSource = self
        country.delegate = self
        places.dataSource = self
        places.delegate = self
        
        //showing the image of the first place
        img.image = UIImage(named: findImageName(placeName:countryPlaces[0]))
        //saving the name of the first place
        self.placeName = countryPlaces[0]
        // Do any additional setup after loading the view.
    }
    
       
    //this function for preparing to move to the destination view controller and pass values from self view controlooer to the destination
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //create a reference for the DetailsViewController
        let dvc = segue.destination as? DetailedViewController
       
        //pass values from self to the other view controller
        dvc!.placeName = self.placeName
        dvc!.plDetails = findDetails(placeName: self.placeName)
        dvc!.imgName = findImageName(placeName: self.placeName)
    }
    
    @IBAction func showMore(_ sender: Any) {
        //determine which segue to be performed by its identifer
        performSegue(withIdentifier: "details", sender: self)
    }
    func fillData(){
        placesList.append(Place(name: "Niagara Falls", image: "niagara", country: "Canada", details: "The Niagara River flows at approximately 35 miles/hour (56.3 kilometers/hour). There are actually two waterfalls in Niagara, the American Falls and the Canadian Horseshoe Falls. It is the combination of height and water flow that makes Niagara Falls so beautiful. ... Skylon Tower rises 775 feet above the Falls."))
        placesList.append(Place(name: "Algonquon Park", image: "algonquon", country: "Canada", details: "Algonquin Provincial Park is a provincial park located between Georgian Bay and the Ottawa River in Ontario, Canada, mostly within the Unorganized South Part of Nipissing District. ... Additions since its creation have increased the park to its current size of about 7,653 square kilometres (2,955 sq mi)."))
        placesList.append(Place(name: "Blue Mountain", image: "blue", country: "Canada", details: "The Blue Mountains has a host of recreational activities for all the seasons. Most notably is the winter skiing, snowboarding, snowshoeing and cross-country skiing. In the summer there is hiking, downhill/cross-country biking, an extravagant mini putt, the Ridge Runner and events such as Met Con Blue"))
        placesList.append(Place(name: "Thousends Islands", image: "thousends", country: "Canada", details: "The Thousand Islands (French: Mille-Îles) constitute a North American archipelago of 1,864 islands that straddles the Canada–US border in the Saint Lawrence River as it emerges from the northeast corner of Lake Ontario. They stretch for about 50 miles (80 km) downstream from Kingston, Ontario."))
        placesList.append(Place(name: "Rocky Mountain", image: "rocky", country: "Canada", details: "The Canadian Rockies mountain range spans the provinces of British Columbia and Alberta. With jagged, ice-capped peaks, including towering Mt. Robson, it's a region of alpine lakes, diverse wildlife and outdoor recreation sites. Yoho National Park is home to the massive Takakkaw Falls. Other national parks are Jasper, with the famously accessible Athabasca Glacier, and Banff, site of glacier-fed Lake Louise"))
        placesList.append(Place(name: "Taj Mahal", image: "taj", country: "India", details: "An immense mausoleum of white marble, built in Agra between 1631 and 1648 by order of the Mughal emperor Shah Jahan in memory of his favourite wife, the Taj Mahal is the jewel of Muslim art in India and one of the universally admired masterpieces of the world's heritage."))
        placesList.append(Place(name: "Kumbhalgarh Fort", image: "kumbh", country: "India", details: "Kumbhalgarh is a Mewar fortress on the westerly range of Aravalli Hills, in the Rajsamand district near Udaipur of Rajasthan state in western India. It is a World Heritage Site included in Hill Forts of Rajasthan. Built during the course of the 15th century by Rana Kumbha"))
        placesList.append(Place(name: "Amritsar Fort", image: "amristar", country: "India", details: "Gobindgarh Fort is a historic military fort located in the center of the city of Amritsar in the Indian state of Punjab. The Fort was until recently occupied by the army but was opened to the public from 10 February 2017. ... The fort had 25 cannons mounted on its ramparts and it remained with the Bhangi rulers till 1805"))
        placesList.append(Place(name: "Golden Temple", image: "golden", country: "India", details: "The Golden Temple, also known as Harmandir Sahib, meaning abode of God or Darbār Sahib, meaning exalted court, is a gurdwara located in the city of Amritsar, Punjab, India. It is the preeminent spiritual site of Sikhism"))
        placesList.append(Place(name: "Pangong Lake", image: "pangong", country: "India", details: "Pangong Lake, situated at a height of almost 4,350m, is the world's highest saltwater lake. Its water, which seems to be dyed in blue, stand in stark contrast to the arid mountains surrounding it. Extending to almost 160km, one-third of the Pangong Lake lies in India and the other two-thirds in China"))
        placesList.append(Place(name: "Petra", image: "petra", country: "Jordan", details: "Famous for its rock-cut architecture and water conduit system, Petra is also called the 'Rose City' because of the colour of the stone from which it is carved. It has been a UNESCO World Heritage Site since 1985. ... Petra is a symbol of Jordan, as well as Jordan's most-visited tourist attraction"))
        placesList.append(Place(name: "Dead Sea", image: "dead", country: "Jordan", details: "Lake/Sea of Lot is a salt lake bordered by Jordan to the east and Israel and the West Bank to the west. It lies in the Jordan Rift Valley, and its main tributary is the Jordan River."))
        placesList.append(Place(name: "Wadi Rum", image: "rum", country: "Jordan", details: "Wadi Rum (Arabic: وادي رم‎ Wādī Ramm), known also as the Valley of the Moon (Arabic: وادي القمر‎ Wādī al-Qamar), is a valley cut into the sandstone and granite rock in southern Jordan 60 km (37 mi) to the east of Aqaba; it is the largest wadi in Jordan."))
        placesList.append(Place(name: "Aqaba Gulf", image: "aqaba", country: "Jordan", details: "Aqaba (English: /ˈækəbə/,[2] also US: /ˈɑːk-/;[3] Arabic: العقبة‎, romanized: al-ʿAqaba, al-ʿAgaba, pronounced [æl ˈʕæqaba, alˈʕagaba]) is the only coastal city in Jordan and the largest and most populous city on the Gulf of Aqaba.[4] Situated in southernmost Jordan, Aqaba is the administrative centre of the Aqaba Governorate.[5] The city had a population of 148,398 in 2015 and a land area of 375 square kilometres (144.8 sq mi)"))
        
        //fill the counryPlaces array with places of the first country
        for pl in placesList {
            if pl.country == countryList[0]
            {
                countryPlaces.append(pl.name)
            }
        }
        
    }


}

