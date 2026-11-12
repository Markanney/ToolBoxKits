import UIKit

final class LoadingHUDView: UIView {
    private let dots = CAGradientLayer()
    private let statusLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)

        backgroundColor = .clear
        isAccessibilityElement = true

        let spinner = UIView()
        let spinnerSize: CGFloat = 44
        let dotSize: CGFloat = 13
        let dotOffsets: [CGFloat] = [7, 24]
        let dotPath = UIBezierPath()
        for y in dotOffsets {
            for x in dotOffsets {
                dotPath.append(UIBezierPath(ovalIn: CGRect(x: x, y: y, width: dotSize, height: dotSize)))
            }
        }

        dots.frame = CGRect(x: 0, y: 0, width: spinnerSize, height: spinnerSize)
        dots.startPoint = .zero
        dots.endPoint = CGPoint(x: 1, y: 1)

        let mask = CAShapeLayer()
        mask.frame = dots.bounds
        mask.path = dotPath.cgPath
        dots.mask = mask
        spinner.layer.addSublayer(dots)

        let spinnerBackground = UIView()
        let backgroundSize: CGFloat = 68
        spinnerBackground.backgroundColor = UIColor.white.withAlphaComponent(0.8)
        spinnerBackground.layer.cornerRadius = 12
        spinnerBackground.addSubview(spinner)

        statusLabel.font = .systemFont(ofSize: 14)
        statusLabel.textAlignment = .center
        statusLabel.numberOfLines = 0
        statusLabel.isHidden = true

        let stack = UIStackView(arrangedSubviews: [spinnerBackground, statusLabel])
        stack.axis = .vertical
        stack.alignment = .center
        stack.spacing = 8
        addSubview(stack)

        stack.translatesAutoresizingMaskIntoConstraints = false
        spinnerBackground.translatesAutoresizingMaskIntoConstraints = false
        spinner.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stack.centerXAnchor.constraint(equalTo: centerXAnchor),
            stack.centerYAnchor.constraint(equalTo: centerYAnchor),
            stack.leadingAnchor.constraint(greaterThanOrEqualTo: safeAreaLayoutGuide.leadingAnchor, constant: 24),
            stack.trailingAnchor.constraint(lessThanOrEqualTo: safeAreaLayoutGuide.trailingAnchor, constant: -24),
            spinnerBackground.widthAnchor.constraint(equalToConstant: backgroundSize),
            spinnerBackground.heightAnchor.constraint(equalToConstant: backgroundSize),
            spinner.centerXAnchor.constraint(equalTo: spinnerBackground.centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: spinnerBackground.centerYAnchor),
            spinner.widthAnchor.constraint(equalToConstant: spinnerSize),
            spinner.heightAnchor.constraint(equalToConstant: spinnerSize)
        ])
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(text: String?, tintColor: UIColor, textColor: UIColor, allowsInteraction: Bool) {
        dots.colors = [tintColor.withAlphaComponent(0.4).cgColor, tintColor.cgColor]
        statusLabel.text = text
        statusLabel.textColor = textColor
        statusLabel.isHidden = text?.isEmpty != false
        accessibilityLabel = statusLabel.isHidden ? "加载中" : text
        isUserInteractionEnabled = !allowsInteraction
    }

    override func didMoveToWindow() {
        super.didMoveToWindow()

        guard window != nil, !UIAccessibility.isReduceMotionEnabled else {
            dots.removeAnimation(forKey: "rotation")
            return
        }

        let quarterTurn = Double.pi / 2
        let rotation = CAKeyframeAnimation(keyPath: "transform.rotation.z")
        rotation.values = [0, quarterTurn, 2 * quarterTurn, 3 * quarterTurn, 4 * quarterTurn]
        rotation.timingFunctions = Array(repeating: CAMediaTimingFunction(name: .easeInEaseOut), count: 4)
        rotation.duration = 1.2
        rotation.repeatCount = .infinity
        dots.add(rotation, forKey: "rotation")
    }
}
