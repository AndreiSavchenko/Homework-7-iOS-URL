//
//  ViewController.swift
//  Homework-7-iOS-Url
//
//  Created by Alla on 1/2/19.
//  Copyright © 2019 AndreiSavchenko. All rights reserved.
//

import UIKit

class CurrencyViewController: UIViewController {

    // MARK: IBOutlets
    
    @IBOutlet private weak var currencyTableView: UITableView!
    
    @IBAction func refreshButton(_ sender: UIButton) {
        fetchData()
        print("Refresh")
    }
    
    // MARK: Delegate
    
    private lazy var currencyDataSource = CurrencyViewControllerDataSource(currencyTableView: self.currencyTableView)
    
    // MARK: View Controller life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currencyTableView.dataSource = currencyDataSource
        currencyTableView.delegate = currencyDataSource
        
        fetchData()
    }

    private func fetchData() {
        CurrencyNetwork.shared.retrieveCurrency { [weak self] in
            self?.currencyDataSource.reload(with: $0)
        }
    }
}

