//
//  LogUtil.swift
//  Pods
//
//  Created by kanney on 2025/10/28.
//

import Foundation

/// 详细日志输出函数 - 专为调试设计，仅在 DEBUG 模式下生效
/// - Parameters:
///   - message: 日志信息，支持任意类型
///   - file: 文件名，默认自动获取
///   - method: 方法名，默认自动获取
///   - line: 行号，默认自动获取
public func debugLog<T>(_ message: T,
                file: String = #file,
                method: String = #function,
                line: Int = #line) {
    #if DEBUG
    print("📍 \((file as NSString).lastPathComponent)[\(line)] | 🎯 \(method): \n📝 \(message)\n")
    #endif
}
