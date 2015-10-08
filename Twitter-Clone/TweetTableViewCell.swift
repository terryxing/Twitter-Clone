//
//  TweetTableViewCell.swift
//  Twitter-Clone
//
//  Created by Tianyi Xing on 10/7/15.
//  Copyright © 2015 Tianyi Xing. All rights reserved.
//

import UIKit

class TweetTableViewCell: UITableViewCell {

    
    @IBOutlet weak var thumbImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var tweetcontentLabel: UILabel!
    @IBOutlet weak var hourLabel: UILabel!
    @IBOutlet weak var starImageView: UIImageView!
    
    var tweetInCell: Tweet! {
        didSet {
            
            thumbImageView.setImageWithURL(NSURL(string: (tweetInCell.user?.profileImageUrl)!)!)
            nameLabel.text = tweetInCell.user?.name
            idLabel.text = tweetInCell.user?.screenname
            tweetcontentLabel.text = tweetInCell.user?.tagline
            hourLabel.text = tweetInCell.createdAtString
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        thumbImageView.layer.cornerRadius = 3
        thumbImageView.clipsToBounds = true
        
        nameLabel.preferredMaxLayoutWidth = nameLabel.frame.size.width

    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        nameLabel.preferredMaxLayoutWidth = nameLabel.frame.size.width
        
    }


    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
