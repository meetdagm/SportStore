//
//  ViewController.swift
//  SportStore
//
//  Created by Dagmawi Nadew-Assefa on 12/7/17.
//  Copyright © 2017 2Plus2. All rights reserved.
//

import UIKit


var handler = { (p: Product) in
    print("Changes: \(p.name) \(p.stockLevel) items in stock")
}
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //let logger = Logger<Product>(callback: handler)
    let logger = Logger<Product> { (product) in
        
        print("Changes: \(product.name) \(product.stockLevel) items in stock")
    }
    var products = [
        Product(name:"Kayak", description:"A boat for one person",
                category:"Watersports", price:275.0, stockLevel:10),
        Product(name:"Lifejacket", description:"Protective and fashionable",
                category:"Watersports", price:48.95, stockLevel:14),
        Product(name:"Soccer Ball", description:"FIFA-approved size and weight",
                category:"Soccer", price:19.5, stockLevel:32),
        Product(name:"Corner Flags",
                description:"Give your playing field a professional touch",
                category:"Soccer", price:34.95, stockLevel:1),
        Product(name:"Stadium", description:"Flat-packed 35,000-seat stadium",
                category:"Soccer", price:79500.0, stockLevel:4),
        Product(name:"Thinking Cap",
                description:"Improve your brain efficiency by 75%",
                category:"Chess", price:16.0, stockLevel:8),
        Product(name:"Unsteady Chair",
                description:"Secretly give your opponent a disadvantage",
                category: "Chess", price: 29.95, stockLevel:3),
        Product(name:"Human Chess Board",
                description:"A fun game for the family", category:"Chess",
                price:75.0, stockLevel:2),
        Product(name:"Bling-Bling King",
                description:"Gold-plated, diamond-studded King",
                category:"Chess", price:1200.0, stockLevel:4)];
    
    let productView = ProductView()
    let cellID = "cellID"
    let cell = ProductCell()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCell()
        displayStockTotal()
        setupDelegate()
        setupTarget()
    }
    
    func setupCell() {
        
        productView.tableView.register(ProductCell.self, forCellReuseIdentifier: cellID)
        
    }
    
    func setupTarget() {
        
        
    }
    
    @objc func stockLevelDidChange(sender: AnyObject) {
        if var currentCell = sender as? UIView {
            while (true) {
                currentCell = currentCell.superview!;
                if let cell = currentCell as? ProductCell {
                    if let product = cell.product {
                        if let stepper = sender as? UIStepper {
                            product.stockLevel = Int(stepper.value);
                        } else if let textfield = sender as? UITextField {
                            if let newValue = Int(textfield.text!) {
                                product.stockLevel = newValue;
                            } }
                        cell.stepper.value = Double(product.stockLevel);
                        cell.currentProductStockTF.text = String(product.stockLevel);
                        logger.logItem(item: product)
                       logger.processItem(callback: handler)
                    }
                    break;
                }
            }
            displayStockTotal();
        }
    }
    
    override func loadView() {
        self.view = productView
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let product = products[indexPath.row]
        let cell = (productView.tableView.dequeueReusableCell(withIdentifier: cellID) as? ProductCell)!
        cell.productTitle.text = product.name
        cell.productDescription.text = product.description
        cell.stepper.value = Double(product.stockLevel)
        cell.currentProductStockTF.text = String(product.stockLevel)
        cell.product = products[indexPath.row]
        cell.stepper.addTarget(self, action: #selector(stockLevelDidChange), for: .valueChanged)
        cell.currentProductStockTF.addTarget(self, action: #selector(stockLevelDidChange), for: .editingChanged)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return products.count
    }
    
    func displayStockTotal() {
        let finalTotals:(Int, Double) = products.reduce((0, 0.0),{(totals, product) -> (Int, Double) in
            return (totals.0 + product.stockLevel, totals.1 + product.stockValue)
        });
        productView.totalProductLabel.text = "\(finalTotals.0) Products in Stock. "
            + "Total Value: \(Utils.currencyStringFromNumber(number: finalTotals.1))";
    }
    
    func setupDelegate() {
        
        productView.tableView.delegate = self
        productView.tableView.dataSource = self
        
    }
}

