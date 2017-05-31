//
//  XTDynamicLabel.swift
//  XTDynamicCashLabel
//
//  Created by 叶慧伟 on 2017/5/17.
//  Copyright © 2017年 叶慧伟. All rights reserved.
//

import UIKit

class XTDynamicLabel: UILabel {

    var cashString : String = ""
    var alterTimes = 0
    var showLength = 0
    
    //动态显示cash金额，实现方式 传入一个数字，每次增长十分之一
    func dynamicCash(cash : String) {
        if !cash.isEmpty {
            cashString = cash
            
            dynamic()
        }
        
    }
    
    func dynamicCash(cash : String, length : NSInteger) {
        if !cash.isEmpty{
            cashString = cash
            showLength = length
            
            dynamic()
        }
    }
    
    func dynamic() {
        if (cashString != ""){
            XTDynamicLabel.cancelPreviousPerformRequests(withTarget: self)
            alterTimes = 0
            
            dynamicNum()
        }
    }
    
    func dynamicNum() {
        alterTimes += 1
        if alterTimes == 10 {
            XTDynamicLabel.cancelPreviousPerformRequests(withTarget: self)
            
            if (cashString.characters.count) < showLength {
                for _ in 1...(showLength - cashString.characters.count) {
                    cashString.append("0")
                }
            }
            text = cashString
        }else{
            let showNum = alterTimes * Int(cashString)! / 10
            var showStr = String(showNum)
            if showLength > 0{
                if showStr.characters.count < showLength{
                    var lingling = showStr
                    for _ in 1...(showLength - showStr.characters.count) {
                        lingling.append("0")
                    }
                    showStr = lingling.copy() as! String
                }
            }
            text = showStr
            
            self.perform(#selector(dynamicNum), with: nil, afterDelay: 0.05)
        }
        sizeToFit()
    }
    
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
