//
//  CurrencyNetworkError.swift
//  Homework-7-iOS-Url
//
//  Created by Alla on 1/5/19.
//  Copyright © 2019 AndreiSavchenko. All rights reserved.
//

import Foundation

struct CurrencyNetworkError: Decodable, CurrencyModel {
    let message: String
    
    init(message: String) {
        self.message = message
    }
}
