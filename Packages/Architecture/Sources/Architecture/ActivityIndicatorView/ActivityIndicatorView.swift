//
//  ActivityIndicatorView.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 11/12/21.
//

import UIKit
import Utilities

public class ActivityIndicatorView: UIActivityIndicatorView {
    lazy var blurEffect = UIBlurEffect(style: .regular)
    lazy var blurEffectView = UIVisualEffectView(effect: blurEffect)
        .set(\.frame, bounds)
        .set(\.autoresizingMask, [.flexibleWidth, .flexibleHeight])

    public override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupView()
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func setupView() {
        layer.zPosition = CGFloat(Float.greatestFiniteMagnitude)
        addBlurEffect()
    }

    private func addBlurEffect() {
        addSubview(blurEffectView)
        sendSubviewToBack(blurEffectView)
    }
}
// MARK: - Activity Indicator Player
extension ActivityIndicatorView {
     var start: Void {
        startAnimating()
    }

    var stop: Void {
        stopAnimating()
    }
}
