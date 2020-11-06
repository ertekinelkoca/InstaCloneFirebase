//
//  FeedCell.swift
//  InstaCloneFirebase
//
//  Created by mac on 6.11.2020.
//

import UIKit

class FeedCell: UITableViewCell {

    
    @IBOutlet weak var userMailLabel: UILabel!
    
    @IBOutlet weak var userImageView: UIImageView!
    
    
    @IBOutlet weak var commentLabel: UILabel!
    
    @IBOutlet weak var likeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    

    @IBAction func likeButtonClicked(_ sender: Any) {
    }
}
