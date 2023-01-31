//
//  VinesViewController.swift
//  FoodApp
//
//  Created by Yuliya Lapenak on 1/31/23.
//

import UIKit


class VinesViewController: UIViewController {
    
    
    let controller = WinesRecommendationController()
    var dataSource = [WineModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
        fetchWines()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    func fetchWines() {
        controller.fetchWines {  result in
            switch result {
            case .success(let wines):
                self.dataSource = wines

            case .failure(let failure):
                print(failure)
            }
        }
    }
    
}
