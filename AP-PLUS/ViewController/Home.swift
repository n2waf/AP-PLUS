//
//  ViewController.swift
//  AP-PLUS
//
//  Created by  nf on 15/03/2019.
//

import UIKit
import Alamofire
import ObjectMapper

class Home: UIViewController {
    
    var apps : [AppsObject]?
    
    
    override func viewDidLoad()
    {
        self.apps = [AppsObject]()
        
        super.viewDidLoad()
        getapps()
    }


    
    func getapps()
    {
       
        Alamofire.request(URL(string: MyUrl)!,
                          method: .get)
            .responseJSON { (respone) in
               
                
                if respone.result.isSuccess
                {
                    print(respone)
                    let json : NSDictionary = respone.value as! NSDictionary
                    print(json)
                    self.apps =  (Mapper<AppsObject>().mapArray(JSONObject: (json)["Apps"]))!
                    print(self.apps![2].app_name)
                }
                else
                {
                    print(respone.error)
                }
                
        }
        
    }
    
}

