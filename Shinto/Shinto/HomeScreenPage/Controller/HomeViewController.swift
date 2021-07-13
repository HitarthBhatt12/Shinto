//
//  HomeViewController.swift
//  Shinto
//
//  Created by Hitarth Bhatt on 13/07/21.
//

import UIKit

class HomeViewController: BaseViewController {

    
    var productData: [TopProduct] = IceCream
    
    lazy var collectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .vertical
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout.init())
        collection.setCollectionViewLayout(layout, animated: true)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.delegate = self
        collection.dataSource = self
        collection.backgroundColor = .white
        collection.showsHorizontalScrollIndicator = false
        collection.showsVerticalScrollIndicator = false
        collection.register(TopProductCell.self, forCellWithReuseIdentifier: TopProductCell.reuseID)
        collection.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 10)
        
        return collection
    }()
    
    
    
    var heyLabel: UILabel = {
        let l = UILabel()
        
        l.translatesAutoresizingMaskIntoConstraints = false
        l.text = "Hey Hitarth"
        l.font = UIFont.systemFont(ofSize: 30, weight: .semibold)
        l.textColor = .black
        
        return l
    }()
    
    
    
    let topProductLabel: UILabel = {
        let l = UILabel()
        
        l.translatesAutoresizingMaskIntoConstraints = false
        l.text = "Top Product"
        l.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        l.textColor = .black
        
        return l
    }()
    
    
    
    var carauselView: CarauselCollectionView = {
       let carausel = CarauselCollectionView()
        carausel.translatesAutoresizingMaskIntoConstraints = false
        
        return carausel
    }()
    
    
    lazy var customCategory: CustomCategory = {
       let cat = CustomCategory()
        cat.translatesAutoresizingMaskIntoConstraints = false
        cat.categoryProtocol = self 
        return cat
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setupView()
        setupConstraints()
        
    }
    
    
    //MARK: View Setup Methods
    
    
    func setupView() {
        
        view.addSubview(heyLabel)
        view.addSubview(collectionView)
        view.addSubview(customCategory)
        view.addSubview(carauselView)
        view.addSubview(topProductLabel)
        
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            heyLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            heyLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            heyLabel.bottomAnchor.constraint(equalTo: carauselView.topAnchor, constant: -5),
            
            
            carauselView.topAnchor.constraint(equalTo: heyLabel.bottomAnchor, constant: 5),
            carauselView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            carauselView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            carauselView.bottomAnchor.constraint(equalTo: topProductLabel.topAnchor, constant: -10),
            carauselView.heightAnchor.constraint(equalToConstant: 240),
            
            
            topProductLabel.topAnchor.constraint(equalTo: carauselView.bottomAnchor, constant: 10),
            topProductLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            topProductLabel.bottomAnchor.constraint(equalTo: customCategory.topAnchor, constant: -5),
            
            customCategory.topAnchor.constraint(equalTo: topProductLabel.bottomAnchor, constant: 5),
            customCategory.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            customCategory.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            customCategory.bottomAnchor.constraint(equalTo: collectionView.topAnchor, constant: -10),
            customCategory.heightAnchor.constraint(equalToConstant: 40),
            
            collectionView.topAnchor.constraint(equalTo: customCategory.bottomAnchor, constant: 10),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
//            collectionView.heightAnchor.constraint(equalToConstant: 250),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            
        ])
    }
    
    
    
}



extension HomeViewController: CategoryProtocol {
    
    func didSelectCategory(with item: [TopProduct]) {
        
        self.productData = item
        self.collectionView.reloadData()
        
    }
    
}








extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productData.count
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopProductCell.reuseID, for: indexPath) as! TopProductCell
     
        cell.imageCarausel.image = UIImage(named: productData[indexPath.row].ProductImage)
        cell.cardView.backgroundColor = UIColor(named: productData[indexPath.row].productBGColor)
        cell.productName.text = productData[indexPath.row].productName
        
        cell.layer.cornerRadius = 10
        
        return cell
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        cell.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        cell.alpha = 0
        UIView.animate(withDuration: 0.85, delay: 0.1 * Double(indexPath.row), usingSpringWithDamping: 1, initialSpringVelocity: 4, options: .curveEaseInOut, animations: {
            cell.transform = .identity
            cell.alpha = 1
        })
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
//        let detailVC = DetailViewController()
//
//        detailVC.ProductData = products[indexPath.row]
//
//        present(detailVC, animated: true)
        
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: Sizes.screenWidth/2 - 30 , height: 220)
    }
    
    
}



















//MARK: SwiftUI Preview Provider

import SwiftUI

struct HomeViewPreview: PreviewProvider {
    
    static var previews: some View {
        
        Group {
            ContainerView()
            ContainerView()
        }
        
    }
    
    
    struct ContainerView: UIViewControllerRepresentable {
        
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<HomeViewPreview.ContainerView>) -> UIViewController {
            
            return UINavigationController(rootViewController: HomeViewController())
            
        }
        
        func updateUIViewController(_ uiViewController: HomeViewPreview.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<HomeViewPreview.ContainerView>) {
            
        }
        
    }
    
}


