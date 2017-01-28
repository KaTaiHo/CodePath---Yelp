//
//  BusinessCell.swift
//  Yelp
//
//  Created by Ka Tai Ho on 1/28/17.
//  Copyright © 2017 Timothy Lee. All rights reserved.
//

import UIKit

class BusinessCell: UITableViewCell {

    @IBOutlet weak var thumbView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var reviewView: UIImageView!
    @IBOutlet weak var reviewCountLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var categoriesLabel: UILabel!
    
    var business: Business! {
        didSet {
            nameLabel.text = business.name
            thumbView.setImageWith(business.imageURL!)
            categoriesLabel.text = business.categories
            addressLabel.text = business.address
            reviewCountLabel.text = "\(business.reviewCount!)Reviews"
            reviewView.setImageWith(business.ratingImageURL!)
            distanceLabel.text = business.distance
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        thumbView.layer.cornerRadius = 3
        thumbView.clipsToBounds = true
        
        nameLabel.preferredMaxLayoutWidth = nameLabel.frame.size.width
        // Initialization code
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        nameLabel.preferredMaxLayoutWidth = nameLabel.frame.size.width
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
