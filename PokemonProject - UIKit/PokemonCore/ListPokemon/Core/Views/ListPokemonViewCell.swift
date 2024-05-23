//
//  ListPokemonView.swift
//  PokemonProject - UIKit
//
//  Created by Leonardo Campanher on 23/05/24.
//

import UIKit
import SnapKit

class ListPokemonViewCell: UIView, CodedView {
    //MARK: Var's
    private lazy var mainView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 15
        view.layer.masksToBounds = true
        return view
    }()
    
    private lazy var circleView: UIView = {
        let view = UIView()
        view.layer.cornerCurve = .circular
        view.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        view.backgroundColor = .gray
        view.addSubview(imageCircleView)
        return view
    }()
    
    private lazy var imageCircleView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.layer.cornerCurve = .circular
        image.frame = CGRect(x: 0, y: 0, width: 75, height: 75)
        image.image = nil
        return image
    }()
    
    private lazy var pokemonName: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 24, weight: .regular)
        label.text = "No name"
        return label
    }()
    
    private lazy var rightArrowView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        image.image = UIImage(named: "angleRight")
        return image
    }()
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [circleView, pokemonName])
        stack.axis = .horizontal
        stack.spacing = 16
        return stack
    }()
    

    //MARK: Setup
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupView()
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
        self.addSubview(mainView)
        mainView.addSubviews(stackView, rightArrowView)
    }
    
    func setupConstraints() {
        mainView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
        
        stackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalToSuperview().offset(16)
            make.bottom.equalToSuperview().inset(10)
        }
        
        rightArrowView.snp.makeConstraints { make in
            make.centerY.equalTo(stackView)
            make.trailing.equalToSuperview().inset(10)
        }
        
    }
    
    public func configure(image: String, pokemonName: String) {
        self.imageCircleView.image = UIImage(named: image)
        self.pokemonName.text = pokemonName
    }
}
