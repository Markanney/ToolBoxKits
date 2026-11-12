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
        let application = UIApplication.shared
        let scenes = application.connectedScenes.compactMap { $0 as? UIWindowScene }
        let isVisibleNormalWindow: (UIWindow) -> Bool = { !$0.isHidden && $0.windowLevel == .normal }

        for state in [UIScene.ActivationState.foregroundActive, .foregroundInactive] {
            let foregroundScenes = scenes.filter { $0.activationState == state }
            if let keyWindow = foregroundScenes.compactMap(\.keyWindow).first(where: isVisibleNormalWindow) {
                return keyWindow
            }
            if let window = foregroundScenes.lazy.flatMap(\.windows).first(where: isVisibleNormalWindow) {
                return window
            }
        }

        // Support hosts that still manage their window through UIApplicationDelegate.
        guard scenes.isEmpty, let window = application.delegate?.window ?? nil, isVisibleNormalWindow(window) else {
            return nil
        }
        return window
    }
}
