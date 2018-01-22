//
//  ViewController.swift
//  clockIn
//
//  Created by NewfieRocket on 2018-01-22.
//  Copyright © 2018 NewfieRocket. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var timer = Timer()
    var dayRecord = [String]()
    @IBOutlet weak var currentDayLabel: UILabel!
    
    @IBOutlet weak var updateLabel: UILabel!
    
    @IBOutlet weak var updateNutton: UIButton!
    
    @IBOutlet weak var dailyCheckins: UILabel!
    
    var myTimer: Timer!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        updateTime()
        myTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
        
        
       // currentDayLabel.text = "Current Date: \(dateTime)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @objc func updateTime() {
        let dateTime = DateTime().currentDate()
        currentDayLabel.text = "Current Date: \(dateTime)"
    }
    
    func showDailyUpdate() {
        var stringToLabel: String = ""
        for item in dayRecord {
            stringToLabel.append("\(item)\n")
            
        }
        dailyCheckins.text = stringToLabel
    }
    
    @IBAction func updateButton(_ sender: UIButton) {
        let entry = "\(DateTime().currentDate())"
        dayRecord.append(entry)
        updateLabel.text = entry
        showDailyUpdate()
    }
    
}

