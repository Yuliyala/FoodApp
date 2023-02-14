//
//  RecipesListViewController+Table.swift
//  FoodApp
//
//  Created by Yuliya Lapenak on 2/14/23.
//

import UIKit

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
        100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        openDetails(for: indexPath.row)
    }
}
