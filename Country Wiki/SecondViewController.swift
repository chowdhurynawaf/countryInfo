//
//  SecondViewController.swift
//  Country Wiki
//
//  Created by toumalmojumder on 6/12/18.
//  Copyright © 2018 toumalmojumder. All rights reserved.
//

import UIKit

//import Kingfisher
//
//let url = URL(string: "url_of_your_image")
//// this downloads the image asynchronously if it's not cached yet
//imageView.kf.setImage(with: url)
//https://stackoverflow.com/questions/24231680/loading-downloading-image-from-url-on-swift

class SecondViewController: UIViewController {

    @IBOutlet weak var CountrynameSecondView: UILabel!
    
    @IBOutlet weak var CountryCapital: UILabel!
    
    @IBOutlet weak var CountryPopulationSecondView: UILabel!
    
    @IBOutlet weak var FlagSesondView: UIImageView!
    
    
    var countryNameSecondST:String = "Something"
    var countryCapitalst:String = ""
    var countryPopulationSecondView:Int = 0
    var countryFlagSecondView:String = ""
    var countryCodeSecondView: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CountrynameSecondView.text = countryNameSecondST
        CountryCapital.text = countryCapitalst
        CountryPopulationSecondView.text   =  String(countryPopulationSecondView)
        
        let imageUrl = "https://www.countryflags.io/\(countryCodeSecondView)/shiny/64.png"
        
//        if let myurl = URL(string: countryFlagSecondView){
//            do{
//                let data = try Data(contentsOf: myurl)
//                FlagSesondView.image = UIImage(data: data)
//            }catch let err {
//                print("Image Not Found: \(err)")
//            }
//        }
//        print(countryCodeSecondView)
        if let url = URL(string: imageUrl){
            DispatchQueue.global().async {
                do{
                    let data = try? Data(contentsOf: url) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
                    DispatchQueue.main.async {
                        self.FlagSesondView.image = UIImage(data: data!)
                    }
                }catch let err {
                    print("Image Not Found: \(err)")
                }
                
            }
        }
        
        
 /* another way
        
//        guard let url = URL(string: imageUrl) else{
//            return
//        }
//        URLSession.shared.dataTask(with: url) { (data, response, error) in
//            if let e = error {
//                print("Error downloading cat picture: \(e)")
//            } else {
//                // No errors found.
//                // It would be weird if we didn't have a response, so check for that too.
//                if let res = response as? HTTPURLResponse {
//                    print("Downloaded picture with response code \(res.statusCode)")
//                    if let imageData = data {
//                        // Finally convert that Data into an image and do what you wish with it.
////                        let image = UIImage(data: imageData)
//
//                        DispatchQueue.main.async {
//                            print(imageData)
//                            self.FlagSesondView.image = UIImage(data: imageData)
//                        }
//                        // Do something with your image.
//                    } else {
//                        print("Couldn't get image: Image is nil")
//                    }
//                } else {
//                    print("Couldn't get response code for some reason")
//                }
//            }
//        }.resume()
        
        */
        
        
    }
    

}
