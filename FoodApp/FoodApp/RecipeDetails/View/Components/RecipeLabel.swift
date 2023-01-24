//
//  RecipeInfoLabel.swift
//  FoodApp
//
//  Created by Yuliya Lapenak on 1/21/23.
//

import UIKit


class RecipeLabel : UILabel {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 25, weight: .semibold)
        label.numberOfLines = 0
        return label
    }()
}
