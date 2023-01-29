//
//  IngredientView.swift
//  FoodApp
//
//  Created by Yuliya Lapenak on 1/27/23.
//

import UIKit

class IngredientView: UIView {
    
    let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()

    init() {
        super.init(frame: .zero)
        set()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(){
        backgroundColor = #colorLiteral(red: 0.8651953936, green: 0.9585103393, blue: 0.6119126678, alpha: 0.5019501945)
        addSubview(label)
        
        label.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(16)
        }
    }
    
    func set(ingredient: Ingredient) {
        var text = NSMutableAttributedString()
        text.append(NSMutableAttributedString(
            string: "Ingredient: \(ingredient.name) \n" ,
            attributes: [.font: UIFont.systemFont(ofSize: 16, weight: .semibold)]))
        text.append(NSMutableAttributedString(
            string: "Amount: \(ingredient.amount) \n" ,
            attributes: [.font: UIFont.systemFont(ofSize: 16, weight: .regular)]))
        text.append(NSMutableAttributedString(
            string: "\(ingredient.original) \n" ,
            attributes: [.font: UIFont.systemFont(ofSize: 16, weight: .regular)]))
        text.append(NSMutableAttributedString(
            string: "\(ingredient.image) \n" ,
            attributes: [.font: UIFont.systemFont(ofSize: 16, weight: .regular)]))
        label.attributedText = text
    }
    
}
