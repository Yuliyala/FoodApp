//
//  RecipeAdditionalInfoView.swift
//  FoodApp
//
//  Created by Yuliya Lapenak on 1/21/23.
//

import UIKit

class  RecipeAdditionalInfoView: UIView {
    
    let stackView: UIStackView = {
        let  view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.alignment = .fill
        view.distribution = .fill
        view.spacing = 12
        return view
    }()
    
    var readyInMinutesLabel = AdditionalInfoLabel()
    var healthScoreLabel = AdditionalInfoLabel()
    var aggregateLikesLabel = AdditionalInfoLabel()
    var pricePerServingLabel = AdditionalInfoLabel()
    var servingsLabel = AdditionalInfoLabel()
    
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
        
        aggregateLikesLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(48)
            $0.top.equalToSuperview().offset(60)
        }
        
        }
    
    func set(model: RecipeDetail) {
        aggregateLikesLabel.text = "❤ \(model.aggregateLikes)"
        readyInMinutesLabel.text = "Время приготовления: \(model.readyInMinutes) мин"
        healthScoreLabel.text = "Показатель здоровья: \(model.healthScore)"
        pricePerServingLabel.text = "Цена за порцию: \(model.pricePerServing)"
        servingsLabel.text = "Количество порций: \(model.servings)"
    }
}
    

