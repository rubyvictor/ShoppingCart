//
//  ShoppingCart.swift
//  Shopping Cart
//
//  Created by Victor Lee on 22/09/16.


import Foundation

enum ShippingType: Double {
    case standard = 0.0
    case express = 15.00
}

class ShoppingCart
{
    var itemStore = ItemStore()
    var total: Double = 0
    var shippingType: ShippingType = .standard
    private var selectedItemsDict: [String : Int] = [:] // [uid - quantity]
    let taxPercentage: Double = 10.00
    
    func getTotal() -> Double {
        // calculate total before tax:
        var totalBeforeTax = 0.0
        for (uid, quantity) in selectedItemsDict {
            if let price = self.itemStore.getPriceFor(itemWith: uid) {
                totalBeforeTax += (price * Double(quantity))
            }
        }
        
        let calculator = Calculator(totalBeforeTax: totalBeforeTax, shippingCost: shippingType.rawValue, taxPercentage: taxPercentage)
        return calculator.getTotalAmount()
    }

    func add(item: Item) {
        if var quantity = selectedItemsDict[item.uid] {
            quantity += 1
            selectedItemsDict[item.uid] = quantity
        } else {
            // the item doesn't exist yet
            selectedItemsDict[item.uid] = 1
        }
    }
    
    func remove(item: Item) {
        if var quantity = selectedItemsDict[item.uid] {
            quantity -= 1
            selectedItemsDict[item.uid] = quantity
        }
    }
    
    func reset() {
        self.total = 0
        self.shippingType = .standard
        self.selectedItemsDict = [:]
    }
}



