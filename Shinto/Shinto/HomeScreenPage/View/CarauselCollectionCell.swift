//
//  CarauselCollectionCell.swift
//  Shinto
//
//  Created by Hitarth Bhatt on 13/07/21.
//

import UIKit

class CarauselCollectionCell: UICollectionViewCell {
    
    
    static var reuseID: String = "CarauselCollectionCell"
    
    let carauselImage: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleToFill
        img.clipsToBounds = true
        img.layer.cornerRadius = 10
        
        return img
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setupConstraints()
        
    }
    
    
    //MARK: View Setup Methods
    
    func setupView() {
        
        clipsToBounds = true
        
        addSubview(carauselImage)
        
    }
    
    
    
    func setupConstraints() {
        
        carauselImage.pin(to: self)
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
