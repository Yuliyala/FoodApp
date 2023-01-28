//
//  IngredientsContainerView.swift
//  FoodApp
//
//  Created by Yuliya Lapenak on 1/27/23.
//

import UIKit

class IngredientsContainerView: UIView {
    
    let stackView: UIStackView = {
        let  view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.alignment = .fill
        view.distribution = .fill
        view.spacing = 8
        view.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        return view
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Ingredients"
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(){
        addSubview(stackView)
        stackView.addArrangedSubview(titleLabel)
        stackView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(16)
        }
    }
    
    func set(ingredients: [Ingredient]) {
        for element in ingredients {
            let ingredientView = IngredientView()
            ingredientView.set(ingredient: element)
            self.stackView.addArrangedSubview(ingredientView)
        }
    }
}
