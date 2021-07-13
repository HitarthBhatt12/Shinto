//
//  CustomCategory.swift
//  Shinto
//
//  Created by Hitarth Bhatt on 13/07/21.
//

import UIKit

class CustomCategory: UIView {
    
    var categoryProtocol: CategoryProtocol?
    var selectorWidth: CGFloat!
    
    let stackView: UIStackView = {
       let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        
        return stack
    }()
    
    
    let selector: UIView = {
       let s = UIView()
        s.translatesAutoresizingMaskIntoConstraints = false
        s.backgroundColor = .systemPink
        s.layer.cornerRadius = 10
        
        return s
    }()
    
    
    let buttonOne: UIButton = {
       let btn = UIButton()
        btn.setTitle("Ice Cream", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(buttonOnePressed), for: .touchUpInside)
        
        return btn
    }()
    
    
    let buttonTwo: UIButton = {
       let btn = UIButton()
        btn.setTitle("Cake", for: .normal)
        btn.setTitleColor(.lightGray, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(buttonTwoPressed), for: .touchUpInside)
        
        return btn
    }()
    
    let buttonThree: UIButton = {
       let btn = UIButton()
        btn.setTitle("Sweets", for: .normal)
        btn.setTitleColor(.lightGray, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(buttonThreePressed), for: .touchUpInside)
        
        return btn
    }()
    
    let buttonfour: UIButton = {
       let btn = UIButton()
        btn.setTitle("Doodle", for: .normal)
        btn.setTitleColor(.lightGray, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(buttonFourPressed), for: .touchUpInside)
        
        return btn
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        setupView()
        setupConstraints()
        
    }
    
    
    //MARK: View Setup Methods
    
    func setupView() {
        addSubview(selector)
        addSubview(stackView)
        
        stackView.addArrangedSubview(buttonOne)
        stackView.addArrangedSubview(buttonTwo)
        stackView.addArrangedSubview(buttonThree)
        stackView.addArrangedSubview(buttonfour)
        
        selectorWidth = Sizes.screenWidth / 5
        
    }
    
    
    
    func setupConstraints() {
        
        stackView.pin(to: self)
        
        NSLayoutConstraint.activate([
        
//            selector.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            selector.centerXAnchor.constraint(equalTo: buttonOne.centerXAnchor),
            selector.heightAnchor.constraint(equalToConstant: 2),
            selector.widthAnchor.constraint(equalToConstant: selectorWidth),
            selector.bottomAnchor.constraint(equalTo: bottomAnchor)
        
        ])
        
        
    }
    
    
    
    
    
    //MARK: Selection Actions
    
    
    @objc func buttonOnePressed() {
        UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 2, initialSpringVelocity: 1, options: .curveEaseInOut) {
            
            self.selector.center.x = self.buttonOne.center.x
            
            self.buttonOne.setTitleColor(.black, for: .normal)
            self.buttonTwo.setTitleColor(.lightGray, for: .normal)
            self.buttonThree.setTitleColor(.lightGray, for: .normal)
            self.buttonfour.setTitleColor(.lightGray, for: .normal)
            
            self.buttonOne.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
            self.buttonTwo.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .regular)
            self.buttonThree.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .regular)
            self.buttonfour.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .regular)
            
            self.categoryProtocol?.didSelectCategory(with: IceCream)
            
        }

    }
    
    
    
    @objc func buttonTwoPressed() {
        UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 2, initialSpringVelocity: 1, options: .curveEaseInOut) {
            
            self.selector.center.x = self.buttonTwo.center.x
            
            self.buttonOne.setTitleColor(.lightGray, for: .normal)
            self.buttonTwo.setTitleColor(.black, for: .normal)
            self.buttonThree.setTitleColor(.lightGray, for: .normal)
            self.buttonfour.setTitleColor(.lightGray, for: .normal)
            
            self.buttonOne.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .regular)
            self.buttonTwo.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
            self.buttonThree.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .regular)
            self.buttonfour.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .regular)
            
            
            self.categoryProtocol?.didSelectCategory(with: Cakes)
        }

    }
    
    
    
    @objc func buttonThreePressed() {
        UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 2, initialSpringVelocity: 1, options: .curveEaseInOut) {
            
            self.selector.center.x = self.buttonThree.center.x
            
            self.buttonOne.setTitleColor(.lightGray, for: .normal)
            self.buttonTwo.setTitleColor(.lightGray, for: .normal)
            self.buttonThree.setTitleColor(.black, for: .normal)
            self.buttonfour.setTitleColor(.lightGray, for: .normal)
            
            self.buttonOne.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .regular)
            self.buttonTwo.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .regular)
            self.buttonThree.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
            self.buttonfour.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .regular)
            
            
            self.categoryProtocol?.didSelectCategory(with: Sweets)
            
        }

    }
    
    
    
    @objc func buttonFourPressed() {
        UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 2, initialSpringVelocity: 1, options: .curveEaseInOut) {
            
            self.selector.center.x = self.buttonfour.center.x
            
            self.buttonOne.setTitleColor(.lightGray, for: .normal)
            self.buttonTwo.setTitleColor(.lightGray, for: .normal)
            self.buttonThree.setTitleColor(.lightGray, for: .normal)
            self.buttonfour.setTitleColor(.black, for: .normal)
            
            self.buttonOne.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .regular)
            self.buttonTwo.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .regular)
            self.buttonThree.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .regular)
            self.buttonfour.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
            
            self.categoryProtocol?.didSelectCategory(with: Doodles)
            
        }

    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
