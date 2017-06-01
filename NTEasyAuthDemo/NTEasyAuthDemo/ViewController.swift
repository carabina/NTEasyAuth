//
//  ViewController.swift
//  NTEasyAuthDemo
//
//  Created by ntian on 2017/6/1.
//  Copyright © 2017年 ntian. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var noticeLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        print(NTEasyAuth.shared.isTouchIDAllowed)
        NTEasyAuth.shared.delegate = self
        NTEasyAuth.shared.touchIDAuth(message: "快把你的小爪子放在伦家的按钮上嘛~", fallbackTitle: "我不愿意了啦~")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func auth() {
        NTEasyAuth.shared.touchIDAuth(message: "快把你的小爪子放在伦家的按钮上嘛~", fallbackTitle: "我不愿意了啦~")
    }
}
extension ViewController: NTEasyAuthDelegate {
    func touchIDAuthSuccess() {
        noticeLabel.text = "TouchID 验证成功"
    }
    func touchIDAuthFail() {
        noticeLabel.text = "TouchID 验证失败"
    }
    func touchIDAuthFallback() {
        noticeLabel.text = "touchID 想去输入密码"
    }
    func touchIDAuthCancel() {
        noticeLabel.text = "touchID 验证被取消"
    }
}
extension ViewController {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        <#code#>
    }
}
