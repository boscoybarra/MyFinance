//
//  MYFConvinience.swift
//  MyFinance
//
//  Created by J B on 11/7/17.
//  Copyright © 2017 Bosco Ybarra. All rights reserved.
//

import Foundation

extension MYFClient {
    
    //MARK: -- Function GETs the values from Crypto
    
    static func getCrypto(completionHandler: @escaping cryptoURLsResponse) {
      
        let selectedCurrencies = MYFClient.cryptoValuesToCheck()
        
        let methodParameters = [
            Constants.CryptoParameterKeys.cryptoType: selectedCurrencies,
            Constants.CryptoParameterKeys.currencyType: Constants.CryptoParameterValues.currencyEUR
            ] as [String : Any]
        
        MYFClient.makeValueGETRequest(methodParameters: methodParameters as [String:AnyObject]) { (data: AnyObject?, error: NSError?) in
            func sendError(_ error: String) {
                _ = [NSLocalizedDescriptionKey : error]
                
            }
            
            guard (error == nil) else {
                sendError("There was an error with your request: \(error.debugDescription)")
                return
            }
            
            guard let cryptoinBTC = data![Constants.CryptoParameterValues.currencyBTC] as? [String:AnyObject] else {
                sendError("Crypto dictionary could not be printed in \(String(describing: data))")
                return
            }
            
            guard let cryptoinBCH = data![Constants.CryptoParameterValues.currencyBCH] as? [String:AnyObject] else {
                sendError("Crypto dictionary could not be printed in \(String(describing: data))")
                return
            }
            
            guard let cryptoinETH = data![Constants.CryptoParameterValues.currencyETH] as? [String:AnyObject] else {
                sendError("Crypto dictionary could not be printed in \(String(describing: data))")
                return
            }
            
            
            guard let cryptoInEuroToBTC = cryptoinBTC[Constants.CryptoParameterValues.currencyEUR] as? Float else {
                sendError("Crypto dictionary could not be printed in \(String(describing: data))")
                return
            }
            
            guard let cryptoInEuroToBCH = cryptoinBCH[Constants.CryptoParameterValues.currencyEUR] as? Float else {
                sendError("Crypto dictionary could not be printed in \(String(describing: data))")
                return
            }
            
            guard let cryptoInEuroToETH = cryptoinETH[Constants.CryptoParameterValues.currencyEUR] as? Float else {
                sendError("Crypto dictionary could not be printed in \(String(describing: data))")
                return
            }
            
            var currentCryptos = [Float]()
            
            currentCryptos.append(cryptoInEuroToBTC)
            currentCryptos.append(cryptoInEuroToBCH)
            currentCryptos.append(cryptoInEuroToETH)
            
            completionHandler(currentCryptos, nil)
            
            
//            let cryptoDictionary = EURStrings
//
//            // We check if value is empty in Euro
//            if cryptoInEUR != "" {
//
//                completionHandler(cryptoDictionary, nil)
//
//            } else {
//                print("No data from Cryto at this place")
//                completionHandler("", nil)
//            }
        }
        
    }
    
}
