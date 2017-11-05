//
//  ViewController.swift
//  MyFinance
//
//  Created by J B on 11/5/17.
//  Copyright © 2017 Bosco Ybarra. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var etherValueLabel: UILabel!
    
    let apiURL = URL(string: "https://min-api.cryptocompare.com/data/price?fsym=ETH&tsyms=EUR")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //By default, URL objects initialized with a String are optional since the URL could potentially return nil if the String resolves to an invalid web address.
        
        //guard statement ensures apiURL is safely unwrapped and ready to be used to fetch that data.
        guard let apiURL = apiURL else {
            return
        }
        
        // Make the GET request for our API URL to get the value NSNumber
        makeValueGETRequest(url: apiURL) { (value) in
            
            // Must update the UI on the main thread since makeValueGetRequest is a background operation
            DispatchQueue.main.async {
                // Set the etherValueLabel with the formatted USD value or "Failed" in the case of failure
                self.etherValueLabel.text = self.formatAsCurrencyString(value: value) ?? "Failed"
            }
        }
    }
    
    private func makeValueGETRequest(url: URL, completion: @escaping (_ value: NSNumber?) -> Void) {
        
        let request = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data, error == nil else {
                completion(nil)
                print(error?.localizedDescription ?? "")
                return
            }
            
            do {
                guard let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any],
                    let value = json["EUR"] as? NSNumber else {
                        completion(nil)
                        return
                }
                completion(value)
            } catch  {
                completion(nil)
                print(error.localizedDescription)
            }
        }
        request.resume()
    }
    
    private func formatAsCurrencyString(value: NSNumber?) -> String? {
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "en_EU")
        formatter.numberStyle = .currency
        
        guard let value = value,
            let formattedCurrencyAmount = formatter.string(from: value) else {
                return nil
        }
        return formattedCurrencyAmount
    }
    
    
}

