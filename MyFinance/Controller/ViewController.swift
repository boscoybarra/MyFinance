//
//  ViewController.swift
//  MyFinance
//
//  Created by J B on 11/5/17.
//  Copyright © 2017 Bosco Ybarra. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: Properties
    
    var timer = Timer()
    
    // MARK: Outlets
    
    @IBOutlet weak var bitcoinValueLabel: UILabel!
    @IBOutlet weak var bitcoinCashValueLabel: UILabel!
    @IBOutlet weak var etherValueLabel: UILabel!

    
    func scheduledTimerWithTimeInterval(){
        // Scheduling timer to Call the function "updateCounting" with the interval of 1 seconds
        timer = Timer.scheduledTimer(timeInterval: 30, target: self, selector: #selector(self.getCrypto), userInfo: nil, repeats: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getCrypto()
        scheduledTimerWithTimeInterval()
    }
    
    @objc fileprivate func getCrypto() {
        MYFClient.getCrypto(completionHandler: createCryptoPricesFromURLs)
    }
    
    
    func createCryptoPricesFromURLs(urls: [Float]?, error: Error?) {
        let bitCoin = MYFClient.formatAsCurrencyString(value: urls![0] as NSNumber)
        let bitCoinCash = MYFClient.formatAsCurrencyString(value: urls![1] as NSNumber)
        let etherCoin = MYFClient.formatAsCurrencyString(value: urls![2] as NSNumber)
        
        DispatchQueue.main.async {
        self.bitcoinValueLabel.text = bitCoin
        self.bitcoinCashValueLabel.text = bitCoinCash
        self.etherValueLabel.text = etherCoin
        }
    }
 
}

