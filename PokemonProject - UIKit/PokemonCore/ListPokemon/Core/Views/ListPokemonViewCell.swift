//
//  ListPokemonView.swift
//  PokemonProject - UIKit
//
//  Created by Leonardo Campanher on 23/05/24.
//

import UIKit

class ListPokemonViewCell: UITableViewCell, CodedView {
    //MARK: Var's
    static let identifier = "id"
    
    private lazy var mainView: UIView = {
        let view = UIView()
        view.backgroundColor = .secondarySystemBackground
        view.layer.cornerRadius = 15
        view.layer.masksToBounds = true
        return view
    }()
    
    private lazy var imageCircleView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleToFill
        image.layer.cornerRadius = 15
        image.layer.masksToBounds = true
        image.image = UIImage(named: "thunderBackground")
        return image
    }()
    
    private lazy var pokemonName: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 24, weight: .regular)
        label.text = "Pikachu"
        return label
    }()
    
    private lazy var rightArrowView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        image.image = UIImage(named: "angleRight")
        return image
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
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
        mainView.addSubviews(imageCircleView, pokemonName, rightArrowView)
    }
    
    func setupConstraints() {
        mainView.snp.makeConstraints { make in
            
            make.top.leading.trailing.bottom.equalToSuperview()
        }
        
        imageCircleView.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().offset(16)
            make.bottom.equalToSuperview().inset(16)
            make.width.equalTo(100)
        }
        
        pokemonName.snp.makeConstraints { make in
            make.centerY.equalTo(imageCircleView.snp.centerY)
            make.leading.equalTo(imageCircleView.snp.trailing).offset(16)
        }
        
        rightArrowView.snp.makeConstraints { make in
            make.centerY.equalTo(imageCircleView.snp.centerY)
            make.trailing.equalTo(mainView.snp.trailing).inset(16)
        }
        
    }
    
    public func configureCell(image: String, pokemonName: String) {
        self.imageCircleView.image = UIImage(named: image)
        self.pokemonName.text = pokemonName
    }
}

#Preview {
    ListPokemonViewCell()
}
