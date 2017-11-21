//
//  CheckerViewController.swift
//  MyFinance
//
//  Created by J B on 11/21/17.
//  Copyright © 2017 Bosco Ybarra. All rights reserved.
//

import UIKit
import Charts
import ChartsRealm

class CheckerViewController: UIViewController {
    

    @IBOutlet weak var pieVIew: PieChartView!
    
    
    // Chart data
    var workoutDuration = [String]()
    var beatsPerMinute = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Populate chart data
        populateChartData()
        
        // Bar chart
        //barChart()
        
        //Line chartBar
        //lineChart()
        
        // Cubic line chart
        //cubicChart()
    }
    
    // Populate data
    func populateChartData() {
        workoutDuration = ["1","2","3","4","5","6","7","8","9","10"]
        beatsPerMinute = ["76","150","160","180","195","195","180","164","136","112"]
        self.getChartData(with: workoutDuration, values: beatsPerMinute)
    }
    
    // Chart options
    
//    func cubicChart() {
//        let pieView = CubicChart(frame: CGRect(x: 0.0, y: 0.0, width: self.view.frame.width, height: self.view.frame.height))
//        cubicChart.delegate = self as! GetChartData
//        self.view.addSubview(cubicChart)
//    }
    
    // Conform to protocol
    func getChartData(with dataPoints: [String], values: [String]) {
        self.workoutDuration = dataPoints
        self.beatsPerMinute = values
    }
}

// MARK: - ChartFormatter required to config x axis



//public class ChartFormatter: NSObject, IAxisValueFormatter {
//
//    var workoutDuration = [String]()
//
//    public func stringForValue(_ value: Double, axis: AxisBase?) -> String {
//        return workoutDuration[Int(value)]
//    }
//
//    public func setValues(values:[String]) {
//        self.workoutDuration = values
//    }
//}

//    @IBAction func addValues(_ sender: Any) {
//        // Make sure there is an inputTable
//        guard let inputTable = piewView.inputTable else {
//            return
//        }
//        // We create an array of values
//        let values: [Double] = inputTable.rows.map {_ in return Double(arc4random_uniform(100))}
//        inputTable.addColumn("col #\(inputTable.columnNames.count + 1)", rowValues: values)
//    }
    

