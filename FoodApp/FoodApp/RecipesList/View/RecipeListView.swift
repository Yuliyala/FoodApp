//
//  RecipeListView.swift
//  FoodApp
//
//  Created by Yuliya Lapenak on 2/14/23.
//

import UIKit

class RecipeListView: UIView {
    
    let tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(RecipePreviewTableViewCell.self, forCellReuseIdentifier:RecipePreviewTableViewCell.identifier)
        return tableView
    }()
    
   
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(){
        addSubview(tableView)
       
            tableView.snp.makeConstraints {
                $0.top.equalTo(safeAreaLayoutGuide)
                $0.leading.trailing.equalToSuperview()
                $0.bottom.equalTo(safeAreaLayoutGuide)
            }
    }
}
