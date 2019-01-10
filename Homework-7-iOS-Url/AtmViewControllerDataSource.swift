//
//  AtmViewControllerDataSource.swift
//  Homework-7-iOS-Url
//
//  Created by Alla on 1/10/19.
//  Copyright © 2019 AndreiSavchenko. All rights reserved.
//

import UIKit

final class AtmViewControllerDataSource: NSObject {

    // MARK: Private properties
    
    private var atmTableView: UITableView
    private var atmModels: [AtmModel] = []
    fileprivate let atmTableViewCellIdentifier = "AtmCell" //???????????????? fileprivate
    
    // MARK: Init
    
    init(atmTableView: UITableView) {
        self.atmTableView = atmTableView
        super.init()
        
        registerCells()
    }
    
    // MARK: Public methods
    
    func reload(with atmModels: [AtmModel]) {
        self.atmModels = atmModels
        atmTableView.reloadData()
    }
    
    // Private methods
    
    private func registerCells() {
        atmTableView.register(.init(nibName: "AtmTableViewCell", bundle:nil), forCellReuseIdentifier: atmTableViewCellIdentifier)
    }
    
    private func showErrorLabel(message: String) {
        let noDataLabel: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: atmTableView.bounds.size.width, height: atmTableView.bounds.size.height))
        noDataLabel.text = message
        noDataLabel.textColor = .black
        noDataLabel.textAlignment = .center
        atmTableView.backgroundView = noDataLabel
        atmTableView.separatorStyle = .none
    }
}

// MARK: UIDableViewDataSource

extension AtmViewControllerDataSource: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch atmModels.count {
        case 0:
            atmTableView.backgroundColor = UIColor.blue
            showErrorLabel(message: "") //systemBlueColor
            return 0
        default:
            return atmModels.count == 1 && atmModels.first is AtmNetworkError ? 0 : atmModels.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let atmModel = atmModels[indexPath.row]
        
        switch atmModel.self {
        case is AtmNetworkError:
            showErrorLabel(message: (atmModel as! AtmNetworkError).message)
        default:
            let cell = atmTableView.dequeueReusableCell(withIdentifier: atmTableViewCellIdentifier) as! AtmTableViewCell
            cell.setup(with: atmModel as! AtmObject)
            return cell
        }
        return .init() // ?????????? init
    }
}

//extension AtmViewControllerDataSource: UITableViewDelegate {
//    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 50
//    }
//}

