# 🧰 ToolBoxKits

## ✨ 简介

`ToolBoxKits` 是一个轻量级 Swift 工具库，收集了常用的开发辅助方法与扩展，  
旨在简化日常 iOS 开发中的重复工作，让你的代码更简洁、更高效。  

包含但不限于以下功能：

- 🚀 异步加载与渲染图片（基于 [Kingfisher](https://github.com/onevcat/Kingfisher)）
- 💬 常用工具函数与类型扩展
- 🫘 防抖工具
- 📖 UILable边距拓展
- 💫 智能 Toast 提示
---

## 🧪 示例项目

要运行示例 Demo，请执行以下命令：

```bash
git clone https://github.com/Markanney/ToolBoxKits.git
cd Example
pod install
open toolBoxKit.xcworkspace

```

---

## ⚙️ 系统要求
|环境|最低要求|
|---|---|
|iOS|15.0+|
|Swift|5.0+|

---

## 📦 安装
1.使用 CocoaPods
*在你的 Podfile 中添加：
pod 'ToolBoxKits'

*或指定版本：
pod 'ToolBoxKits', '~> 1.0.0'

*然后执行：
pod install

2.使用 Swift Package Manager（可选）

*你也可以通过 SPM 添加：
i.在 Xcode 中打开
File → Add Packages → 输入仓库地址：
https://github.com/Markanney/ToolBoxKits.git

ii.选择版本（如 1.0.0）并添加依赖。

---

## 发布到 CocoaPods Trunk

从仓库根目录运行以下命令。校验配置会把 CocoaPods 生成的所有模拟器 target 统一设为 iOS 15，包括声明较旧部署版本的第三方依赖。

```sh
XCODE_XCCONFIG_FILE="$PWD/TrunkValidation.xcconfig" pod trunk push ToolBoxKits.podspec
```

## 💡 使用示例
✅ 异步加载图片示例

```swift

import UIKit
import toolBox

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        Task {
            if let url = URL(string: "https://example.com/demo.png") {
                let image = await url.getImage()
                print(image ?? "Load failed")
            }
        }
    }
}

```

✅ 字符串新增扩展示例

```swift
let text = "a b c".removeSpace()
// 输出 "abc"

let a: String? = nil
print(a.isNotNilAndEmpty()) // false

let b: String? = ""
print(b.isNotNilAndEmpty()) // false

let c: String? = "hello"
print(c.isNotNilAndEmpty()) // true

let name: String? = nil
print(name.emptyDefaultValue("暂无")) 
// 输出 "暂无"

let desc: String? = "Hello"
print(desc.emptyDefaultValue("暂无"))
    // 输出 "Hello"
```

✅ 常用 UI 尺寸常量

```swift
let statusHeight = appStatusBarHeight
let tabHeight = appTabBarHeight
let widthRatio = appWidthRatio
...

```

✅ 防抖工具

```swift
let vi  = UIViewController()
vi.view.backgroundColor = .white

DispatchQueueUtil.main.asyncAfter(deadline: .now() + 2.0) {
/// 自动防抖后清除
   Debouncer.shared.debounce {
      self.navigationController?.pushViewController(vi, animated: false)
   }
}
```

✅ 智能 Toast 提示

```swift

// 基本用法 - 显示自动消失的提示
showAutoToast("操作成功")

// 自定义显示时长
showAutoToast("加载中...", time: 5.0)

// 手动控制隐藏
showAutoToast("点击确定继续", autoHide: false)

// 底部显示样式
showAutoToast("保存成功", presentationStype: .bottom)

// 带回调的Toast
showAutoToast("操作完成") {
    print("Toast已隐藏，执行后续操作")
    // 跳转到下一页或其他操作
}

// 立即隐藏所有Toast
toastHidNow()

```

✅ 增强调试日志

```swift

// 基本日志输出
debugLog("用户登录成功")

// 输出对象信息
let user = User(name: "John", age: 25)
debugLog(user)

// 输出网络请求信息
debugLog("API响应: \(response)")

// 输出错误信息
debugLog("错误详情: \(error.localizedDescription)")

// 在方法中自动记录调用位置
func fetchData() {
    debugLog("开始获取数据")
    // 业务逻辑...
    debugLog("数据获取完成")
}

输出示例：

📍 ViewController.swift[25] | 🎯 viewDidLoad: 
📝 用户登录成功

📍 UserService.swift[42] | 🎯 fetchUserInfo: 
📝 User(name: "John", age: 25)

📍 NetworkManager.swift[18] | 🎯 requestData: 
📝 API响应: { "status": "success" }

```

---

## 📜 License
  ToolBoxKits is available under the MIT License.  
See the LICENSE file for more information.  

This library uses the following open-source components:  
- Kingfisher — MIT License  
- PromiseKit — MIT License  
- SnapKit — MIT License

---

## ❤️ Support
如果这个库对你有帮助，请给它一个 ⭐️ Star 支持一下！
你的支持是我持续更新的动力 💪

