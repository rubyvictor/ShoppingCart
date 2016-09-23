//
//  Calculator.swift
//  Shopping Cart
//
//  Created by Victor Lee on 22/09/16.

import Foundation

class Calculator {
    var totalBeforeTax: Double
    var shippingCost: Double
    var total: Double
    private var taxPercentage: Double
    
    init(totalBeforeTax: Double, shippingCost: Double, taxPercentage: Double) {
        self.totalBeforeTax = totalBeforeTax
        self.shippingCost = shippingCost
        self.taxPercentage = taxPercentage
        self.total = 0.0
    }
    
    func getTotalAmount() -> Double {
        let tax = totalBeforeTax * taxPercentage / 100.00
        self.total = totalBeforeTax + tax + shippingCost
        
        return self.total
    }
}




