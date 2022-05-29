//
//  ProductsViewController.swift
//  ArbuzApp
//
//  Created by Akniyet Turdybay on 28.05.2022.
//

import UIKit
import SnapKit

class ProductsViewController: UIViewController {

    
    
    private let collectionView: UICollectionView = {
        let collectionLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionLayout)
        collectionLayout.scrollDirection = .vertical
        collectionView.register(ProductCell.self, forCellWithReuseIdentifier: ProductCell.reuseId)
        return collectionView
    }()
    
    private let rowLabel: UILabel = {
        let rowLabel = UILabel()
        rowLabel.text = "Ряд 1"
        rowLabel.font = UIFont.boldSystemFont(ofSize: 20)
        
        return rowLabel
    }()
    
    private let products = [Product(name: "Арбуз", imageName: "arbuz", weight: 6.7, price: 600, status: .thwarted, description: "Арбуз – это однолетнее травянистое растение семейства тыквенные, бахчевая культура. Имеет тонкие, длинные ползучие стебли, длиной до 4 м и более. "),
                            Product(name: "Арбуз", imageName: "arbuz", weight: 6.7, price: 600, status: .unripe, description: "Арбуз – это однолетнее травянистое растение семейства тыквенные, бахчевая культура. Имеет тонкие, длинные ползучие стебли, длиной до 4 м и более. "),
                            Product(name: "Арбуз", imageName: "arbuz", weight: 6.7, price: 600, status: .ripe, description: "Арбуз – это однолетнее травянистое растение семейства тыквенные, бахчевая культура. Имеет тонкие, длинные ползучие стебли, длиной до 4 м и более. "),
                            Product(name: "Арбуз", imageName: "arbuz", weight: 6.7, price: 600, status: .ripe, description: "Арбуз – это однолетнее травянистое растение семейства тыквенные, бахчевая культура. Имеет тонкие, длинные ползучие стебли, длиной до 4 м и более. "),
                            Product(name: "Арбуз", imageName: "arbuz", weight: 6.7, price: 600, status: .ripe, description: "Арбуз – это однолетнее травянистое растение семейства тыквенные, бахчевая культура. Имеет тонкие, длинные ползучие стебли, длиной до 4 м и более. ")]

    override func viewDidLoad() {
        super.viewDidLoad()

        configureNavBar()
        configureUI()
        setUpRow()
        setUpCollectionView()

        
        
    }
    
    private func configureNavBar(){
        navigationController?.navigationBar.isTranslucent = false
        navigationItem.title = "Arbuz.kz"
    }
    
    
    
    private func setUpRow(){
        view.addSubview(rowLabel)
        rowLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(15)
            $0.leading.equalToSuperview().inset(15)
        }
    }
    
    private func configureUI(){
        collectionView.delegate = self
        collectionView.dataSource = self
        view.addSubview(collectionView)
    }
    
    private func setUpCollectionView(){
        collectionView.snp.makeConstraints {
            $0.top.equalTo(rowLabel.snp.bottom).offset(20)
            $0.trailing.leading.equalToSuperview().inset(15)
            $0.bottom.equalToSuperview()
        }
    }


}

extension ProductsViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCell.reuseId, for: indexPath) as! ProductCell
        cell.configure(product: products[indexPath.row])
        return cell
    }
    
}

extension ProductsViewController: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let productDetailVC = ProductDetailViewController()
        productDetailVC.product = products[indexPath.row]
        self.present(productDetailVC, animated: true)
        
    }
    
}

extension ProductsViewController: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.size.width / 2 - 20, height: view.frame.size.width / 2 + 20)
    }
}


