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
    
    let wineTypes = WineType.allCases
    var selectedType: WineType = .redWine
    
    let collectionViewLayout: UICollectionViewLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        return layout
    }()
    
   lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
    
    let tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(WineTableViewCell.self, forCellReuseIdentifier: WineTableViewCell.identifier)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(false, animated: false)
        view.backgroundColor = .white
      
        setupTable()
   
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func setupTable() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(WineTypeCollectionViewCell.self, forCellWithReuseIdentifier: WineTypeCollectionViewCell.identifier)
        collectionView.showsHorizontalScrollIndicator = false
        view.addSubview(collectionView)
        view.addSubview(tableView)
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(64)
        }
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(collectionView.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
        collectionView.delegate = self
        collectionView.dataSource = self
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
    
    func didSelectType(type: WineType){
        selectedType = type
        collectionView.reloadData()
        controller.fetchWines(wineType: type) { result in
            switch result {
            case.success(let data):
              //  print(data.count)
                self.dataSource = data
                self.tableView.reloadData()
            case.failure(let error):
                print(error)
            }
        }
    }
}

