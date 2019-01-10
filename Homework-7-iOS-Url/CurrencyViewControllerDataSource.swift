//
//  CurrencyViewControllerDataSource.swift
//  Homework-7-iOS-Url
//
//  Created by Alla on 1/5/19.
//  Copyright © 2019 AndreiSavchenko. All rights reserved.
//

import UIKit

final class CurrencyViewControllerDataSource: NSObject { //????????????????? final

    // MARK: Private properties
    
    private var currencyTableView: UITableView
    private var currencyModels: [CurrencyModel] = []
    fileprivate let currencyTableViewCellIdentifier = "CurrencyCell" //???????????????? fileprivate
    
    // MARK: Init
    
    init(currencyTableView: UITableView) {
        self.currencyTableView = currencyTableView
        super.init()
        
        registerCells()
    }
    
    // MARK: Public methods
    
    func reload(with currencyModels: [CurrencyModel]) {
        self.currencyModels = currencyModels
        currencyTableView.reloadData()
    }
    
    // Private methods
    
    private func registerCells() {
        currencyTableView.register(.init(nibName: "CurrencyCell", bundle:nil), forCellReuseIdentifier: currencyTableViewCellIdentifier)
    }
    
    private func showErrorLabel(message: String) {
        let noDataLabel: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: currencyTableView.bounds.size.width, height: currencyTableView.bounds.size.height))
        noDataLabel.text = message
        noDataLabel.textColor = .black
        noDataLabel.textAlignment = .center
        currencyTableView.backgroundView = noDataLabel
        currencyTableView.separatorStyle = .none
    }
}

// MARK: UIDableViewDataSource

extension CurrencyViewControllerDataSource: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch currencyModels.count {
        case 0:
            showErrorLabel(message: "No Data")
            return 0
        default:
            return currencyModels.count == 1 && currencyModels.first is CurrencyNetworkError ? 0 : currencyModels.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currencyModel = currencyModels[indexPath.row]
        
        switch currencyModel.self {
        case is CurrencyNetworkError:
            showErrorLabel(message: (currencyModel as! CurrencyNetworkError).message)
        default:
            let cell = currencyTableView.dequeueReusableCell(withIdentifier: currencyTableViewCellIdentifier) as! CurrencyTableViewCell
            cell.setup(with: currencyModel as! CurrencyObject)
            return cell
        }
        return .init() // ?????????? init
    }
}

extension CurrencyViewControllerDataSource: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 35
    }
}
