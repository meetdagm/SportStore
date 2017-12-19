//
//  Product.swift
//  SportStore
//
//  Created by Dagmawi Nadew-Assefa on 12/8/17.
//  Copyright © 2017 2Plus2. All rights reserved.
//

import Foundation

class Utils {
    
    class func currencyStringFromNumber(number:Double) -> String {
        let formatter = NumberFormatter();
        formatter.numberStyle = .currency
        return formatter.string(from: NSNumber(value: number)) ?? ""
    }
    
}
