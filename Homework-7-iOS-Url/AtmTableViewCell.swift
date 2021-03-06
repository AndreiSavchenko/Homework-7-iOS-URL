//
//  AtmTableViewCell.swift
//  Homework-7-iOS-Url
//
//  Created by Alla on 1/5/19.
//  Copyright © 2019 AndreiSavchenko. All rights reserved.
//

import UIKit

class AtmTableViewCell: UITableViewCell {
    
    @IBOutlet weak var addressTextView: UITextView!
    
    func setup(with AtmObject: AtmObject) {
        addressTextView.text = AtmObject.fullAddressUa
        addressTextView.layer.cornerRadius = 8
    }
}
