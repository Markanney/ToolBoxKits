# 🧰 toolBox

## ✨ 简介

`toolBox` 是一个轻量级 Swift 工具库，收集了常用的开发辅助方法与扩展，  
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
git clone https://github.com/kanney/toolBox.git
cd Example
pod install
open toolBox.xcworkspace

```

---

## ⚙️ 系统要求
|环境|最低要求|
|---|---|
|iOS|13.0+|
|Swift|5.8+|

---

## 📦 安装
1.使用 CocoaPods
*在你的 Podfile 中添加：
pod 'toolBox'

*或指定版本：
pod 'toolBox', '~> 1.0.0'

*然后执行：
pod install

2.使用 Swift Package Manager（可选）

*你也可以通过 SPM 添加：
i.在 Xcode 中打开
File → Add Packages → 输入仓库地址：
https://github.com/kanney/toolBox.git

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

---

## 📜 License
toolBox is available under the MIT License.  
See the LICENSE file for more information.  

This library uses the following open-source components:  
- Kingfisher — MIT License  
- PromiseKit — MIT License  
- SnapKit — MIT License

---

## ❤️ Support
如果这个库对你有帮助，请给它一个 ⭐️ Star 支持一下！
你的支持是我持续更新的动力 💪

