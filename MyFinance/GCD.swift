//
//  GCD.swift
//  MyFinance
//
//  Created by J B on 11/7/17.
//  Copyright © 2017 Bosco Ybarra. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func executeOnMain(_ updates: @escaping () -> Void) {
        DispatchQueue.main.async {
            updates()
        }
    }
    
    func executeOnMain(withDelay timeInSecond: Double, _ updates: @escaping () -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + timeInSecond, execute: {
            updates()
        })
    }
    
    func performUIUpdatesOnMain(_ updates: @escaping () -> Void) {
        DispatchQueue.main.async {
            updates()
        }
    }
}

