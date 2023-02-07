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
    
    let imageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()

    init() {
        super.init(frame: .zero)
        set()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(){
        backgroundColor = .white
        addSubview(label)
        addSubview(imageView)
        
        label.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.equalToSuperview().offset(16)
        }
        
        imageView.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(16)
            $0.leading.equalTo(label.snp.trailing).offset(20)
            $0.size.equalTo(70)
            $0.centerY.equalToSuperview()
        }
    }
    
    func set(ingredient: Ingredient) {
        let text = NSMutableAttributedString()
        text.append(NSMutableAttributedString(
            string: "Ingredient: \(ingredient.name) \n" ,
            attributes: [.font: UIFont.systemFont(ofSize: 16, weight: .semibold)]))
        text.append(NSMutableAttributedString(
            string: "Amount: \(ingredient.amount) \n" ,
            attributes: [.font: UIFont.systemFont(ofSize: 16, weight: .regular)]))
        text.append(NSMutableAttributedString(
            string: "\(ingredient.original) \n" ,
            attributes: [.font: UIFont.systemFont(ofSize: 16, weight: .regular)]))
    
        label.attributedText = text
        
        
        imageView.kf.setImage(with: URL(string: ingredient.imageLink ?? ""))
    }
    
    
    
}
