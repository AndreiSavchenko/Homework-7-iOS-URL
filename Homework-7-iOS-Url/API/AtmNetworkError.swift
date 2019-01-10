//
//  AtmNetworkError.swift
//  Homework-7-iOS-Url
//
//  Created by Alla on 1/10/19.
//  Copyright © 2019 AndreiSavchenko. All rights reserved.
//

import Foundation

struct AtmNetworkError: Decodable, AtmModel {
    let message: String
    
    init(message: String) {
        self.message = message
    }
}
