//
//  CartViewController.swift
//  Shopping Cart
//
//  Created by Victor Lee on 22/09/16.

import UIKit

class CartViewController: UIViewController
{
    // MARK: - IBOutlets
    @IBOutlet weak var item1ImageView: UIImageView!
    @IBOutlet weak var item1TitleLabel: UILabel!
    @IBOutlet weak var item1PriceLabel: UILabel!
    @IBOutlet weak var item1QuantityLabel: UILabel!
    @IBOutlet weak var item1Stepper: UIStepper!
    var item1Quantity = 0
    
    @IBOutlet weak var item2ImageView: UIImageView!
    @IBOutlet weak var item2TitleLabel: UILabel!
    @IBOutlet weak var item2PriceLabel: UILabel!
    @IBOutlet weak var item2QuantityLabel: UILabel!
    @IBOutlet weak var item2Stepper: UIStepper!
    var item2Quantity = 0
    
    @IBOutlet weak var item3ImageView: UIImageView!
    @IBOutlet weak var item3TitleLabel: UILabel!
    @IBOutlet weak var item3PriceLabel: UILabel!
    @IBOutlet weak var item3QuantityLabel: UILabel!
    @IBOutlet weak var item3Stepper: UIStepper!
    var item3Quantity = 0
    
    @IBOutlet weak var totalBillLabel: UILabel!
    
    // MARK: - Properties
    var shoppingCart: ShoppingCart!
    var itemStore: ItemStore!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.shoppingCart = ShoppingCart()
        self.itemStore = shoppingCart.itemStore
        self.updateUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if shoppingCart.getTotal() == 0 {
            self.reset()
        }
    }
    
    // MARK: - Helper Method
    
    func updateUI() {
        if itemStore.items.count >= 3 {
            let item1 = itemStore.items[0]
            item1ImageView.image = item1.image
            item1TitleLabel.text = item1.title
            item1PriceLabel.text = "$\(item1.price)"
            item1QuantityLabel.text = "\(item1Quantity)"
            item1ImageView.layer.cornerRadius = 5.0
            item1ImageView.layer.masksToBounds = true
            
            let item2 = itemStore.items[1]
            item2ImageView.image = item2.image
            item2TitleLabel.text = item2.title
            item2PriceLabel.text = "$\(item2.price)"
            item2QuantityLabel.text = "\(item2Quantity)"
            item2ImageView.layer.cornerRadius = 5.0
            item2ImageView.layer.masksToBounds = true
            
            let item3 = itemStore.items[2]
            item3ImageView.image = item3.image
            item3TitleLabel.text = item3.title
            item3PriceLabel.text = "$\(item3.price)"
            item3QuantityLabel.text = "\(item3Quantity)"
            item3ImageView.layer.cornerRadius = 5.0
            item3ImageView.layer.masksToBounds = true
            
            let totalAmount = shoppingCart.getTotal()
            self.totalBillLabel.text = "\(totalAmount)"
        }
    }
    
    func reset() {
        item1Quantity = 0
        item2Quantity = 0
        item3Quantity = 0
        item1Stepper.value = 0
        item2Stepper.value = 0
        item3Stepper.value = 0
        
    }
    
    // MARK: - Target / Action
    
    @IBAction func item1StepperDidChange(_ sender: UIStepper) {
        let newQuantity = Int(sender.value)
        if newQuantity < item1Quantity {
            self.shoppingCart.remove(item: itemStore.items[0])
        } else {
            self.shoppingCart.add(item: itemStore.items[0])
        }
        
        item1Quantity = newQuantity
        self.updateUI()
    }
    
    @IBAction func item2StepperDidChange(_ sender: UIStepper) {
        let newQuantity = Int(sender.value)
        if newQuantity < item2Quantity {
            self.shoppingCart.remove(item: itemStore.items[1])
        } else {
            self.shoppingCart.add(item: itemStore.items[1])
        }
        
        item2Quantity = newQuantity
        self.updateUI()
    }
    
    @IBAction func item3StepperDidChange(_ sender: UIStepper) {
        let newQuantity = Int(sender.value)
        if newQuantity < item3Quantity {
            self.shoppingCart.remove(item: itemStore.items[2])
        } else {
            self.shoppingCart.add(item: itemStore.items[2])
        }
        
        item3Quantity = newQuantity
        self.updateUI()
    }
    
    // MARK: - Navigation
    
    struct Storyboard {
        static let showCheckout = "ShowCheckout"
        
    }
    
    
    func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == Storyboard.showCheckout {
            let checkoutVC = segue.destination as! CheckoutViewController
            checkoutVC.shoppingCart = self.shoppingCart
        }
    }
}














