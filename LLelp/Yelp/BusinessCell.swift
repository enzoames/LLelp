//
//  BusinessCell.swift
//  Yelp
//
//  Created by Enzo Ames on 2/15/17.
//  Copyright © 2017 Timothy Lee. All rights reserved.
//

import UIKit

class BusinessCell: UITableViewCell
{

    @IBOutlet weak var thumbImageView: UIImageView!
    
    @IBOutlet weak var ratingImageView: UIImageView!
    
    @IBOutlet weak var RestaurantNameLabel: UILabel!
    
    @IBOutlet weak var distanceLabel: UILabel!
    
    @IBOutlet weak var reviewsCountLabel: UILabel!
    
    @IBOutlet weak var categorieslabel: UILabel!
    
    @IBOutlet weak var addressLabel: UILabel!
    

    
    var business: Business!
    {
        didSet
        {
            RestaurantNameLabel.text = business.name
            thumbImageView.setImageWith(business.imageURL!)
            categorieslabel.text = business.categories
            addressLabel.text = business.address
            reviewsCountLabel.text = "\(business.reviewCount!) Reviews "
            ratingImageView.setImageWith(business.ratingImageURL!)
            distanceLabel.text = business.distance
        }
    }
    
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        // Initialization code
        thumbImageView.layer.cornerRadius = 3
        thumbImageView.clipsToBounds = true
        
        RestaurantNameLabel.preferredMaxLayoutWidth = RestaurantNameLabel.frame.size.width
    }

    override func layoutSubviews()
    {
        RestaurantNameLabel.preferredMaxLayoutWidth = RestaurantNameLabel.frame.size.width
    }
    
    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
