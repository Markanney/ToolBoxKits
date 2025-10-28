//
//  UIPLabel.swift
//  Pods
//
//  Created by kanney on 2025/10/13.
//

import UIKit

public class UIPLabel: UILabel {
    public var padding: UIEdgeInsets = .zero
    
    public override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: padding))
    }
    
    public  override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        return CGSize(
            width: size.width + padding.left + padding.right,
            height: size.height + padding.top + padding.bottom
        )
    }
    
    public override func sizeThatFits(_ size: CGSize) -> CGSize {
        let adjustedSize = CGSize(
            width: size.width - padding.left - padding.right,
            height: size.height - padding.top - padding.bottom
        )
        let superSize = super.sizeThatFits(adjustedSize)
        return CGSize(
            width: superSize.width + padding.left + padding.right,
            height: superSize.height + padding.top + padding.bottom
        )
    }
}


