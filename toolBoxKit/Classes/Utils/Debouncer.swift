//
//  Debouncer.swift
//  Pods
//
//  Created by kanney on 2025/10/13.
//

import Foundation

public class Debouncer {
    
    /// 单例
    public static let shared = Debouncer()
    
    /// 点击时间队列（可选）
    private var cacheQueue: [DispatchTime] = []
    
    /// 当前的延迟任务
    private var debounceWorkItem: DispatchWorkItem?
    
    /// 私有化初始化，防止外部创建实例
    private init() {}
    
    /// 执行防抖操作
    /// - Parameters:
    ///   - delay: 防抖延迟，默认 0.3 秒
    ///   - action: 防抖触发的操作
    public func debounce(delay: DispatchTimeInterval = .milliseconds(300), action: @escaping () -> Void) {
        // 取消之前的任务
        debounceWorkItem?.cancel()
        
        // 添加当前点击时间
        let currentClickTime = DispatchTime.now()
        cacheQueue.append(currentClickTime)
        
        // 创建新的任务
        let workItem = DispatchWorkItem { [weak self] in
            action()
            self?.clear() // 在 debounce 后再清理
        }
        
        // 保存任务
        debounceWorkItem = workItem
        
        // 延迟执行
        DispatchQueue.main.asyncAfter(deadline: .now() + delay, execute: workItem)
    }
    
    /// 清理缓存队列
    public func clear() {
        cacheQueue.removeAll()
    }
}

