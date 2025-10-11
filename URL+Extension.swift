//
//  URL+Extension.swift
//  Pods
//
//  Created by kanney on 2025/10/11.
//
import Kingfisher

extension URL {
    
    /// 异步获取对应 URL 的图片（使用 Kingfisher）
    ///
    /// 适用于需要异步加载图片并进行渲染的场景。
    /// 调用示例：
    /// ```swift
    /// if let url = URL(string: "https://example.com/demo.png") {
    ///     let image = await url.getImage()
    /// }
    /// ```
    ///
    /// - Returns: 下载成功返回 `UIImage`，失败返回 `nil`。
    public func getImage() async -> UIImage? {
        return await withCheckedContinuation { seal in
            
            KingfisherManager.shared.retrieveImage(with: self) { result in
                switch result {
                case let .success(body):
                    seal.resume(returning: body.image)
                case let .failure(error):
                    
                    print(error.localizedDescription)
                    seal.resume(returning: nil)
                }
            }
        }
    }
}
