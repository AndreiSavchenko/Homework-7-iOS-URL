//
//  AtmNetwork.swift
//  Homework-7-iOS-Url
//
//  Created by Alla on 1/10/19.
//  Copyright © 2019 AndreiSavchenko. All rights reserved.
//

import Foundation

final class AtmNetwork {
    
    // MARK: Private properties
    
    private let defaultSession = URLSession(configuration: .default)
    private var dataTask: URLSessionDataTask?
    
    // MARK: Constants
    private let urlString = "https://api.privatbank.ua/p24api/infrastructure"
    
    // MARK: Public properties
    
    //MARK: Singeltone
    
    static let shared = AtmNetwork()
    
    // MARK: Public methods
    
    func retrieveAtm(city: String, completion: @escaping (([AtmModel]) -> ())) {
        
        dataTask?.cancel()
        
        guard var urlComponents = URLComponents(string: urlString) else {
            fatalError("Incorrect url string")
        }
        urlComponents.queryItems = [.init(name: "json", value: nil),
                                    .init(name: "atm", value: nil),
                                    .init(name: "address", value: ""),
                                    .init(name: "city", value: city)]
        
        dataTask = defaultSession.dataTask(with: urlComponents.url!) { data, response, error in
            var models: [AtmModel] = []
            
            defer { DispatchQueue.main.async { completion(models) } }
            defer { self.dataTask = nil }
            
            guard error == nil && (response as? HTTPURLResponse)?.statusCode == 200 else {
                let errorData = AtmNetworkError(message: error?.localizedDescription ?? "Error occured while fetching data")
                models.append(errorData)
                return
            }
            models.append(contentsOf: AtmObject.objects(data: data))
        }
        dataTask?.resume()
    }
}
