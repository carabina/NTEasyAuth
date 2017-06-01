//
//  ViewController.swift
//  NTEasyAuthDemo
//
//  Created by ntian on 2017/6/1.
//  Copyright © 2017年 ntian. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print(NTEasyAuth.shared.isTouchIDAllowed)
        NTEasyAuth.shared.touchIDAuth(message: "快把你的小爪子放在伦家的按钮上嘛~", fallbackTitle: "我不愿意了啦~")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

