//
//  CartViewController.swift
//  ArbuzApp
//
//  Created by Akniyet Turdybay on 28.05.2022.
//

import UIKit

class CartViewController: UIViewController {
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .singleLine
        tableView.separatorColor = .systemGray
        return tableView
    }()

    var cartProducts: [Product] = [
        Product(name: "Арбуз", imageName: "arbuz", weight: 8.9, price: 612, status: .ripe, description: "Арбуз – это однолетнее травянистое растение семейства тыквенные, бахчевая культура. Имеет тонкие, длинные ползучие стебли, длиной до 4 м и более. "),
        Product(name: "Арбуз", imageName: "arbuz", weight: 8.9, price: 612, status: .ripe, description: "Арбуз – это однолетнее травянистое растение семейства тыквенные, бахчевая культура. Имеет тонкие, длинные ползучие стебли, длиной до 4 м и более. "),
        Product(name: "Арбуз", imageName: "arbuz", weight: 8.9, price: 612, status: .ripe,description: "Арбуз – это однолетнее травянистое растение семейства тыквенные, бахчевая культура. Имеет тонкие, длинные ползучие стебли, длиной до 4 м и более. "),
        Product(name: "Арбуз", imageName: "arbuz", weight: 8.9, price: 612, status: .ripe, description: "Арбуз – это однолетнее травянистое растение семейства тыквенные, бахчевая культура. Имеет тонкие, длинные ползучие стебли, длиной до 4 м и более. ")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
        configureNavBar()
        configTableView()
    }
    
    private func configureNavBar(){
        navigationController?.navigationBar.isTranslucent = false
        navigationItem.title = "Корзина"
    }
    
    private func configTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
    }
    
    

}

extension CartViewController: UITableViewDelegate{
    
}
extension CartViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartProducts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let item = cartProducts[indexPath.row]
        tableView.register(CartProductCell.self, forCellReuseIdentifier: CartProductCell.reudeId)
        let cell = tableView.dequeueReusableCell(withIdentifier: CartProductCell.reudeId, for: indexPath) as! CartProductCell
        cell.cartVC = self
        cell.configureCell(data: item)
        return cell
    }
    
    func addCell(product: Product){
        
        cartProducts.insert(product, at: 0)
        tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: .top)
    }
    
    
    func deleteCell(cell: UITableViewCell){
        if let indexPath = tableView.indexPath(for: cell) {
            cartProducts.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
            
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let productDetailVC = ProductDetailViewController()
        productDetailVC.product = cartProducts[indexPath.row]
        self.present(productDetailVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    
        return view.frame.height / 5
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: false)
    }

    
}
