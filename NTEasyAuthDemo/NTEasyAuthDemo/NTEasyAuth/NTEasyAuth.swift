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
    open var isTouchIDAllowed: Bool {
        return isTouchIDEnabled()
    }
    
    func touchIDAuth(message: String, fallbackTitle: String) {
        context.localizedFallbackTitle = fallbackTitle
        if isTouchIDEnabled() == false {
            // 不支持 TouchId
        } else {
            context.evaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, localizedReason: message, reply: { (isSuccess, error) in
                if isSuccess {
                    // 验证成功
                } else {
                    // 验证失败
                }
            })
        }
    }
}
extension NTEasyAuth {
    
    fileprivate func isTouchIDEnabled() -> Bool {
        return context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil)
    }
}
