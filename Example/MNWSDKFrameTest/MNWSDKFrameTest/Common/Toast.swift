//
//  Toast.swift
//  sdksample
//
//  Created by mini1 on 2021/5/8.
//

import UIKit
import Toast_Swift

class Toast: NSObject {
    
    static private var style: ToastStyle = {
        var style = ToastStyle()
        style.horizontalPadding = 12
        style.verticalPadding = 12
        return style
    }()

    @objc static func makeToast(_ message: String?) {
        let window = UIApplication.shared.keyWindow
        window?.makeToast(message, duration: 1.5, position: .center, title: nil, image: nil, style: style, completion: nil)
    }
    
}
