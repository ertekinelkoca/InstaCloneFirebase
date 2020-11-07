//
//  FeedCell.swift
//  InstaCloneFirebase
//
//  Created by mac on 6.11.2020.
//

import UIKit
import Firebase

class FeedCell: UITableViewCell {

    
    @IBOutlet weak var userMailLabel: UILabel!
    
    @IBOutlet weak var userImageView: UIImageView!
    
    @IBOutlet weak var commentLabel: UILabel!
    
    @IBOutlet weak var likeLabel: UILabel!
    
    @IBOutlet weak var documentIDLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        documentIDLabel.isHidden = true
        // Configure the view for the selected state
    }
    
    

    @IBAction func likeButtonClicked(_ sender: Any) {
        
        let fireStoreDatabse = Firestore.firestore()
        
        if let likeCount =  Int(likeLabel.text!){
        
            let likeStore = ["likes" : likeCount + 1] as [String : Any]
            
            fireStoreDatabse.collection("Posts").document(documentIDLabel.text!).setData(likeStore, merge: true)
          
            
        }
        
        
        
        
        
    }
}
