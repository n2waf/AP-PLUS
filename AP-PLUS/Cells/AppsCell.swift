//
//  AppsCell.swift
//  AP-PLUS
//
//  Created by  nf on 01/05/2019.
//

import UIKit
import SDWebImage

class AppsCell: UITableViewCell {

    
    @IBOutlet weak var appimage: UIImageView!
    @IBOutlet weak var appname: UILabel!
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func SetImage(url:String){
        
        DispatchQueue.global().sync
            {
                do{
                    
                    
                    DispatchQueue.global().sync {
                        
                        appimage.sd_setImage(with: URL(string: url), placeholderImage: UIImage(named: "placeholder.png"))
                        
                        
                    }
                    
                }
                catch {
                    print("cannot load from server")
                }
                
                
                
                
                
        }
        
        
    }

}
