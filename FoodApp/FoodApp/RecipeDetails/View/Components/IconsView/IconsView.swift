//
//  IconsView.swift
//  FoodApp
//
//  Created by Yuliya Lapenak on 1/19/23.
//

import UIKit
import Kingfisher

class IconsView: UIView {
    
    let stackView: UIStackView = {
        let  view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.alignment = .fill
        view.distribution = .fill
        return view
    }()
    
    let vegetarianImageView = IconImage()
    let glutenFreeImageView = IconImage()
    let dairyFreeImageView = IconImage()
    let veryHealthyImageView = IconImage()
    let cheapImageView = IconImage()
    let veryPopularFreeImageView = IconImage()
    
    init(){
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView(){
        addSubview(stackView)
        stackView.addArrangedSubview(vegetarianImageView)
        stackView.addArrangedSubview(glutenFreeImageView)
        stackView.addArrangedSubview(dairyFreeImageView)
        stackView.addArrangedSubview(veryHealthyImageView)
        stackView.addArrangedSubview(cheapImageView)
        stackView.addArrangedSubview(veryPopularFreeImageView)
        
        stackView.setCustomSpacing(16, after: vegetarianImageView)
        stackView.setCustomSpacing(16, after: glutenFreeImageView)
        stackView.setCustomSpacing(16, after: dairyFreeImageView)
        stackView.setCustomSpacing(16, after: veryHealthyImageView)
        stackView.setCustomSpacing(16, after: cheapImageView)
        
        vegetarianImageView.snp.makeConstraints {
            $0.leading.equalTo(40)
            $0.size.equalTo(40)
        }
        makeConstraints(imageView: glutenFreeImageView)
        makeConstraints(imageView: dairyFreeImageView)
        makeConstraints(imageView: veryHealthyImageView)
        makeConstraints(imageView: cheapImageView)
        makeConstraints(imageView: veryPopularFreeImageView)
    }
    
    
    func makeConstraints(imageView: UIImageView) {
        imageView.snp.makeConstraints {
            $0.size.equalTo(40)
        }
    }
    
    func setImage(model: RecipeDetail) {
        
        vegetarianImageView.image = UIImage(named: model.vegetarian ? "vegan" : "meat")
        glutenFreeImageView.image = UIImage(named: model.vegetarian ? "notgluten" : "gluten")
        dairyFreeImageView.image = UIImage(named: model.vegetarian ? "dairyfree" : "dairy")
        veryHealthyImageView.image = UIImage(named: model.vegetarian ? "no-fast-food" : "dairy")
        veryPopularFreeImageView.image = UIImage(named: model.vegetarian ? "fire" : "no-fire")
        cheapImageView.image = UIImage(named: model.vegetarian ? "loss" : "arrow")
     
    }
    
}

