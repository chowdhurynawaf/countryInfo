//
//  TableViewController.swift
//  Country Wiki
//
//  Created by toumalmojumder on 6/12/18.
//  Copyright © 2018 toumalmojumder. All rights reserved.
//

import UIKit

var seguename:String = ""
struct AllThings: Decodable  {
    let name:String
    let capital:String
    let population:Int
    let flag:String
    let alpha2Code:String?
}
var namest:[String] = []
var capitalst:[String] = []
var populationst:[Int] = []
var flagst:[String] = []
var countryCode:[String] = []

var myIndex:Int = 0
var capData:String = ""
var popuData:Int = 0
var flagData:String = ""
var countryCodeData: String = ""
class TableViewController: UITableViewController, UISearchBarDelegate {
    var Arrayfilt : [String]?
    @IBOutlet weak var searchCountry: UISearchBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        let jsonUrlString = "https://restcountries.eu/rest/v2/all"
        guard let url = URL(string: jsonUrlString)else{
            return
        }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                return
            }
            do{
                let countryList = try JSONDecoder().decode([AllThings].self, from: data)
                for i in 0..<countryList.count
                {
                    namest.insert(countryList[i].name , at:i)
                    
                    print(namest , i)
                    capitalst.insert(countryList[i].capital , at:i)
                    populationst.insert(countryList[i].population , at:i)
                    flagst.insert(countryList[i].flag , at:i)
                    countryCode.insert(countryList[i].alpha2Code!, at: i)
                }
                
                self.Arrayfilt = namest
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
//                print(flagst[50])
//                print(namest[50])
//                print(countryCode[50])
            }
            catch let jsonError{
                print("Error: jsonError",jsonError)
            }
            }.resume()
        self.Arrayfilt = namest
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String)
    {
        if searchBar.text!.isEmpty
        {
            self.Arrayfilt = namest
        }
        else
        {
            self.Arrayfilt = namest.filter({ $0.lowercased().contains(searchBar.text!.lowercased())})
        }
        self.tableView.reloadData()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.Arrayfilt!.count
    }
   override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mycell" , for: indexPath )
        if var value1 = self.Arrayfilt
        {
            cell.textLabel?.text = value1[indexPath.row]
        }
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath:IndexPath){
        myIndex =  indexPath.row
        print(myIndex)
        for i in 0..<namest.count
        {
            if(namest[i] == Arrayfilt![myIndex])
            {
                capData = capitalst[i]
                popuData = populationst[i]
                flagData = flagst[i]
                countryCodeData = countryCode[i]
            }
        }
        performSegue(withIdentifier: "segue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let sendData = segue.destination as! SecondViewController
        sendData.countryNameSecondST = Arrayfilt![myIndex]
        sendData.countryCapitalst = capData
        sendData.countryPopulationSecondView = popuData
        sendData.countryFlagSecondView = flagData
        sendData.countryCodeSecondView = countryCodeData
    }
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
/*
 struct RegionalBlocs: Decodable {
 let acronym: String?
 let name: String?
 let otherAcronyms:[String]?
 let otherNames:[String]?
 }
 struct Translations:Decodable{
 let de:String?
 let es:String?
 let fr:String?
 let ja:String?
 let it:String?
 let br:String?
 let pt:String?
 let nl:String?
 let hr:String?
 let fa:String?
 }
 struct Languages: Decodable  {
 let iso639_1:String?
 let iso639_2:String?
 let name:String?
 let nativeName:String?
 }
 struct Currencies: Decodable  {
 let code:String?
 let name:String?
 let symbol:String?
 }
 struct AllThings: Decodable  {
 let name:String
 //   let topLevelDomain: [String]?
 //    let alpha2Code:String?
 //    let alpha3Code:String?
 //    let callingCodes:[String]?
     let capital:String?
 //    let altSpellings:[String]?
 //    let region:String?
 //    let subregion:String?
     let population:Int?
 //    let latlng: [Int]?
 //    let demonym:String?
 //    let area:Int?
 //    let gini:Double?
 //    let timezones:[String]?
 //    let borders:[String]?
 //    let nativeName:String?
 //    let numericCode:String?
 //    let currencies:[Currencies]?
 //    let languages:[Languages]?
 //    let translations:[Translations]?
 let flag:String
 //    let regionalBlocs:[RegionalBlocs]?
 //    let cioc:String?
 }
 */
