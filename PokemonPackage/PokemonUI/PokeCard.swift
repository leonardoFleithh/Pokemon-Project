//
//  PokeCard.swift
//  PokemonProject - UIKit
//
//  Created by Leonardo Campanher on 14/05/24.
//

import Foundation
import UIKit
import SnapKit

final class PokeCard: UIView, CodedView {
    
    private let cardView: UIView = {
        let view = UIView()
        view.backgroundColor = .secondarySystemBackground
        view.alpha = 0.9
        view.layer.cornerRadius = 15
        view.layer.borderWidth = 1.0
        view.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        view.clipsToBounds = true
        return view
    }()
    
    private let image: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.image = nil
        image.layer.cornerRadius = 15
        image.clipsToBounds = true
        return image
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.text = ""
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.text = ""
        return label
    }()
    
    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 16
        return stack
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        setupHierarchy()
        setupConstraints()
        
    }
    
    func setupHierarchy() {
        self.addSubview(cardView)
        
        cardView.addSubview(stackView)
        stackView.addSubviews(image, titleLabel, subtitleLabel)
    }
    
    func setupConstraints() {
        cardView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        stackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        image.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().inset(16)
            make.height.equalTo(cardView.snp.height).multipliedBy(0.45)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(image.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(16)
            make.height.equalTo(27)
        }
        
        subtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom)
            make.leading.equalTo(cardView.snp.leading).offset(16)
            make.height.equalTo(27)
        }
    }
    
    public func configure(image: UIImage?, title: String, subtitle: String) {
        self.image.image = image
        self.titleLabel.text = title
        self.subtitleLabel.text = subtitle
    }
}
