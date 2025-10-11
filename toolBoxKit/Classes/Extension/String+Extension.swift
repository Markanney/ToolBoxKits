//
//  String+Extension.swift
//  Pods
//
//  Created by kanney on 2025/10/11.
//

import Foundation

// MARK: - String 扩展

public extension String {
    
    /// 移除字符串中的所有空格
    ///
    /// 使用场景：
    /// 当你需要去除用户输入或文本内容中的空格时。
    ///
    /// 示例：
    /// ```swift
    /// let text = "a b c".removeSpace()   // 输出 "abc"
    /// ```
    ///
    /// - Returns: 移除空格后的新字符串
    func removeSpace() -> String {
        replacingOccurrences(of: " ", with: "")
    }
}

// MARK: - 可选类型 String? 扩展

public extension String? {
    
    /// 判断可选字符串是否不为 nil 且不为空字符串
    ///
    /// 此方法会自动排除以下情况：
    /// - `nil`
    /// - 空字符串 `""`
    /// - 字面值为 `"nil"` 或 `"null"` 的字符串
    ///
    /// 示例：
    /// ```swift
    /// let a: String? = nil
    /// print(a.isNotNilAndEmpty()) // false
    ///
    /// let b: String? = ""
    /// print(b.isNotNilAndEmpty()) // false
    ///
    /// let c: String? = "hello"
    /// print(c.isNotNilAndEmpty()) // true
    /// ```
    ///
    /// - Returns: 如果字符串存在且非空，返回 `true`；否则返回 `false`
    func isNotNilAndEmpty() -> Bool {
        guard let self = self else { return false }
        
        if self.isEmpty {
            return false
        } else if self == "null" || self == "nil" {
            return false
        } else {
            return true
        }
    }

    /// 如果字符串为空或为 nil，返回默认值
    ///
    /// 使用场景：
    /// 在展示用户信息、接口返回数据时，防止出现空字符串导致 UI 显示异常。
    ///
    /// 示例：
    /// ```swift
    /// let name: String? = nil
    /// print(name.emptyDefaultValue("暂无")) // 输出 "暂无"
    ///
    /// let desc: String? = "Hello"
    /// print(desc.emptyDefaultValue("暂无")) // 输出 "Hello"
    /// ```
    ///
    /// - Parameter defaultValue: 当字符串为空或为 nil 时返回的默认文本（默认值为 `emptyInfoDefaultText`）
    /// - Returns: 有效字符串或默认值
    func emptyDefaultValue(_ defaultValue: String = emptyInfoDefaultText) -> String {
        guard let self = self, !self.isEmpty else { return defaultValue }
        return self
    }
}
