//
//  ChoosePokemonViewController.swift
//  PokemonProject - UIKit
//
//  Created by Leonardo Campanher on 20/05/24.
//

import UIKit

class ChoosePokemonViewController: UIViewController, CodedView {
    
    //MARK: Var's
    var interactor: ChoosePokemonInteractor?
    var coordinator: (Coordinator & ChoosePokemonCoordinatable)?
    
    init(interactor: ChoosePokemonInteractor?, coordinator: (Coordinator & ChoosePokemonCoordinatable)?) {
        self.interactor = interactor
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Components
    
    private lazy var stackView1: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [waterButton, fireButton])
        stack.axis = .horizontal
        stack.spacing = 4
        return stack
    }()
    
    private lazy var stackView2: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [thunderButton, leefButton])
        stack.axis = .horizontal
        stack.spacing = 4
        return stack
    }()
    
    private lazy var stackView3: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [ghostButton])
        stack.axis = .horizontal
        stack.spacing = 4
        return stack
    }()
    
    private lazy var allStackViews: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [stackView1, stackView2, stackView3])
        stack.axis = .vertical
        stack.alignment = .leading
        stack.spacing = 4
        return stack
    }()
    
    private lazy var waterButton: UIButton = {
        let button = UIButton()
        button.tag = 1
        button.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        button.setImage(UIImage(named: "waterType"), for: .normal)
        button.addTarget(self, action: #selector(setPokemonType), for: .touchUpInside)
        return button
    }()
    
    private lazy var fireButton: UIButton = {
        let button = UIButton()
        button.tag = 2
        button.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        button.setImage(UIImage(named: "fireType"), for: .normal)
        button.addTarget(self, action: #selector(setPokemonType), for: .touchUpInside)
        return button
    }()
    
    private lazy var thunderButton: UIButton = {
        let button = UIButton()
        button.tag = 3
        button.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        button.setImage(UIImage(named: "thunderType"), for: .normal)
        button.addTarget(self, action: #selector(setPokemonType), for: .touchUpInside)
        return button
    }()
    
    private lazy var ghostButton: UIButton = {
        let button = UIButton()
        button.tag = 4
        button.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        button.setImage(UIImage(named: "ghostType"), for: .normal)
        button.addTarget(self, action: #selector(setPokemonType), for: .touchUpInside)
        return button
    }()
    
    
    private lazy var leefButton: UIButton = {
        let button = UIButton()
        button.tag = 5
        button.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        button.setImage(UIImage(named: "leefType"), for: .normal)
        button.addTarget(self, action: #selector(setPokemonType), for: .touchUpInside)
        return button
    }()
    
    private lazy var allButtonsForConstraint: [UIButton] = [waterButton, fireButton, thunderButton, leefButton, ghostButton]
    private lazy var alImages: [String] = ["waterType", "fireType", "thunderType", "leefType", "ghostType"]
    
    //MARK: Func's
    @objc func setPokemonType(_ sender: UIButton) {
        var type: String
        switch sender.tag {
        case 1:
            type = "waterType"
        case 2:
            type = "fireType"
        case 3:
            type = "thunderType"
        case 4:
            type = "ghostType"
        case 5:
            type = "leefType"
        default:
            type = "nil"
        }
        let response = ChoosePokemonViewModel.Request.init(image: type)
        interactor?.setTypePokemon(response: response)
    }
    
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.backButtonTitle = ""
        
        setupView()
    }
    
    func setupView() {
        setupHierarchy()
        setupConstraints()
        
        view.backgroundColor = .secondarySystemBackground
    }
    
    func setupHierarchy() {
        view.addSubview(allStackViews)
    }
    
    func setupConstraints() {
        allStackViews.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
        for eachButton in allButtonsForConstraint {
            eachButton.snp.makeConstraints { make in
                make.height.equalTo(100)
                make.width.equalTo(100)
            }
        }
        
    }
}
