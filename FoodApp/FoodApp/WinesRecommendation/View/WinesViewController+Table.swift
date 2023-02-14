//
//  WinesViewController+Table.swift
//  FoodApp
//
//  Created by Yuliya Lapenak on 2/7/23.
//

import UIKit


extension WinesViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: WineTableViewCell.identifier) as? WineTableViewCell else { return UITableViewCell() }
        
        cell.set(model: dataSource[indexPath.row])
        
        return cell
    }
}

extension WinesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        UITableView.automaticDimension // автоматическая высота ячейка(должны быть правильные констрейнты , от верха до низа)
    }
}
