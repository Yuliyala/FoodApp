//
//  RecipeHeaderView.swift
//  FoodApp
//
//  Created by Yuliya Lapenak on 1/17/23.
//

import UIKit
import Kingfisher

class RecipeHeaderView: UIView {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 25, weight: .bold)
        label.numberOfLines = 0
        return label
    }()
    
    let imageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
        
    }()
    
    init(){
        super.init(frame: .zero)
        setupView()
    
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func  setupView() {
        addSubview(imageView)
        addSubview(titleLabel)
        
        imageView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(48)
            $0.top.equalToSuperview().offset(32)
            $0.height.equalTo(216)
        }
        
        titleLabel.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(32)
            $0.top.equalTo(imageView.snp.bottom).offset(16)
            $0.bottom.equalToSuperview()
        }
    }
    
    func set(title: String, image: String){
        titleLabel.text = title
        imageView.kf.setImage(with: URL(string:image))
    }
}
