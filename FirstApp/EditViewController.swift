//
//  EditViewController.swift
//  디지털 시계
//
//  Created by onlywis on 2022/04/15.
//

import UIKit

protocol EditDelegate {
    func didShowDateDone(_ controller: EditViewController, showOnOff: Bool)
    func didShowTimeDone(_ controller: EditViewController, showOnOff: Bool)
    func didShowDayDone(_ controller: EditViewController, showOnOff: Bool)
    func didIsKoreanDone(_ controller: EditViewController, isKorean: Bool)
    func didShowStatusBarDone(_ controller: EditViewController, showMainStatusBar: Bool)
}

class EditViewController: UIViewController {
    
    @IBOutlet var swShowDate: UISwitch!
    @IBOutlet var swShowTime: UISwitch!
    @IBOutlet var swShowDay: UISwitch!
    @IBOutlet var swIsKorean: UISwitch!
    @IBOutlet var swShowStatusBar: UISwitch!
    
    var showDate: Bool = true
    var showTime: Bool = true
    var showDay: Bool = true
    var isKorean: Bool = true
    var showMainStatusBar: Bool = true
    var delegate: EditDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print("[edit] viewDidLoad()")
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("[edit] viewWillAppear()")
        
        swShowDate.isOn = showDate
        swShowTime.isOn = showTime
        swShowDay.isOn = showDay
        swIsKorean.isOn = isKorean
        swShowStatusBar.isOn = showMainStatusBar
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("[edit] viewDidAppear() - mainStatus:\(showMainStatusBar)")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("[edit] viewWillDisappear()")
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("[edit] viewDidDisappear()")
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func swShowDateOnOff(_ sender: UISwitch) {
        swShowDay.isEnabled = swShowDate.isOn
        
        if delegate != nil {
            delegate?.didShowDateDone(self, showOnOff: swShowDate.isOn)
        }
    }
    
    @IBAction func swShowTimeOnOff(_ sender: UISwitch) {
        if delegate != nil {
            delegate?.didShowTimeDone(self, showOnOff: swShowTime.isOn)
        }
    }
    
    @IBAction func swShowDayOnOff(_ sender: UISwitch) {
        if delegate != nil {
            delegate?.didShowDayDone(self, showOnOff: swShowDay.isOn)
        }
    }
    
    @IBAction func swIsKorean(_ sender: UISwitch) {
        if delegate != nil {
            delegate?.didIsKoreanDone(self, isKorean: swIsKorean.isOn)
        }
    }
    
    @IBAction func swShowStatusBar(_ sender: UISwitch) {
        if delegate != nil {
            delegate?.didShowStatusBarDone(self, showMainStatusBar: swShowStatusBar.isOn)
        }
        showMainStatusBar = swShowStatusBar.isOn
        setNeedsStatusBarAppearanceUpdate()
    }
    
    override var prefersStatusBarHidden: Bool {
        return !showMainStatusBar
    }
    
}
