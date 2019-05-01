//
//  ViewController.swift
//  AP-PLUS
//
//  Created by  nf on 15/03/2019.
//

import UIKit
import Alamofire
import ObjectMapper

class Home: UIViewController, UITableViewDelegate ,UITableViewDataSource {
  
   
    
    var apps : [AppsObject]?
    
    @IBOutlet weak var AppsTableView: UITableView!
    
    override func viewDidLoad()
    {
        self.apps = [AppsObject]()
        
        super.viewDidLoad()
        getapps()
    }


    
    func getapps()
    {

        AF.request(MyUrl,
                          method: .get)
            .responseJSON { (respone) in
               
                
                switch respone.result
                {
                case .success:
                    print(respone)
                    let json : NSDictionary = respone.value as! NSDictionary
                    print(json)
                    self.apps =  (Mapper<AppsObject>().mapArray(JSONObject: (json)["Apps"]))!
                    self.AppsTableView.reloadData()
                case .failure:
                    print("there is error : \(respone.error)")
                    
                }
                
                
        }
    }
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return apps!.count
        }
        
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell : AppsCell = AppsTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! AppsCell
            
            cell.appname.text = apps![indexPath.row].app_name
            cell.SetImage(url: apps![indexPath.row].image!)
            return cell
        }
        
    
    @IBAction func downloadbutton(_ sender: Any)
    {
        let cellPosition = (sender as AnyObject).convert(CGPoint.zero, to: AppsTableView)
        let indPath : IndexPath = AppsTableView.indexPathForRow(at: cellPosition)!
        
        UIApplication.shared.open(URL(string: apps![indPath.row].url!)!, options: [:], completionHandler: nil)
        
    }
    
}



