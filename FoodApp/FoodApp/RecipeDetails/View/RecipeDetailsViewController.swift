//
//  RecipeDetailsViewController.swift
//  FoodApp
//
//  Created by Yuliya Lapenak on 1/17/23.
//

import Foundation
import UIKit

class RecipeDetailsViewController: UIViewController {
    
    var controller: RecipeDetailsController!
    
    var rootView: RecipeDetailsView {
        view as! RecipeDetailsView
    }
    
    override func loadView() {
        super.loadView()
        view = RecipeDetailsView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rootView.setLoading(isLoading: true)
        controller.fetchRecipeInfo { response in
            switch response {
            case .success(let recipe):
                self.rootView.set(model: recipe)
                //dump(a)
            case .failure(let failure):
                print(failure)
            }
        }
        setupLinkView()
    }
    
    func setupLinkView() {
        rootView.linkView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(linkViewPressed)))
    }
    
    @objc func linkViewPressed() {
        controller.openLink()
    }
    
}
