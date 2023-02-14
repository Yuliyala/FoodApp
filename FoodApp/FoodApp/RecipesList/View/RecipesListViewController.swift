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
    
    var controller: RecipesListControllerProtocol!
    var dataSource: [RecipePreviewModel] = []
    
    var rootView: RecipeListView {
        view as! RecipeListView
    }
    
    override func  loadView() {
        super.loadView()
        view = RecipeListView()
        }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupTable()
    }

    func  setupTable() {
        rootView.tableView.dataSource = self
            rootView.tableView.delegate = self
        fetchRecipes()
    }
    
    func fetchRecipes() {
        controller.fetchRecipes { recipes in
            print(recipes)
            self.dataSource.append(contentsOf: recipes)
            self.rootView.tableView.reloadData()
        }
    }
    
    func openDetails(for index: Int) {
        let id = dataSource[index].id
        let destination = RecipeDetailsBuilder().build(id: id)
        destination.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(destination, animated: true)
    }
}

