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
        //        view.spacing = 16
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
    
    let mainInfoView: RecipeInfoView = {
        let view = RecipeInfoView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let stepContainer: StepsContainerView = {
        let view = StepsContainerView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let linkView: LinkView = {
        let view = LinkView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //индикатор загрузки
    
    let loader: UIActivityIndicatorView = {
       let loader = UIActivityIndicatorView()
        loader.translatesAutoresizingMaskIntoConstraints = false
        loader.style = .large
        loader.hidesWhenStopped = true
        return loader
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
        contentView.addSubview(loader)
        stackView.addArrangedSubview(headerView)
        stackView.addArrangedSubview(linkView)
        stackView.addArrangedSubview(iconView)
        stackView.addArrangedSubview(mainInfoView)
        stackView.addArrangedSubview(stepContainer)
        
        stackView.setCustomSpacing(10, after: headerView)
        stackView.setCustomSpacing(10, after: linkView)
        stackView.setCustomSpacing(10, after: iconView)
        stackView.setCustomSpacing(10, after: mainInfoView)
        
        setConstraints()
    }
    
    func set(model: RecipeDetail) {
        setLoading(isLoading: false)
        headerView.set(title: model.title, image: model.image)
        iconView.setImage(model: model)
        mainInfoView.set(model: model)
        if !model.analyzedInstructions.isEmpty {
            stepContainer.set(steps: model.analyzedInstructions[0].steps)
        }
    }
    
    func setLoading(isLoading: Bool){
        stackView.isHidden = isLoading
        
        isLoading ? loader.startAnimating() : loader.stopAnimating()
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
        
        loader.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
}
