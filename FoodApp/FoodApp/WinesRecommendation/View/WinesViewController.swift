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
    
    var controller :  WinesRecommendationControllerProtocol!
    var dataSource = [WineModel]()
    
    let wineTypes = WineType.allCases
    var selectedType: WineType = .redWine
    
    var rootView: WinesView {
        view as! WinesView
    }
    
    override func loadView() {
        super.loadView()
        view = WinesView()
    }
    
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
        
        rootView.collectionView.delegate = self
        rootView.collectionView.dataSource = self
        rootView.tableView.dataSource = self
        rootView.tableView.delegate = self
        fetchWines()
    }
    
    func fetchWines() {
        controller.fetchWines(wineType: selectedType) { result in
            switch result {
            case.success(let data):
                print(data)
                self.dataSource = data
                self.rootView.tableView.reloadData()
            case.failure(let error):
                print(error)
            }
        }
    }
    
    func didSelectType(type: WineType){
        selectedType = type
        rootView.collectionView.reloadData()
        fetchWines()
    }
}

