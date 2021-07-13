//
//  CarauselCollectionView.swift
//  Shinto
//
//  Created by Hitarth Bhatt on 13/07/21.
//

import UIKit

class CarauselCollectionView: UIView {
    
    var images: [String] = ["slideOne", "slideTwo", "slideThree"]
    var selectedIndex: Int = 0
    var timer: Timer?
    
    
    lazy var collectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .horizontal
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout.init())
        collection.setCollectionViewLayout(layout, animated: true)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.delegate = self
        collection.dataSource = self
        collection.backgroundColor = .white
        collection.showsHorizontalScrollIndicator = false
        collection.register(CarauselCollectionCell.self, forCellWithReuseIdentifier: CarauselCollectionCell.reuseID)
        collection.contentInset = UIEdgeInsets(top: 20, left: 20, bottom: 0, right: 10)
        
        return collection
    }()
    
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setupConstraints()
        startAutoScrolling()
        
    }
    
    
    //MARK: View Setup Methods
    
    func setupView() {
        
        addSubview(collectionView)
        
    }
    
    
    
    func setupConstraints() {
        
        collectionView.pin(to: self)
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    func startAutoScrolling() {
        
        timer = Timer.scheduledTimer(withTimeInterval: 2, repeats: true, block: { _ in
            
            self.presentImage(index: self.selectedIndex + 1)
        })
        
    }
    
    
    func presentImage(index: Int) {
        let index = images.count > index ? index : 0
        guard selectedIndex != index else { return }
        selectedIndex = index
        collectionView.scrollToItem(at: IndexPath(item: selectedIndex, section: 0), at: .centeredHorizontally, animated: true)
    }
    
    
    
    
}








extension CarauselCollectionView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CarauselCollectionCell.reuseID, for: indexPath) as! CarauselCollectionCell
        
        cell.carauselImage.image = UIImage(named: images[indexPath.row])
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: Sizes.screenWidth - 40, height: 220)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    
    
    
}
