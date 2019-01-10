//
//  AtmViewController.swift
//  Homework-7-iOS-Url
//
//  Created by Alla on 1/2/19.
//  Copyright © 2019 AndreiSavchenko. All rights reserved.
//

import UIKit

class AtmViewController: UIViewController {

    @IBOutlet private weak var atmTableView: UITableView!
    var cityName: String = ""
    @IBOutlet weak var citySearchTextField: UITextField!
    @IBAction func searchButton(_ sender: UIButton) {
        cityName = citySearchTextField.text ?? ""
        print("cityName = \(cityName)")
        fetchData()
    }

    
    private lazy var atmDataSource = AtmViewControllerDataSource(atmTableView: self.atmTableView)

    
    override func viewDidLoad() {
        super.viewDidLoad()

        atmTableView.dataSource = atmDataSource
//        atmTableView.delegate = atmDataSource
        
//        fetchData()
    }

    private func fetchData() {
        AtmNetwork.shared.retrieveAtm(city: cityName) { [weak self] in
            self?.atmDataSource.reload(with: $0)
        }
    }
}
