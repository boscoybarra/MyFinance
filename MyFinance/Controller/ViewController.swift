//
//  ViewController.swift
//  MyFinance
//
//  Created by J B on 11/5/17.
//  Copyright © 2017 Bosco Ybarra. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var bitcoinValueLabel: UILabel!
    @IBOutlet weak var bitcoinCashValueLabel: UILabel!
    @IBOutlet weak var etherValueLabel: UILabel!
    
    let apiURL = URL(string: "https://min-api.cryptocompare.com/data/price?fsym=ETH&tsyms=EUR")
    let apiURLBitcoin = URL(string: "https://min-api.cryptocompare.com/data/price?fsym=BTC&tsyms=EUR")
    let apiURLBitcoinCash = URL(string: "https://min-api.cryptocompare.com/data/price?fsym=BCH&tsyms=EUR")
    var timer = Timer()


    
//    func scheduledTimerWithTimeInterval(){
//        // Scheduling timer to Call the function "updateCounting" with the interval of 1 seconds
//        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.getCrypto), userInfo: nil, repeats: true)
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getCrypto()
        //scheduledTimerWithTimeInterval()
    }
    
    fileprivate func getCrypto() {
        MYFClient.getCrypto(completionHandler: createCryptoPricesFromURLs)
    }
    
    
    func createCryptoPricesFromURLs(urls: Float?, error: Error?) {
        let stringFloat =  String(describing: urls!)
        DispatchQueue.main.async {
        self.bitcoinValueLabel.text = stringFloat
        }
        
        
    }
    
   
    
    
}

