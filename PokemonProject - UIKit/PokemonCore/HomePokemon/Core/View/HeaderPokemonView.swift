//
//  HeaderPokemonView.swift
//  PokemonProject - UIKit
//
//  Created by Leonardo Campanher on 17/05/24.
//

import UIKit
import SnapKit

class HeaderPokemonView: UIView, CodedView {
    private lazy var gradient: CAGradientLayer = {
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.clear.cgColor, UIColor.white.cgColor]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 0, y: 1)
        return gradient
    }()
    
    private lazy var imageBackground: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "leefBackground")
        return image
    }()
    
    private lazy var numberPokemonTitle: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.textColor = .white
        return label
    }()
    
    private lazy var numberPokemonDescription: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    private lazy var typePokemonTitle: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.textColor = .white
        return label
    }()
    
    private lazy var typePokemonDescription: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    private lazy var centerPokemonTitle: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 36, weight: .bold)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    private lazy var centerPokemonDescription: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24, weight: .regular)
        label.textColor = .white
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.clipsToBounds = true
        return label
    }()
    
    private lazy var textsStackView: UIStackView = {
       let stack = UIStackView(arrangedSubviews: [numberPokemonTitle, numberPokemonDescription, typePokemonTitle, typePokemonDescription, centerPokemonTitle, centerPokemonDescription])
        stack.axis = .vertical
        stack.spacing = 36
        stack.alignment = .leading
        stack.setCustomSpacing(8, after: numberPokemonTitle)
        stack.setCustomSpacing(8, after: typePokemonTitle)
        stack.setCustomSpacing(8, after: centerPokemonTitle)
        return stack
    }()
    
    private lazy var listPokemonButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.setTitle("Ver lista", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 20
        button.layer.masksToBounds = true
        return button
    }()
    
    //MARK: Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradient.frame = imageBackground.frame
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: CodedView
    func setupView() {
        setupHierarchy()
        setupConstraints()
    }
    
    func setupHierarchy() {
        self.addSubviews(imageBackground)
        imageBackground.layer.addSublayer(gradient)
        imageBackground.addSubview(textsStackView)
        imageBackground.addSubview(listPokemonButton)
    }
    
    func setupConstraints() {
        imageBackground.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
        
        textsStackView.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(24)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().inset(16)
        }
        
        listPokemonButton.snp.makeConstraints { make in
            make.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom).inset(16)
            make.leading.trailing.equalTo(textsStackView)
            make.width.equalTo(textsStackView.snp.width)
            make.height.equalTo(52)
        }
    }
    
    //MARK: Func's
    public func configureBackgroundImage(image: String) {
        self.imageBackground.image = UIImage(named: image)
    }
    
    public func configureTextsHomeView(numberTitle: String,
                                       numberDecription: String,
                                       typeTitle: String,
                                       typeDescription: String,
                                       centerTitle: String,
                                       centerDescription: String) {
        
        self.numberPokemonTitle.text = numberTitle
        self.numberPokemonDescription.text = numberDecription
        self.typePokemonTitle.text = typeTitle
        self.typePokemonDescription.text = typeDescription
        self.centerPokemonTitle.text = centerTitle
        self.centerPokemonDescription.text = centerDescription
    }
}
