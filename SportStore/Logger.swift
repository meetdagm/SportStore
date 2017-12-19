//
//  Logger.swift
//  SportStore
//
//  Created by Dagmawi Nadew-Assefa on 12/19/17.
//  Copyright © 2017 2Plus2. All rights reserved.
//

import Foundation

class Logger<T> where T:NSObject, T:NSCopying{
    
    var dataItems: [T] = []
    var callback:(T) -> Void
    
    init(callback: @escaping (T) -> Void) {
        self.callback = callback
    }
    
    func logItem(item: T) {
        dataItems.append(item.copy() as! T)
        callback(item)
    }
    
    func processItem(callback: (T) -> Void) {
        for item in dataItems {
            callback(item)
        }
    }
    
}
