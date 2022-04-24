//
//  ViewController.swift
//  FirstApp
//
//  Created by onlywis on 2022/04/14.
//

import UIKit

class ViewController: UIViewController, EditDelegate {
    
    let timeSelect: Selector = #selector(ViewController.updateTime)
    let interval = 0.1
    
    var showDate: Bool = true
    var showTime: Bool = true
    var showDay: Bool = true
    var isKorean: Bool = true
    var showMainStatusBar: Bool = true
    
    @IBOutlet var lblCurrentDate: UILabel!
    @IBOutlet var lblCurrentTime: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("[view] viewDidLoad()")
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelect, userInfo: nil, repeats: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //setNeedsStatusBarAppearanceUpdate()
        print("[view] viewWillApear()")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("[view] viewDidAppear() - mainStatus:\(showMainStatusBar)")
        //navigationController?.setNavigationBarHidden(false, animated: animated)
        //setNeedsStatusBarAppearanceUpdate()
        //print("[view] statusBar: \(showStatusBar)")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("[view] viewWillDisappear()")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        //showStatusBar = true
        //setNeedsStatusBarAppearanceUpdate()
        print("[view] viewDidDisapear()")
    }

    @objc func updateTime() {
        printDate()
    }
    
    func didShowDateDone(_ controller: EditViewController, showOnOff: Bool) {
        showDate = showOnOff
    }
    func didShowTimeDone(_ controller: EditViewController, showOnOff: Bool) {
        showTime = showOnOff
    }
    func didShowDayDone(_ controller: EditViewController, showOnOff: Bool) {
        showDay = showOnOff
    }
    func didIsKoreanDone(_ controller: EditViewController, isKorean: Bool) {
        self.isKorean = isKorean
    }
    func didShowStatusBarDone(_ controller: EditViewController, showMainStatusBar: Bool) {
        self.showMainStatusBar = showMainStatusBar
    }

    func printDate() {
        let date = NSDate()
        let formatter = DateFormatter()
        if self.isKorean == true {
            formatter.locale = Locale(identifier: "ko_KR")
        } else {
            formatter.locale = Locale(identifier: "en_US")
        }
        
        if showDate == true {
            if showDay == true {
                formatter.dateFormat = "yyyy-MM-dd EEE"
            } else {
                formatter.dateFormat = "yyyy-MM-dd"
            }
            lblCurrentDate.text = formatter.string(from: date as Date)
        } else {
            lblCurrentDate.text = ""
        }
        if showTime == true {
            formatter.dateFormat = "HH:mm:ss"
            lblCurrentTime.text = formatter.string(from: date as Date)
        } else {
            lblCurrentTime.text = ""
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let editViewController = segue.destination as! EditViewController
        
        editViewController.showDate = self.showDate
        editViewController.showTime = self.showTime
        editViewController.showDay = self.showDay
        editViewController.isKorean = self.isKorean
        editViewController.showMainStatusBar = self.showMainStatusBar
        
        editViewController.delegate = self
        
        print("[view] prepare()")
    }
    
    override var prefersStatusBarHidden: Bool {
        return !showMainStatusBar
    }
}

