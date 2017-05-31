//
//  ViewController.swift
//  XTDynamicCashLabel
//
//  Created by 叶慧伟 on 2017/5/17.
//  Copyright © 2017年 叶慧伟. All rights reserved.
//

import UIKit

let screenSize = UIScreen.main.bounds.size


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setUI()
        
    }
    
    func setUI() {
        
        view.addSubview(inputField)
    
        let starBtn = UIButton.init(frame: CGRect.init(x: screenSize.width / 2 + 50, y: 100, width: 50, height: 50))
        starBtn.setTitle("开始", for: .normal)
        starBtn.backgroundColor = UIColor.orange
        starBtn.setTitleColor(UIColor.white, for: .normal)
        starBtn.addTarget(self, action: #selector(starBtnClick), for: .touchUpInside)
        view.addSubview(starBtn)
    }
    
    func starBtnClick(){
        if (inputField.text?.characters.count)! > 0{
            
            dynaLabel.dynamicCash(cash: inputField.text!)
//            dynaLabel.dynamicCash(cash: inputField.text!, length: 6)
            view.addSubview(dynaLabel)
        }
    }
    
    lazy var inputField : UITextField = {
        let field = UITextField.init(frame: CGRect.init(x: screenSize.width / 2 - 70, y: 100, width: 100, height: 50))
        field.borderStyle = .roundedRect
        return field
    }()
    
    lazy var dynaLabel : XTDynamicLabel = {
        let label = XTDynamicLabel.init(frame: CGRect.init(x: screenSize.width / 2 - 50, y: 200, width: 100, height: 50))
        label.font = UIFont.systemFont(ofSize: 25)
        label.textColor = UIColor.red
        return label
    }()

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

