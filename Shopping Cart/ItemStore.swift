//
//  Item.swift
//  Shopping Cart
//
//  Created by Victor Lee on 22/09/16.


import UIKit

struct Item {
    var uid: String
    var title: String
    var price: Double
    var image: UIImage
}

class ItemStore {
    var items: [Item] = [
        Item(uid: "Red", title: "Red", price: 299, image: #imageLiteral(resourceName: "red")),
        Item(uid: "Blue", title: "Blue", price: 269, image: #imageLiteral(resourceName: "blue")),
        Item(uid: "Experimental", title: "Experimental", price: 399, image: #imageLiteral(resourceName: "experimental"))
    ]
    
    func getPriceFor(itemWith uid: String) -> Double? {
        for item in self.items {
            if item.uid == uid {
                return item.price
            }
        }
        
        return nil
    }
}











