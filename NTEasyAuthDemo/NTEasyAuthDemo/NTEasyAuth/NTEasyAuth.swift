//
//  NTEasyAuth.swift
//  NTEasyAuthDemo
//
//  Created by ntian on 2017/6/1.
//  Copyright © 2017年 ntian. All rights reserved.
//

import Foundation
import LocalAuthentication

private let context = LAContext()

open class NTEasyAuth {
    private init() {}
    
    open static let shared = NTEasyAuth()
    open weak var delegate: NTEasyAuthDelegate?
    open var isTouchIDAllowed: Bool {
        return isTouchIDEnabled()
    }
    
    open func touchIDAuth(message: String, fallbackTitle: String) {
        context.localizedFallbackTitle = fallbackTitle

        guard isTouchIDAllowed else {
            return
        }
        context.evaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, localizedReason: message, reply: { (isSuccess, error) in
            self.handleTouchIDResult(isSuccess, error)
        })
    }
    
    fileprivate func handleTouchIDResult(_ success: Bool, _ error: Error?) {
        DispatchQueue.main.async {
            if success {
                self.delegate?.touchIDAuthSuccess()
            } else if error != nil {
                switch Int32((error! as NSError).code) {
                case kLAErrorUserCancel:
                    self.delegate?.touchIDAuthCancel?()
                case kLAErrorSystemCancel:
                    self.delegate?.touchIDAuthCancel?()
                case kLAErrorUserFallback:
                    // 用户想去输入密码
                    if (self.delegate?.touchIDAuthFallback?() == nil) {
                        // 如果没在代理中使用这个方法 就用我自己的 代码
                    }
                case kLAErrorAuthenticationFailed:
                    print("验证指纹失败")
                default:
                    break;
                }
            }
        }
    }
}
extension NTEasyAuth {
    fileprivate func isTouchIDEnabled() -> Bool {
        return context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil)
    }
}
