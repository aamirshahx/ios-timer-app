//
//  ViewController.swift
//  ios-timer-app
//
//  Created by Aamir Shah on 11/15/16.
//  Copyright © 2016 Aamir Shah. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var timer = Timer()
    var time = 210
    var timerIsDead = false
    
    @IBOutlet weak var timerCount: UILabel!
    
    @IBAction func pause(_ sender: Any) {
        timer.invalidate()
    }
    @IBAction func play(_ sender: Any) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.decreaseTime), userInfo: nil, repeats: true)
    }
    @IBAction func minusTen(_ sender: Any) {
        if time > 10 {
            time -= 10
            timerCount.text = String(time)
        }
    }
    @IBAction func plusTen(_ sender: Any) {
        time += 10
        timerCount.text = String(time)
    }
    @IBAction func reset(_ sender: Any) {
        timer.invalidate()
        time = 210
        timerCount.text = String(time)
        if !timerIsDead {
            self.play(self)
        }
    }
    
    func decreaseTime() {
        if (time > 0) {
            time -= 1
            timerCount.text = String(time)
        } else {
            timer.invalidate()
            timerIsDead = true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        timerCount.text = String(time)
        self.play(self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

