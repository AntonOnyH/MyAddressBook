//
//  CustomCell.swift
//  My Address Book
//
//  Created by Anton Huisamen on 2018/06/14.
//  Copyright © 2018 antonsolo. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
    
    let nameLabel = UILabel()
    let numberLabel = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup(){
        contentView.addSubview(nameLabel)
        contentView.addSubview(numberLabel)
        specificationsNameLabel()
        specificationsNumberLabel()
        backgroundColor = UIColor.clear
        
    }
    
    func specificationsNameLabel(){
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0).isActive = true
        nameLabel.textColor = UIColor.white
    }
    
    func specificationsNumberLabel(){
        numberLabel.translatesAutoresizingMaskIntoConstraints = false
        numberLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        numberLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0).isActive = true
        numberLabel.textColor = UIColor.white
        
    }
    
}

