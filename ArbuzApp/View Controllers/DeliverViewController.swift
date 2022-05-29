//
//  DeliverViewController.swift
//  ArbuzApp
//
//  Created by Akniyet Turdybay on 29.05.2022.
//

import UIKit

class DeliverViewController: UIViewController {
    
    private let viewTitle: UILabel = {
       let lable = UILabel()
        lable.font = UIFont.boldSystemFont(ofSize: 25)
        lable.text = "Детали доставки"
        return lable
    }()
    
    
    private let addressLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text = "Укажите адрес доставки"
        return label
    }()
    
    private let inputAdsress: UITextField = {
        let field = UITextField()
        field.layer.cornerRadius = 5
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.systemGray2.cgColor
        return field
    }()
    
    private let phoneNumber: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text = "Оставьте номер телефона"
        return label
    }()
    
    private let inputPhone: UITextField = {
        let field = UITextField()
        field.layer.cornerRadius = 5
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.systemGray2.cgColor
        return field
    }()
    
    private let deliverDate: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text = "Выберите дату и время доставки"
        return label
    }()
    
    private let datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
//        datePicker.preferredDatePickerStyle = .
        let currentDate: Date = Date()
        var calendar: Calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        calendar.timeZone = TimeZone(identifier: "UTC")!
        var components: DateComponents = DateComponents()
        components.calendar = calendar
        components.year = -18
        let maxDate: Date = calendar.date(byAdding: components, to: currentDate)!
        components.year = 18
        let minDate: Date = calendar.date(byAdding: components, to: currentDate)!
        datePicker.minimumDate = minDate
        datePicker.maximumDate = maxDate
        return datePicker
    }()
    
    private let doneButton: UIButton = {
        let button = UIButton()
        button.setTitle("Готово", for: .normal)
        button.backgroundColor = .systemGreen
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(donePressed), for: .touchUpInside)
        return button
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpView()
        
    }
    
    @objc private func donePressed(){
        self.view.window!.rootViewController?.dismiss(animated: false, completion: nil)
    }

    
    private func setUpView(){
        
        view.addSubview(viewTitle)
        viewTitle.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.centerX.equalToSuperview()
        }
        
        view.addSubview(addressLabel)
        addressLabel.snp.makeConstraints { make in
            make.top.equalTo(viewTitle).offset(50)
            make.leading.equalToSuperview().inset(20)
            make.height.equalTo(40)
        }
        view.addSubview(inputAdsress)
        inputAdsress.snp.makeConstraints { make in
            make.top.equalTo(addressLabel).offset(50)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(40)
        }
        view.addSubview(phoneNumber)
        phoneNumber.snp.makeConstraints { make in
            make.top.equalTo(inputAdsress).offset(50)
            make.leading.equalToSuperview().inset(20)
            make.height.equalTo(40)
        }
        view.addSubview(inputPhone)
        inputPhone.snp.makeConstraints { make in
            make.top.equalTo(phoneNumber).offset(50)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(40)
        }
        view.addSubview(deliverDate)
        deliverDate.snp.makeConstraints { make in
            make.top.equalTo(inputPhone).offset(50)
            make.leading.equalToSuperview().inset(20)
            make.height.equalTo(40)
        }
        view.addSubview(datePicker)
        datePicker.snp.makeConstraints { make in
            make.top.equalTo(deliverDate).offset(50)
            make.leading.equalToSuperview().inset(20)
        }
        
        view.addSubview(doneButton)
        doneButton.snp.makeConstraints {
            $0.bottom.equalTo(view.snp.bottom).inset(80)
            $0.height.equalTo(50)
            $0.trailing.leading.equalToSuperview().inset(20)
        }
    }
    
}

