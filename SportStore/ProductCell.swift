//
//  ProductCell.swift
//  SportStore
//
//  Created by Dagmawi Nadew-Assefa on 12/7/17.
//  Copyright © 2017 2Plus2. All rights reserved.
//

import UIKit

class ProductCell: UITableViewCell {
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var product: Product?
    
    let productTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "No Product"
        label.font = .boldSystemFont(ofSize: 13)
        
        return label
    }()
    
    let productDescription: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "No Product"
        label.font = .systemFont(ofSize: 12)
        return label
    }()
    
    let stepper: UIStepper = {
        
        let stepper = UIStepper()
        stepper.translatesAutoresizingMaskIntoConstraints = false
        
        return stepper
    }()
    
    let currentProductStockTF: UITextField = {
       
        let textField = UITextField()
        textField.text = "0"
        textField.textAlignment = .right
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.keyboardType = .numberPad
        
        return textField
    }()
    
    
    func setupView() {
        
        addSubview(currentProductStockTF)
        currentProductStockTF.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        currentProductStockTF.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -18).isActive = true
        currentProductStockTF.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
        addSubview(stepper)
        stepper.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        stepper.rightAnchor.constraint(equalTo: currentProductStockTF.leftAnchor, constant: -18).isActive = true
        
        addSubview(productTitle)
        productTitle.bottomAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        productTitle.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 7).isActive = true
        productTitle.rightAnchor.constraint(equalTo: stepper.leftAnchor, constant: -7).isActive = true
        
        addSubview(productDescription)
        productDescription.topAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        productDescription.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 7).isActive = true
        productDescription.rightAnchor.constraint(equalTo: stepper.leftAnchor, constant: -7).isActive = true
        
    }

}
