//
//  ProductCell.swift
//  ArbuzApp
//
//  Created by Akniyet Turdybay on 28.05.2022.
//

import UIKit

class ProductCell: UICollectionViewCell {
    
    static let reuseId = "ProductCell"
    
    private var imgName: String = ""
    private var pdName: String = ""
    private var pdWeight: Float = 0
    private var pdPrice: Int = 0
    private var pdStatus: Product.Status = .ripe
    private var pdDesription: String = ""
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 15
        return imageView
    }()
    
    private let productName: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    private let productPrice: UILabel = {
        let price = UILabel()
        price.font = UIFont.systemFont(ofSize: 20)
        price.textColor = .label
        return price
    }()

    private let productStatus: UILabel = {
        let status = UILabel()
        status.textColor = .label
        return status
    }()
    
    private let productWeight: UILabel = {
        let weight = UILabel()
        weight.font = UIFont.systemFont(ofSize: 15)
//        weight.textColor = .
        return weight
    }()
    
    private let addCart: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "cart"), for: .normal)
        button.addTarget(self, action: #selector(addToCart), for: .touchUpInside)
        button.backgroundColor = .systemGreen
        button.tintColor = .white
        button.layer.cornerRadius = 15
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layoutUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func addToCart(){
        addCart.setImage(UIImage(systemName: "cart.fill"), for: .normal)
        let cartVC = CartViewController()
        let item = Product(name: self.pdName, imageName: self.imgName, weight: self.pdWeight, price: self.pdPrice, status: self.pdStatus, description: self.pdDesription)
        cartVC.addCell(product: item)
//        cartVC.cartProducts.insert(item, at: 0)
//        cartVC.tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: .top)
//
//        cartVC.tableView.delegate//        cartVC.cartProducts.append(item)
    }
    
    
    
    override func layoutSubviews() {
        imageView.layer.masksToBounds = true
        
        addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.width.equalTo(contentView.frame.width)
            make.height.equalTo(contentView.frame.width / 1.5)
        }
        
        addSubview(productName)
        productName.snp.makeConstraints {
            $0.trailing.leading.equalToSuperview().inset(10)
            $0.top.equalTo(imageView.snp.bottom).offset(10)
        }
        addSubview(productWeight)
        productWeight.snp.makeConstraints {
            $0.trailing.leading.equalToSuperview().inset(10)
            $0.top.equalTo(productName.snp.bottom).offset(5)
        }
        addSubview(productPrice)
        productPrice.snp.makeConstraints {
            $0.trailing.leading.equalToSuperview().inset(10)
//            $0.top.equalTo(productWeight.snp.bottom).offset(10)
            $0.bottom.equalToSuperview().inset(14)
        }
        
        addSubview(addCart)
        addCart.snp.makeConstraints {
            $0.width.height.equalTo(50)
            $0.trailing.equalToSuperview().inset(10)
            $0.bottom.equalToSuperview().inset(14)
        }
        
    }
    
    func configure(product: Product){
        imageView.image = UIImage(named: product.imageName)
        productName.text = product.name
        productPrice.text = String(product.price) + "₸/кг"
        productWeight.text = String(product.weight) + "кг"
        productStatus.text = String(product.status.rawValue)
        
        
        imgName = product.imageName
        pdName = product.name
        pdWeight = product.weight
        pdPrice = product.price
        pdStatus = product.status
        pdDesription = product.description
        
    }
    
    private func layoutUI(){
//        contentView.backgroundColor = .systemGray
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.systemGray5.cgColor
        contentView.layer.shadowOpacity = 0.1
        contentView.layer.cornerRadius = 15
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    
}
