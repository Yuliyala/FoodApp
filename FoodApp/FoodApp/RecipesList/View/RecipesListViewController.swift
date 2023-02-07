//
//  RecipesListViewController.swift
//  FoodApp
//
//  Created by Yuliya Lapenak on 1/11/23.
//

import UIKit
import SnapKit
import Alamofire

class RecipesListViewController: UIViewController {
    
    let controller = RecipesListController()
    var dataSource: [RecipePreviewModel] = []
    
    let tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(RecipePreviewTableViewCell.self, forCellReuseIdentifier:RecipePreviewTableViewCell.identifier)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.hidesBottomBarWhenPushed = true
        setupTable()
    }
    
    func setupTable() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        tableView.dataSource = self
        tableView.delegate = self
        fetchRecipes()
    }
    
    func fetchRecipes() {
        controller.fetchRecipes { recipes in
            print(recipes)
            self.dataSource.append(contentsOf: recipes)
            self.tableView.reloadData()
        }
    }
    
    func openDetails(for index: Int) {
        let id = dataSource[index].id
        let destination = RecipeDetailsBuilder().build(id: id)
        destination.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(destination, animated: true)
    }
}


extension RecipesListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RecipePreviewTableViewCell.identifier) as? RecipePreviewTableViewCell else { return UITableViewCell() }
        
        cell.set(model: dataSource[indexPath.row])
        
        return cell
    }
    
}

extension RecipesListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        90
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        openDetails(for: indexPath.row)
    }
    
}
