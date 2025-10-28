//
//  AppInfoConfig.swift
//  Pods
//
//  Created by kanney on 2025/10/11.
//

import UIKit

// MARK: - 🪟 全局 UI 尺寸与窗口工具

/// 当前应用的 keyWindow（主窗口）
///
/// 通过获取已连接的 `UIWindowScene` 并筛选出 `isKeyWindow`。
/// 若未找到则返回一个空的 `UIWindow`。
public let appKeyWindow: UIWindow = {
    UIApplication.shared.connectedScenes
        .compactMap { $0 as? UIWindowScene }
        .flatMap { $0.windows }
        .first { $0.isKeyWindow } ?? UIWindow()
}()

/// 当前状态栏的高度（含安全区）
///
/// 若无法获取则返回 0。
public let appStatusBarHeight: CGFloat = {
    UIApplication.shared.connectedScenes
        .compactMap { $0 as? UIWindowScene }
        .first?
        .statusBarManager?
        .statusBarFrame
        .height ?? 0
}()

/// 导航栏标准高度（默认 44）
///
/// 通过创建临时 `UINavigationController` 获取。
public let appNaviBarHeight: CGFloat = UINavigationController().navigationBar.frame.size.height

/// TabBar 标准高度（默认 49）
///
/// 通过创建临时 `UITabBarController` 获取。
public let appTabBarHeight: CGFloat = UITabBarController().tabBar.frame.size.height

/// 当前屏幕宽度（自动取较小值）
///
/// 用于横竖屏适配时保持一致。
public let appScreenWidth: CGFloat = min(UIScreen.main.bounds.size.width, UIScreen.main.bounds.size.height)

/// 当前屏幕高度（自动取较大值）
public let appScreenHeight: CGFloat = max(UIScreen.main.bounds.size.width, UIScreen.main.bounds.size.height)

/// 高度适配比例（以 iPhone 8 高度 667 为基准）
///
/// 可用于根据屏幕高度缩放布局。
public let appHeightRatio: CGFloat = appScreenHeight / 667.0

/// 宽度适配比例（以 iPhone 8 宽度 375 为基准）
///
/// 可用于根据屏幕宽度缩放布局。
public let appWidthRatio: CGFloat = appScreenWidth / 375.0

/// 底部安全区留白高度（iPhone X 系列为 34，其余为 0）
///
/// 可用于计算 ScrollView contentInset 或底部安全区域。
public let appBottomSpace: CGFloat = appScreenHeight >= 812 ? 34.0 : 0

