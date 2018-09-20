//
//  ExploreTableViewCell.swift
//  DoorDashLite
//
//  Created by Lech H. Conde on 17/09/2018.
//  Copyright © 2018 Lech H. Conde. All rights reserved.
//

import UIKit
import SnapKit
import Kingfisher

class ExploreTableViewCell: UITableViewCell {
    private let defaultVerticalMargin: CGFloat = 25.0
    private let defaultHorizontalMargin: CGFloat = 10.0
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: UIFont.labelFontSize)
        label.numberOfLines = 0
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: UIFont.labelFontSize - 1)
        label.numberOfLines = 0
        label.textColor = .lightGray
        return label
    }()
    
    
    lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: UIFont.labelFontSize - 2)
        label.textAlignment = .right
        label.textColor = .darkGray
        return label
    }()
    
    lazy var deliveryFeeLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: UIFont.labelFontSize - 2)
        label.textColor = .darkGray
        return label
    }()
    
    private lazy var coverImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    public override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpViews()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func setUpViews() {
        coverImageView.setContentHuggingPriority(.required, for: .horizontal)
        coverImageView.setContentCompressionResistancePriority(.required, for: .horizontal)
        
        let deliveryStackView =  UIStackView(arrangedSubviews: [deliveryFeeLabel, statusLabel])
        deliveryStackView.axis = .horizontal
        deliveryStackView.alignment = .fill
        deliveryStackView.distribution = .fillProportionally
        
        let verticalStackView = UIStackView(arrangedSubviews: [titleLabel, descriptionLabel, deliveryStackView])
        verticalStackView.axis = .vertical
        verticalStackView.alignment = .fill
        verticalStackView.distribution = .fillProportionally
        verticalStackView.spacing = 5
        
        let horizontalStackView = UIStackView(arrangedSubviews: [coverImageView, verticalStackView])
        horizontalStackView.axis = .horizontal
        horizontalStackView.alignment = .fill
        horizontalStackView.distribution = .fillProportionally
        horizontalStackView.spacing = 15
        
        addSubview(horizontalStackView)
        horizontalStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(defaultHorizontalMargin)
            make.bottom.equalToSuperview().inset(defaultHorizontalMargin)
            make.leading.equalToSuperview().offset(defaultHorizontalMargin)
            make.trailing.equalToSuperview().inset(defaultHorizontalMargin)
        }
        
        coverImageView.snp.makeConstraints { make in
            make.width.equalTo(90)
        }
    }
    
    func configure(with store: Store) {
        titleLabel.text = store.name
        descriptionLabel.text = store.description
        if store.deliveryFee > 0, let deliveryFee = store.deliveryFee.currency {
            deliveryFeeLabel.text = deliveryFee + " delivery"
        } else {
            deliveryFeeLabel.text = "Free delivery"
        }
        statusLabel.text = store.status
        if let url = URL(string: store.coverImgUrl) {
            coverImageView.kf.setImage(with: url)
        }
    }
}

extension ExploreTableViewCell: ReusableView { }
