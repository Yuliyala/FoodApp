//
//  RecipeDetailsView.swift
//  FoodApp
//
//  Created by Yuliya Lapenak on 1/17/23.
//

import Foundation
import UIKit
import SnapKit

class RecipeDetailsView: UIView {
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let stackView: UIStackView = {
        let  view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.alignment = .fill
        view.distribution = .fill
        view.spacing = 16
        return view
    }()
    
    let  headerView: RecipeHeaderView = {
        let view = RecipeHeaderView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let iconView: IconsView = {
        let view = IconsView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    init(){
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        backgroundColor = .white
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(headerView)
        stackView.addArrangedSubview(iconView)

        setConstraints()
    }
    
    func set(model: RecipeDetail) {
        headerView.set(title: model.title, image: model.image)
        if model.vegetarian == true  {
            iconView.vegetarianImageView.image = UIImage(named: "vegan")
        } else {
            iconView.vegetarianImageView.image = UIImage(named: "meat")
        }
        
        if model.glutenFree == true  {
            iconView.glutenFreeImageView.image = UIImage(named: "notgluten")
        } else {
            iconView.glutenFreeImageView.image = UIImage(named: "gluten")
        }
        
        if model.dairyFree == true  {
            iconView.dairyFreeImageView.image = UIImage(named: "dairyfree")
        } else {
            iconView.dairyFreeImageView.image = UIImage(named: "dairy")
        }
        
        if model.veryHealthy == true  {
            iconView.veryHealthyImageView.image = UIImage(named: "no-fast-food")
        } else {
            iconView.veryHealthyImageView.image = UIImage(named: "fast-food")
        }
        
        if model.veryPopular == true  {
            iconView.veryPopularFreeImageView.image = UIImage(named: "fire")
        } else {
            iconView.veryPopularFreeImageView.image = UIImage(named: "no-fire")
        }
        
        if model.cheap == true  {
            iconView.cheapImageView.image = UIImage(named: "loss")
        } else {
            iconView.cheapImageView.image = UIImage(named: "arrow")
        }
    }
    
    func setConstraints(){
        
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.leading.trailing.top.bottom.equalToSuperview()
            $0.width.equalTo(self.snp.width)
        }
        
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
