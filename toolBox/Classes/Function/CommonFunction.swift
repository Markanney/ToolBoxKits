//
//  CommonFunction.swift
//  Pods
//
//  Created by kanney on 2025/10/11.
//


// MARK: - 颜色工具函数

/// 将十六进制颜色值转换为 `UIColor`
///
/// 使用示例：
/// ```swift
/// let color = UIColorFromHex(0x3498db) // 天蓝色
/// ```
///
/// - Parameter hexColor: 十六进制颜色值（例如 `0xFFFFFF`）
/// - Returns: 对应的 `UIColor` 对象
func UIColorFromHex(_ hexColor: UInt64) -> UIColor {
    UIColor(red: CGFloat((hexColor & 0xFF0000) >> 16) / 255.0, green: CGFloat((hexColor & 0xFF00) >> 8) / 255.0, blue: CGFloat(hexColor & 0xFF) / 255.0, alpha: 1.0)
}

// MARK: - 随机字符串工具函数

/// 可用于生成由字母与数字组成的随机字符串
///
/// 使用示例：
/// ```swift
/// let code = randomStr(len: 8)
/// print(code) // 例如输出 "aZ3bK2dE"
/// ```
///
/// - Parameter len: 随机字符串的长度
/// - Returns: 指定长度的随机字符串
public func randomStr(len: Int) -> String {
    
    var ranStr = ""
    for _ in 0..<len {
        let index = Int(arc4random_uniform(UInt32(random_str_characters.count)))
        ranStr.append(random_str_characters[random_str_characters.index(random_str_characters.startIndex, offsetBy: index)])
    }
    return ranStr
}


