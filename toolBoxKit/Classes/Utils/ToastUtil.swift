//
//  ToastUtil.swift
//  Pods
//
//  Created by kanney on 2025/10/28.
//

import Foundation
import SwiftMessages

/// 显示自动消失的Toast提示
/// - Parameters:
///   - body: 提示文本内容
///   - autoHide: 是否自动隐藏，默认为true
///   - time: 显示时长，默认为toastDefaultDuration
///   - presentationStype: 显示样式，默认为顶部显示
///   - canEdit: 显示期间是否允许用户交互，默认为true
///   - completion: 隐藏后的回调闭包
public func showAutoToast(_ body: String,
                  autoHide: Bool = true,
                  time: TimeInterval = toastDefaultDuration,
                  presentationStype: SwiftMessages.PresentationStyle = .top,
                  canEdit: Bool = true,
                  completion: @escaping () -> Void = {}) {
    
    // 在主线程异步执行，确保UI操作在主线程
    DispatchQueue.main.asyncAfter(deadline: .now()) {
        // 设置SwiftMessages配置项
        var config = SwiftMessages.Config()
        
        // 创建并配置Toast视图
        let toastView = MessageView.viewFromNib(layout: .centeredView)
        toastView.configureTheme(.error)           // 设置主题为错误样式
        toastView.button?.isHidden = true          // 隐藏按钮
        toastView.iconImageView?.isHidden = true   // 隐藏图标
        toastView.backgroundView?.backgroundColor = .black  // 设置背景色为黑色
        toastView.bodyLabel?.textColor = .white    // 设置文本颜色为白色
        toastView.titleLabel?.isHidden = true      // 隐藏标题
        toastView.configureContent(body: body)     // 设置内容文本
        
        // 配置显示持续时间
        config.duration = autoHide ? .seconds(seconds: time) : .forever
        // 设置显示样式
        config.presentationStyle = presentationStype
        // 设置显示上下文为状态栏级别的窗口
        config.presentationContext = .window(windowLevel: .statusBar)
        
        // 添加事件监听器
        config.eventListeners.append { event in
            appKeyWindow.isUserInteractionEnabled = canEdit
            // 当Toast隐藏时恢复用户交互并执行回调
            if case .didHide = event {
                appKeyWindow.isUserInteractionEnabled = true
                completion()
            }
        }
        
        // 显示Toast
        SwiftMessages.show(config: config, view: toastView)
    }
}

/// 立即隐藏所有Toast
public func toastHidNow() {
    // 在主线程异步执行隐藏操作
    DispatchQueue.main.asyncAfter(deadline: .now()) {
        SwiftMessages.hideAll()
    }
}
