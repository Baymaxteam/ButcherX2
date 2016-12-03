////
////  CartOrderLlist.swift
////  shopping app
////
////  Created by Ming hongHseih on 12/3/16.
////  Copyright © 2016 Nina. All rights reserved.
////
//
//
import Foundation
import Firebase

struct CartOrderList {
    
    let key: String
    let orderByUser: String
    let orderByTime: String
    let orderByPrice: Int
    var orderByItemAndNumber: [String: Int] = [:]
    let ref: FIRDatabaseReference?
//    var completed: Bool
    
    init(orderByUser: String, orderByTime: String, orderByPrice: Int, orderByItemAndNumber: [String: Int], key: String = "") {
        self.key = key
        self.orderByUser = orderByUser
        self.orderByTime = orderByTime
        self.orderByPrice = orderByPrice
        self.orderByItemAndNumber = orderByItemAndNumber
        self.ref = nil
    }
    
    init(snapshot: FIRDataSnapshot) {
        key = snapshot.key
        let snapshotValue = snapshot.value as! [String: AnyObject]
        
        orderByUser = snapshotValue["orderByUser"] as! String
        orderByTime = snapshotValue["orderByTime"] as! String
        orderByPrice = snapshotValue["orderByPrice"] as! Int
        orderByItemAndNumber = snapshotValue["orderByItemAndNumber"] as! [String: Int]
        ref = snapshot.ref
    }
    
    func toAnyObject() -> Any {
        return [
            "orderByUser": orderByUser,
            "orderByTime": orderByTime,
            "orderByPrice": orderByPrice,
            "orderByItemAndNumber": orderByItemAndNumber
        ]
    }
}

