//
//
//  WinesViewController.swift
//  FoodApp
//
//  Created by Yuliya Lapenak on 1/31/23.
//

import UIKit
import Alamofire
import SnapKit

class WinesViewController: UIViewController {
    
    let controller = WinesRecommendationController()
    var dataSource = [WineModel]()
    
    let tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(WineTableViewCell.self, forCellReuseIdentifier: WineTableViewCell.identifier)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
        setupTable()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
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
        fetchWines()
    }
    
    func fetchWines() {
        controller.fetchWines { result in
            switch result {
            case.success(let data):
                print(data)
                self.dataSource.append(contentsOf: data)
                self.tableView.reloadData()
            case.failure(let error):
                print(error)
            }
        }
    }
}

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
        90
    }
}
