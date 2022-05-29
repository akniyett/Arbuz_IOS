//
//  ProductDetailViewController.swift
//  ArbuzApp
//
//  Created by Akniyet Turdybay on 29.05.2022.
//

import UIKit
import SnapKit
import Foundation

class ProductDetailViewController: UIViewController {
    
    var product: Product?
    var productCount = 0

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 15
        return imageView
    }()

    private let productName: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = UIFont.boldSystemFont(ofSize: 25)
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
        status.font = UIFont.systemFont(ofSize: 20)
        status.textColor = .systemGreen
        return status
    }()
    
    private let productDescription: UILabel = {
        let despription = UILabel()
        despription.numberOfLines = 0
        despription.lineBreakMode = .byWordWrapping
        despription.sizeToFit()
        return despription
    }()

    private let productWeight: UILabel = {
        let weight = UILabel()
        weight.font = UIFont.systemFont(ofSize: 20)
        return weight
    }()
    
    private let increaseButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.addTarget(self, action: #selector(increaseCount), for: .touchUpInside)
        return button
    }()
    
    private let counterLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        return label
    }()
    
    private let decreaseButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "minus"), for: .normal)
        button.addTarget(self, action: #selector(decreaseCount), for: .touchUpInside)
        return button
    }()
    
    
    private lazy var counterView: UIStackView = {
        let counterView = UIStackView(arrangedSubviews: [decreaseButton, counterLabel, increaseButton])
        counterView.axis = .horizontal
        counterView.layer.cornerRadius = 5
        counterView.spacing = 25
        return counterView
    }()
    
    private let buyButton: UIButton = {
        let button = UIButton()
        button.setTitle("Купить", for: .normal)
        button.backgroundColor = .systemGreen
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(buyPressed), for: .touchUpInside)
        return button
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        if let product = product {
            imageView.image = UIImage(named: product.imageName)
            productName.text = product.name
            productWeight.text = "Вес: " + String(product.weight) + "кг"
            productPrice.text = String(product.price) + " ₸"
            productStatus.text = product.status.rawValue
            productDescription.text = product.description
        }
        setUpUI()

    }
    
    @objc private func buyPressed(){
        if product?.status == .thwarted{
            let alert = UIAlertController(title: "Внимание!", message: "Арбуз уже сорван, выберите другой", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else if product?.status == .unripe{
            let alert = UIAlertController(title: "Внимание!", message: "Учтите что арбуз еще не спелый", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }else if product?.status == .ripe{
            let deliverVC = DeliverViewController()
            deliverVC.modalPresentationStyle = .fullScreen
            self.present(deliverVC, animated: true)
        }
    }
    
    @objc private func increaseCount(){
        productCount += 1
        decreaseButton.isEnabled = true
        decreaseButton.tintColor = .systemBlue
        productPrice.text = String(product!.price * productCount) + " ₸"
        counterLabel.text = String(productCount)
    }
    @objc private func decreaseCount(){
        if productCount == 0{
            decreaseButton.isEnabled = false
            decreaseButton.tintColor = .systemGray
        }else{
            productCount -= 1
            productPrice.text = String(product!.price * productCount) + " ₸"
            counterLabel.text = String(productCount)
        }
    }
    
    
    private func setUpUI() {
        imageView.layer.masksToBounds = true
        
        view.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(view.frame.width - 40)

        }
        
        view.addSubview(productName)
        productName.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(imageView.snp.bottom).offset(20)
        }
     
        view.addSubview(productWeight)
        productWeight.snp.makeConstraints {
            $0.trailing.leading.equalToSuperview().inset(20)
            $0.top.equalTo(productName.snp.bottom).offset(30)
        }
        
        view.addSubview(productStatus)
        productStatus.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(20)
            $0.top.equalTo(productName.snp.bottom).offset(30)
        }
        
        view.addSubview(productPrice)
        productPrice.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(20)
            $0.top.equalTo(productStatus.snp.bottom).offset(30)
        }
        
        view.addSubview(counterView)
        counterView.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(20)
            $0.top.equalTo(productWeight.snp.bottom).offset(30)

        }
        view.addSubview(productDescription)
        productDescription.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.top.equalTo(counterView.snp.bottom).offset(30)

        }
        view.addSubview(buyButton)
        buyButton.snp.makeConstraints {
            $0.bottom.equalTo(view.snp.bottom).inset(80)
            $0.height.equalTo(50)
            $0.trailing.leading.equalToSuperview().inset(20)
        }

    }

}
