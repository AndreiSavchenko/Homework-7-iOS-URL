//
//  AtmObject.swift
//  Homework-7-iOS-Url
//
//  Created by Alla on 1/10/19.
//  Copyright © 2019 AndreiSavchenko. All rights reserved.
//

import Foundation

struct Atm: Decodable, AtmModel {
    let devices: [AtmObject]
}

struct AtmObject: AtmModel {
    let cityRU: String?
    let cityUA: String?
    let cityEN: String?
    let fullAddressRu: String?
    let fullAddressUa: String?
    let fullAddressEn: String?
    
    enum AtmKeys: String, CodingKey {
        case cityRU
        case cityUA
        case cityEN
        case fullAddressRu
        case fullAddressUa
        case fullAddressEn
    }
    
    static func objects(data: Data?) -> [AtmModel] {
        guard let data = data else {
            return []
        }
        
        do {
            let object = try JSONDecoder().decode(Atm.self, from: data)
            return object.devices
        } catch {
            print("Decode failed")
            return []
        }
    }
}

extension AtmObject: Decodable {
    init(from decoder: Decoder) throws {
        let atm = try decoder.container(keyedBy: AtmKeys.self)
        
        cityRU = try atm.decode(String.self, forKey: .cityRU)
        cityUA = try atm.decode(String.self, forKey: .cityUA)
        cityEN = try atm.decode(String.self, forKey: .cityEN)
        fullAddressRu = try atm.decode(String.self, forKey: .fullAddressRu)
        fullAddressUa = try atm.decode(String.self, forKey: .fullAddressUa)
        fullAddressEn = try atm.decode(String.self, forKey: .fullAddressEn)
    }
}

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
