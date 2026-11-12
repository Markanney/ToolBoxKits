import UIKit

public enum LoadingHUD {
    @MainActor private static let loadingView = LoadingHUDView(frame: .zero)
    @MainActor private static var requestCount = 0
    @MainActor private static var tintColor = UIColor.systemBlue
    @MainActor private static var textColor = UIColor(white: 0.2, alpha: 1)

    public static func configure(tintColor: UIColor, textColor: UIColor) {
        DispatchQueue.main.async {
            Self.tintColor = tintColor
            Self.textColor = textColor
        }
    }

    public static func show(_ text: String? = nil, allowsInteraction: Bool = false) {
        DispatchQueue.main.async {
            requestCount += 1
            guard let window = displayWindow else { return }

            loadingView.configure(text: text, tintColor: tintColor, textColor: textColor, allowsInteraction: allowsInteraction)
            if loadingView.superview === window {
                window.bringSubviewToFront(loadingView)
            } else {
                loadingView.frame = window.bounds
                loadingView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
                window.addSubview(loadingView)
            }
        }
    }

    public static func hide() {
        DispatchQueue.main.async {
            guard requestCount > 0 else { return }
            requestCount -= 1
            if requestCount == 0 {
                loadingView.removeFromSuperview()
            }
        }
    }

    @MainActor private static var displayWindow: UIWindow? {
        let windows: [UIWindow]
        if #available(iOS 13.0, *) {
            let scenes = UIApplication.shared.connectedScenes.compactMap { $0 as? UIWindowScene }
            let foregroundWindows = scenes.filter {
                $0.activationState == .foregroundActive || $0.activationState == .foregroundInactive
            }.flatMap(\.windows)
            windows = foregroundWindows.isEmpty ? UIApplication.shared.windows : foregroundWindows
        } else {
            windows = UIApplication.shared.windows
        }
        return windows.first { $0.isKeyWindow && $0.windowLevel == .normal }
            ?? windows.first { !$0.isHidden && $0.windowLevel == .normal }
    }
}
