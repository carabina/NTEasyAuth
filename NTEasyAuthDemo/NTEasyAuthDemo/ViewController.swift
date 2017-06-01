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
        
        print(NTEasyAuth.shared.isTouchIDEnabled)
        NTEasyAuth.shared.delegate = self
        NTEasyAuth.shared.touchIDAuth(message: "快把你的小爪子放在伦家的按钮上嘛~", fallbackTitle: "我不愿意了啦~")
        NTEasyAuth.shared.isEnabledAuth = true
        NTEasyAuth.shared.passcode.passcode = "3333"
        
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
        noticeLabel.text = "TouchID 想去输入密码"
        let alert = UIAlertController(title: "输入密码", message: nil, preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "密码"
            textField.isSecureTextEntry = true
        }
        let action = UIAlertAction(title: "确定", style: .default) { (_) in
            if (alert.textFields?[0].text == NTEasyAuth.shared.passcode.passcode) {
                self.noticeLabel.text = "密码正确"
            } else {
                self.noticeLabel.text = "密码错误"
            }
        }
        let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    func touchIDAuthCancel() {
        noticeLabel.text = "TouchID 验证被取消"
    }
    func touchIDAuthLockout() {
        noticeLabel.text = "TouchID 被锁定了"
    }
}
