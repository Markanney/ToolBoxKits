# 🧰 toolBoxKit

## ✨ 简介

`toolBoxKit` 是一个轻量级 Swift 工具库，收集了常用的开发辅助方法与扩展，  
旨在简化日常 iOS 开发中的重复工作，让你的代码更简洁、更高效。  

包含但不限于以下功能：

- 🚀 异步加载与渲染图片（基于 [Kingfisher](https://github.com/onevcat/Kingfisher)）
- 🎨 常用 UIKit / SwiftUI 扩展
- 🧩 PromiseKit 异步封装
- 📐 SnapKit 布局辅助
- 💬 常用工具函数与类型扩展

---

## 🧪 示例项目

要运行示例 Demo，请执行以下命令：

```bash
git clone https://github.com/Markanney/toolBoxKit.git
cd Example
pod install
open toolBoxKit.xcworkspace

```

---

## ⚙️ 系统要求
|环境|最低要求|
|---|---|
|iOS|13.0+|
|Swift|5.0+|

---

## 📦 安装
1.使用 CocoaPods
*在你的 Podfile 中添加：
pod 'toolBoxKit'

*或指定版本：
pod 'toolBoxKit', '~> 1.0.0'

*然后执行：
pod install

2.使用 Swift Package Manager（可选）

*你也可以通过 SPM 添加：
i.在 Xcode 中打开
File → Add Packages → 输入仓库地址：
https://github.com/Markanney/toolBoxKit.git

ii.选择版本（如 1.0.0）并添加依赖。

---

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

DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
/// 自动防抖后清除
   Debouncer.shared.debounce {
      self.navigationController?.pushViewController(vi, animated: false)
   }
}
```

---

## 📜 License
toolBoxKit is available under the MIT License.  
See the LICENSE file for more information.  

This library uses the following open-source components:  
- Kingfisher — MIT License  
- PromiseKit — MIT License  
- SnapKit — MIT License

---

## ❤️ Support
如果这个库对你有帮助，请给它一个 ⭐️ Star 支持一下！
你的支持是我持续更新的动力 💪

