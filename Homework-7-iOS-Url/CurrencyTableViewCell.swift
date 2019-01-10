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
    //    @IBOutlet private weak var mediaDescription: UILabel!
//    @IBOutlet private weak var mediaTitle: UILabel!
//    @IBOutlet private weak var mediaImageView: UIImageView!
//
//    func setup(with media: MediaObject) {
//        setImage(url: media.artworkUrl100 ?? "")
//        mediaTitle.text = media.artistName
//        mediaDescription.text = media.trackName
//    }
//
//    private func setImage(url: String) {
//        do {
//            let url = URL(string: url)
//            let data = try Data(contentsOf: url ?? .init(fileURLWithPath: ""))
//            self.mediaImageView.image = UIImage(data: data)
//        }
//        catch{
//            print(error)
//        }
//    }
}
