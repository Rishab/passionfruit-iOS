//
//  FeedCell.swift
//  passionfruit
//
//  Created by Rishab Chawla on 4/5/19.
//  Copyright © 2019 Rishab Chawla. All rights reserved.
//

import UIKit

class FeedCell: UITableViewCell {

    @IBOutlet var card: UIView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var ageLabel: UILabel!
    
    @IBOutlet var profilePicture: UIImageView!
    
    
    func setupCell(user: User) {
        card.layer.cornerRadius = 15.0
        card.layer.masksToBounds = true
        profilePicture.image =  UIImage(named: "DSC_0406")
        profilePicture.layer.cornerRadius = profilePicture.frame.height / 2.0
        profilePicture.clipsToBounds = true
        nameLabel.text = user.name
        ageLabel.text = "\(user.profileInfo.age)"
    }

}
