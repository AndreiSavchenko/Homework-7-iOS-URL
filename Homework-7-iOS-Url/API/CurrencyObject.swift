//
//  CurrencyObject.swift
//  Homework-7-iOS-Url
//
//  Created by Alla on 1/6/19.
//  Copyright © 2019 AndreiSavchenko. All rights reserved.
//

import Foundation

struct CurrencyObject: Decodable, CurrencyModel {
    let ccy: String?
    let baseCcy: String?
    let buy: String?
    let sale: String?
    
    enum CurrencyKeys: String, CodingKey {
        case ccy
        case baseCcy = "base_ccy"
        case buy
        case sale
    }
    
    static func objects(data: Data?) -> [CurrencyModel] {
        guard let data = data else {
            return []
        }
        
        do {
            let object = try JSONDecoder().decode([CurrencyObject].self, from: data)
            return object
        } catch {
            print("Decode failed  \(error)")
            return []
        }
    }
    
    init(from decoder: Decoder) throws {
        let currency = try decoder.container(keyedBy: CurrencyKeys.self)
        
        ccy = try currency.decode(String.self, forKey: .ccy)
        baseCcy = try currency.decode(String.self, forKey: .baseCcy)
        buy = try currency.decode(String.self, forKey: .buy)
        sale = try currency.decode(String.self, forKey: .sale)
    }
}

//extension CurrencyObject: {
//    init(from decoder: Decoder) throws {
//        let currency = try decoder.container(keyedBy: CurrencyKeys.self)
//
//        ccy = try currency.decode(String.self, forKey: .ccy)
//        baseCcy = try currency.decode(String.self, forKey: .baseCcy)
//        buy = try currency.decode(String.self, forKey: .buy)
//        sale = try currency.decode(String.self, forKey: .sale)
//    }
//}

//struct Media: Decodable, Model {
//    let results: [MediaObject]
//}
//
//struct MediaObject: Model {
//    let type: String?
//    let artistName: String?
//    let trackName: String?
//    let artworkUrl100: String?
//
//    enum MediaKeys: String, CodingKey {
//        case type = "kind"
//        case artistName
//        case trackName
//        case artworkUrl100
//    }
//
//    static func objects(data: Data?) -> [Model] {
//        guard let data = data else {
//            return []
//        }
//
//        do {
//            let object = try JSONDecoder().decode(Media.self, from: data)
//            return object.results
//        } catch {
//            print("Decode failed")
//            return []
//        }
//    }
//}
//
//extension MediaObject: Decodable {
//    init(from decoder: Decoder) throws {
//        let media = try decoder.container(keyedBy: MediaKeys.self)
//
//        type = try media.decode(String.self, forKey: .type)
//        artistName = try media.decode(String.self, forKey: .artistName)
//        trackName = try media.decode(String.self, forKey: .trackName)
//        artworkUrl100 = try media.decode(String.self, forKey: .artworkUrl100)
//    }
//}
