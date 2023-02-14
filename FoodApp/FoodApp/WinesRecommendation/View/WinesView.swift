//
//  WinesView.swift
//  FoodApp
//
//  Created by Yuliya Lapenak on 2/14/23.
//


import UIKit

class WinesView: UIView {
    
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
    
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(){
        addSubview(tableView)
        addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(WineTypeCollectionViewCell.self, forCellWithReuseIdentifier: WineTypeCollectionViewCell.identifier)
        collectionView.showsHorizontalScrollIndicator = false
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            collectionView.heightAnchor.constraint(equalToConstant: 64),
            
            tableView.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 16),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -16)
        ])
        
        
        //        collectionView.snp.makeConstraints {
        //            $0.top.equalTo(safeAreaLayoutGuide)
        //            $0.leading.trailing.equalToSuperview().inset(16)
        //            $0.height.equalTo(64)
        //        }
        
        //        tableView.snp.makeConstraints {
        //            $0.top.equalTo(collectionView.snp.bottom).offset(16)
        //            $0.leading.trailing.equalToSuperview()
        //            $0.bottom.equalTo(safeAreaLayoutGuide)
        //        }
    }
}
