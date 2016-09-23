//
//  CheckoutViewController.swift
//  Shopping Cart
//
//  Created by Victor Lee on 22/09/16.


import UIKit

class CheckoutViewController: UIViewController {

    @IBOutlet weak var totalBillLabel: UILabel!
    @IBOutlet weak var standardShippingButton: UIButton!
    @IBOutlet weak var expressShippingButton: UIButton!
    
    var shoppingCart: ShoppingCart!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Check out"
        standardShippingButton.isEnabled = false    // default is shown as standard shipping selected
        self.updateUI()
    }
    
    func updateUI() {
        totalBillLabel.text = "\(shoppingCart.getTotal())"
    }
    
    @IBAction func standardShippingSelected() {
        shoppingCart.shippingType = .standard
        standardShippingButton.isEnabled = false
        expressShippingButton.isEnabled = true
        
        self.updateUI()
    }
    
    @IBAction func expressShippingSelected() {
        shoppingCart.shippingType = .express
        standardShippingButton.isEnabled = true
        expressShippingButton.isEnabled = false
        
        self.updateUI()
    }
    
    @IBAction func placeOrderDidTap(_ sender: AnyObject)
    {
        let alertController = UIAlertController(title: "Confirm Order", message: "Please confirm that you want to make a payment of \(shoppingCart.getTotal())!", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
            let successActionSheet = UIAlertController(title: "Cancel", message: "Your order of \(self.shoppingCart.getTotal()) will be cancelled! Please shop again!", preferredStyle: .actionSheet)
            let cancelPlaceOrderAction = UIAlertAction(title: "Let's Shop More!", style: .default, handler: { (action) in
            self.shoppingCart.reset()
            })
            successActionSheet.addAction(cancelPlaceOrderAction)
            self.dismiss(animated: true, completion: nil)
            self.present(successActionSheet, animated: true, completion: nil)
        }
        let confirmAction = UIAlertAction(title: "Confirm", style: .default) { (action) in
            let successActionSheet = UIAlertController(title: "Thank you!", message: "Your payment of \(self.shoppingCart.getTotal()) was processed successfully! Please check your email for your order receipt email and shipping information.", preferredStyle: .actionSheet)
            let continueShoppingAction = UIAlertAction(title: "Let's Shop More!", style: .default, handler: { (action) in
                // TODO: - reset shopping cart, pop to root VC
                self.shoppingCart.reset()
                _ = self.navigationController?.popToRootViewController(animated: true)
            })
            
            successActionSheet.addAction(continueShoppingAction)
            self.dismiss(animated: true, completion: nil)
            self.present(successActionSheet, animated: true, completion: nil)
        }
        
        alertController.addAction(cancelAction)
        alertController.addAction(confirmAction)
        self.present(alertController, animated: true, completion: nil)
    }
}
