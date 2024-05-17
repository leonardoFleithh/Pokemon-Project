//
//  HeaderHomePokemonCollectionViewCell.swift
//  PokemonProject - UIKit
//
//  Created by Leonardo on 16/05/24.
//

import UIKit
import SnapKit

class HeaderHomePokemonCollectionViewCell: UICollectionReusableView {
    
    static let identifier = "id"
    
    private lazy var backgroundImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "shadowBackground")
        return image
    }()
    
    private lazy var gradient: CAGradientLayer = {
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.clear, UIColor.white]
        gradient.frame = self.frame
        gradient.startPoint = CGPoint(x: 0, y: 0.05)
        gradient.endPoint = CGPoint(x: 1, y: 0.95)
        return gradient
    }()
    
    override func prepareForReuse() {
        self.backgroundImage.image = nil
    }
    
    public func setupUI() {
        self.addSubviews(backgroundImage)
        self.layer.addSublayer(gradient)
        setupConstraints()
    }
    
    private func setupConstraints() {
        backgroundImage.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
}
