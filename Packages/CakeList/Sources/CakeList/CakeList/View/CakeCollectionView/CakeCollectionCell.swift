//
//  File.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 12/12/21.
//

import UIKit
import RxSwift

import UserInterface

final class CakeCollectionViewCell: UICollectionViewCell {
    public var representable: CakeRepresentable? {
        didSet {
            guard let representable = representable else { return }
            set(representable)
        }
    }

    lazy var cakeImageView = UIImageView()
        .set(\.cornerRadius, .cornerRadius)
    lazy var titleLabel = UILabel()
        .set(\.font, .subtitle)
        .set(\.textColor, .second)

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    private func setupView() {
        contentView
            .set(\.backgroundColor, .light)
            .set(\.cornerRadius, .cornerRadius)
            .set(\.isShadow, true)

        addAllSubviews()
        addAllConstraints()
    }

    private func addAllSubviews() {
        contentView.addSubviews([
            cakeImageView,
            titleLabel
        ])
    }

    private func addAllConstraints() {
        cakeImageView.snp.makeConstraints {
            $0.horizontal.top.equalToSuperview().inset(.paddingS)
        }
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(cakeImageView.snp.bottom).offset(.paddingXS)
            $0.horizontal.bottom.equalToSuperview().inset(.paddingS)
        }
    }
    
    private func set(_ representable: CakeRepresentable) {
        titleLabel.text = representable.title

        guard let urlRequest: URLRequest = URLRequest(urlString: representable.imageUrl) else { return }
        URLSession.shared.rx
            .response(request: urlRequest)
            .subscribe(on: ConcurrentMainScheduler.instance)
            .map { UIImage(data: $0.data) }
            .bind(to: cakeImageView.rx.image)
            .disposed(by: rx.disposeBag)
    }
}

private extension CGFloat {
    static let cornerRadius = 6.cgFloat
}
