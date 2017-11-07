//
//  MYFConstants.swift
//  MyFinance
//
//  Created by J B on 11/7/17.
//  Copyright © 2017 Bosco Ybarra. All rights reserved.
//

// MARK: - Constants

struct Constants {
    
    // MARK: Crypto
    struct Crypto {
        static let APIScheme = "https"
        static let APIHost = "min-api.cryptocompare.com"
        static let APIPath = "/data/price"
    }
    
    
    // MARK: Crypto Parameter Keys
    struct CryptoParameterKeys {
        static let cryptoType = "fsym"
        static let currencyType = "tsyms"
    }
    
    // MARK: Crypto Parameter Values
    struct CryptoParameterValues {
        static let ResponseFormat = "json"
        static let DisableJSONCallback = "1" /* 1 means "yes" */
        static let UseSafeSearch = "1"
    }
    
    // MARK: Crypto Response Keys
    struct CryptoResponseKeys {
        static let currencyEUR = "EUR"
        static let currencyUSD = "USD"
        static let ResponseFormat = "json"
        
    }
    

}
