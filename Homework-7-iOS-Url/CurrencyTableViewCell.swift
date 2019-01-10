//
//  CurrencyTableViewCell.swift
//  Homework-7-iOS-Url
//
//  Created by Alla on 1/5/19.
//  Copyright © 2019 AndreiSavchenko. All rights reserved.
//

import UIKit

class CurrencyTableViewCell: UITableViewCell {
    
    @IBOutlet weak var ccyTextField: UITextField!
    @IBOutlet weak var baceCcyTextField: UITextField!
    @IBOutlet weak var buyTextField: UITextField!
    @IBOutlet weak var saleTextField: UITextField!
    
    func setup(with CurrencyObject: CurrencyObject) {
        ccyTextField.text = CurrencyObject.ccy
        baceCcyTextField.text = CurrencyObject.baseCcy
        buyTextField.text = CurrencyObject.buy
        saleTextField.text = CurrencyObject.sale
    }
}
