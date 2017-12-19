//
//  ProductView.swift
//  SportStore
//
//  Created by Dagmawi Nadew-Assefa on 12/7/17.
//  Copyright © 2017 2Plus2. All rights reserved.
//

import UIKit

class ProductView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let tableView: UITableView = {
       
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()
    
    let totalProductLabel: UILabel = {
       
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Out of Stock."
        label.textAlignment = .center
        label.backgroundColor = UIColor(white: 0.75, alpha: 0.5)
        
        return label
    }()
    
    func setupView() {
        backgroundColor = .white
        addSubview(totalProductLabel)
        totalProductLabel.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor).isActive = true
        totalProductLabel.heightAnchor.constraint(equalToConstant: 45).isActive = true
        totalProductLabel.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        
        addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: totalProductLabel.topAnchor).isActive = true
        
    }

}
