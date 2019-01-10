//
//  CurrencyNetwork.swift
//  Homework-7-iOS-Url
//
//  Created by Alla on 1/9/19.
//  Copyright © 2019 AndreiSavchenko. All rights reserved.
//

import Foundation

//enum CurrencyType: String {
//    case exchange
//    case json
//    case coursid
//}

final class CurrencyNetwork {
    
    // MARK: Private properties
    
    private let defaultSession = URLSession(configuration: .default)
    private var dataTask: URLSessionDataTask?
    
    // MARK: Constants
    private let urlString = "https://api.privatbank.ua/p24api/pubinfo"
    
    // MARK: Public properties
    
    //MARK: Singeltone
    
    static let shared = CurrencyNetwork()
    
    // MARK: Public methods
    
//    func retrieveCurrency(type: CurrencyType, term: String,
//                              completion: @escaping (([CurrencyModel]) -> ())) {
    func retrieveCurrency(completion: @escaping (([CurrencyModel]) -> ())) {

        dataTask?.cancel()
        
        guard var urlComponents = URLComponents(string: urlString) else {
            fatalError("Incorrect url string")
        }
        urlComponents.queryItems = [.init(name: "exchange", value: nil),
                                    .init(name: "json", value: nil),
                                    .init(name: "coursid", value: "11")]
        
        //print("urlComponents.queryItems = \(urlComponents.url)")
        
        dataTask = defaultSession.dataTask(with: urlComponents.url!) { data, response, error in
            var models: [CurrencyModel] = []
            
            defer { DispatchQueue.main.async { completion(models) } }
            defer { self.dataTask = nil }
            
            guard error == nil && (response as? HTTPURLResponse)?.statusCode == 200 else {
                let errorData = CurrencyNetworkError(message: error?.localizedDescription ?? "Error occured while fetching data")
                models.append(errorData)
                return
            }
            print("111")
            print(CurrencyObject.objects(data: data))
            models.append(contentsOf: CurrencyObject.objects(data: data))
        }
        
        dataTask?.resume()
    }
    
}

//class Getdata {
//
//    static let shared = Getdata()
//
//    func getData(completion: @escaping (([Ccy]) -> ())) {
//        guard let url = URL(string: "https://api.privatbank.ua/p24api/pubinfo?exchange&json&coursid=11") else { return }
//        let session = URLSession(configuration: .default)
//        let task = session.dataTask(with: url) {(data, _, _) in
//            guard let data = data else { return }
//            do {
//                let ccy = try JSONDecoder().decode([Ccy].self, from: data)
//                completion(ccy)
//            } catch {}
//        }
//        task.resume()
//    }
//}


//enum MediaType: String {
//    case music
//    case movies
//    case audiobooks
//}
//
//final class ItunesSearchNetwork {
//
//    // MARK: Private properties
//
//    private let defaultSession = URLSession(configuration: .default)
//    private var dataTask: URLSessionDataTask?
//
//    // MARK: Constants
//    private let urlString = "https://itunes.apple.com/search"
//
//    // MARK: Public properties
//
//    //MARK: Singeltone
//
//    static let shared = ItunesSearchNetwork()
//
//    // MARK: Public methods
//
//    func retrieveAudioContent(type: MediaType, term: String,
//                              completion: @escaping (([Model]) -> ())) {
//        dataTask?.cancel()
//
//        guard var urlComponents = URLComponents(string: urlString) else {
//            fatalError("Incorrect url string")
//        }
//        urlComponents.queryItems = [.init(name: "media", value: type.rawValue),
//                                    .init(name: "term", value: term),
//                                    .init(name: "limit", value: "10")]
//
//        dataTask = defaultSession.dataTask(with: urlComponents.url!) { data, response, error in
//            var models: [Model] = []
//
//            defer { DispatchQueue.main.async { completion(models) } }
//            defer { self.dataTask = nil }
//
//            guard error == nil && (response as? HTTPURLResponse)?.statusCode == 200 else {
//                let errorData = NetworkError(message: error?.localizedDescription ?? "Error occured while fetching data")
//                models.append(errorData)
//                return
//            }
//
//            models.append(contentsOf: MediaObject.objects(data: data))
//        }
//
//        dataTask?.resume()
//    }
//
//}

