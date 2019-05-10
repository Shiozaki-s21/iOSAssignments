//
//  ViewController.swift
//  Assignment9
//
//  Created by SubaruShiozaki on 2019-05-10.
//  Copyright © 2019 Kazuya Takahashi. All rights reserved.
//

import UIKit
import ScrollableGraphView

class ViewController: UIViewController, ScrollableGraphViewDataSource {
    
    func value(forPlot plot: Plot, atIndex pointIndex: Int) -> Double {
        switch(plot.identifier) {
        case "linePlot":
            return linePlotData[pointIndex]
        default:
            return 0
        }
    }
    
    func label(atIndex pointIndex: Int) -> String {
        return xAxisLabels[pointIndex]
    }
    
    func numberOfPoints() -> Int {
        return xAxisLabels.count
    }
    
    var linePlotData: [Double] = [1,2,3,4,5,6] // data for line plot
    var xAxisLabels: [String] = ["1","2","3","4","5", "6"] // the labels along the x axis
    
    override func viewDidLoad() {
        let graph = ScrollableGraphView(frame: self.view.frame, dataSource: self)
        
        let reLine = ReferenceLines()
        
        let linePlot = LinePlot(identifier: "linePlot")
        linePlot.lineWidth = 5
        linePlot.lineColor = .black

        
        graph.addPlot(plot: linePlot)
        
        graph.addReferenceLines(referenceLines: reLine)
        
        view.addSubview(graph)
    }
}
