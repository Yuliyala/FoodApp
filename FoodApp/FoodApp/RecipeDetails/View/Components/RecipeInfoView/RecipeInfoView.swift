//
//  RecipeInfoView.swift
//  FoodApp
//
//  Created by Yuliya Lapenak on 1/21/23.
//

import UIKit

class  RecipeInfoView: UIView {
    
    let stackView: UIStackView = {
        let  view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.alignment = .fill
        view.distribution = .fill
        view.spacing = 12
        return view
    }()
    
    var readyInMinutesLabel = RecipeLabel()
    var healthScoreLabel = RecipeLabel()
    var aggregateLikesLabel = RecipeLabel()
    var pricePerServingLabel = RecipeLabel()
    var servingsLabel = RecipeLabel()
    var cuisinesLabel = RecipeLabel()
    var dishTypesLabel = RecipeLabel()
    var dietsLabel = RecipeLabel()
    var stepLabel = RecipeLabel()

    init(){
        super.init(frame: .zero)
        setView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func  setView() {
        
        addSubview(stackView)
        
        stackView.addArrangedSubview(aggregateLikesLabel)
        stackView.addArrangedSubview(readyInMinutesLabel)
        stackView.addArrangedSubview(healthScoreLabel)
        stackView.addArrangedSubview(servingsLabel)
        stackView.addArrangedSubview(pricePerServingLabel)
        stackView.addArrangedSubview(cuisinesLabel)
        stackView.addArrangedSubview(dishTypesLabel)
        stackView.addArrangedSubview(dietsLabel)
        stackView.addArrangedSubview(stepLabel)

        stackView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(30)
            $0.leading.trailing.equalToSuperview().offset(30)
        }
    }
    
    func set(model: RecipeDetail) {
        aggregateLikesLabel.text = "❤ \(model.aggregateLikes)"
        readyInMinutesLabel.text = "Cooking time: \(model.readyInMinutes) мин"
        healthScoreLabel.text = "Health indicator : \(model.healthScore)"
        pricePerServingLabel.text = "Price for serving: \(model.pricePerServing)"
        servingsLabel.text = "Number of serving: \(model.servings)"
        
        if !model.cuisines.isEmpty{
            model.cuisines.forEach { cuisinesLabel.text = "Cuisine:  \($0)"
            }
        }
        
        if !model.dishTypes.isEmpty {
            model.dishTypes.forEach { dishTypesLabel.text = "Dish type:  \($0)"
            }
        }
        
        if model.diets.isEmpty {
            model.diets.forEach { dietsLabel.text = "Diet:  \($0)"
            }
        }
    }

    func setInstruction(model: InstructionStep) {
        stepLabel.text = "Steps: \(model.step)"
    }
}


