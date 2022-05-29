//
//  CartProductCell.swift
//  ArbuzApp
//
//  Created by Akniyet Turdybay on 29.05.2022.
//

import UIKit

//typealias CartProductCellConfigurator = TableCellConfigurator<CartProductCell, Product>

class CartProductCell: UITableViewCell {


//    typealias DataType = Product
    static let reudeId = "cart"
    
    var cartVC = CartViewController()
    
    private let productImage: UIImageView = {
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
    
    private let productWeight: UILabel = {
        let weight = UILabel()
        weight.font = UIFont.systemFont(ofSize: 15)
        return weight
    }()
    
    private let removeProduct: UIButton = {
       let button = UIButton()
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.addTarget(self, action: #selector(cartPressed), for: .touchUpInside)
        return button
    }()
    
    @objc private func cartPressed(){
        cartVC.deleteCell(cell: self)
    }
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [productName, productWeight, productPrice])
        stackView.axis = .vertical
        stackView.spacing = 10
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            layoutUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
//        productImage.layer.masksToBounds = true
        
        addSubview(productImage)
        productImage.snp.makeConstraints { make in
            make.width.equalTo(contentView.frame.width / 3)
            make.height.equalTo(contentView.frame.height - 20)
        }
        
        addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.left.equalTo(productImage.snp.right).offset(20)
        }
        
        addSubview(removeProduct)
        removeProduct.snp.makeConstraints {
            $0.top.equalTo(stackView.snp.top)
            $0.trailing.equalToSuperview().inset(20)
        }

    }
    
    private func layoutUI(){
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func configureCell(data product: Product) {
        productImage.image = UIImage(named: product.imageName)
        productName.text = product.name
        productWeight.text = String(product.weight)
        productPrice.text = String(product.price)
    }
    
//    override func prepareForReuse() {
//        super.prepareForReuse()
//        accessoryType = .none
//    }
}
