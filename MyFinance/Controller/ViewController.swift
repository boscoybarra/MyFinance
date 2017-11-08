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

        do {
            
            MYFClient.getCrypto(completionHandler: createCryptoPricesFromURLs)
            
        } catch {
            print("Failed to get photos")
            print(error.localizedDescription)
            self.presentErrorAlertController("Oops!", alertMessage: "There was an error loading your photos")
        }
        
    }
    
    
    func createCryptoPricesFromURLs(urls: String?, error: Error?) {
        
        print("This is what I gat", urls)
        //By default, URL objects initialized with a String are optional since the URL could potentially return nil if the String resolves to an invalid web address.
        
        //guard statement ensures apiURL is safely unwrapped and ready to be used to fetch that data.
        guard let apiURL = apiURL else {
            return
        }
        
        guard let apiURLBitcoin = apiURLBitcoin else {
            return
        }
        
        guard let apiURLBitcoinCash = apiURLBitcoinCash else {
            return
        }
        
        // Make the GET request for our API URL to get the value NSNumber
//        MYFClint.makeValueGETRequest(url: apiURL) { (value) in
//
//            // Must update the UI on the main thread since makeValueGetRequest is a background operation
//            DispatchQueue.main.async {
//                // Set the etherValueLabel with the formatted USD value or "Failed" in the case of failure
//                self.etherValueLabel.text = self.formatAsCurrencyString(value: value) ?? "Failed"
//            }
//        }
        
//        MYFClint.makeValueGETRequest(url: apiURLBitcoin) { (value) in
//
//            // Must update the UI on the main thread since makeValueGetRequest is a background operation
//            DispatchQueue.main.async {
//                self.bitcoinValueLabel.text = self.formatAsCurrencyString(value: value) ?? "Failed"
//            }
//        }
        
//        MYFClint.makeValueGETRequest(url: apiURLBitcoinCash) { (value) in
//
//            // Must update the UI on the main thread since makeValueGetRequest is a background operation
//            DispatchQueue.main.async {
//                self.bitcoinCashValueLabel.text = self.formatAsCurrencyString(value: value) ?? "Failed"
//            }
//        }
        
    }
    
   
    
    
}

