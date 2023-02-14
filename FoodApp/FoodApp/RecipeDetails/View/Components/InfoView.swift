//
//  InfoView.swift
//  FoodApp
//
//  Created by Yuliya Lapenak on 1/27/23.
//

import UIKit

class InfoView: UIView {
    
    let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        addSubview(label)
        
        label.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(30)
        }
    }
    
    func set(model: RecipeDetail) {
        var text = ""
        text.append("Likes: \(model.aggregateLikes)\n")
        if model.cookingMinutes > 0 {
            text.append("Cooking minutes: \(model.cookingMinutes) min\n")
        }
        text.append("Helath score: \(model.healthScore)%\n")
        text.append("Price: \(model.pricePerServing) USD\n")
        
        if model.cuisines.count > 0 {
            var cuisines = "Cuisines: "
            model.cuisines.forEach { cuisines += " \($0);" }
            cuisines += "\n"
            text.append(cuisines)
        }
        label.text = text
    }
}
