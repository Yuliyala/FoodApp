//
//  LinkView.swift
//  FoodApp
//
//  Created by Yuliya Lapenak on 1/25/23.
//

import UIKit

class LinkView : UIView {
    
    let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .link
        label.text = "Go to website"
        label.textAlignment = .left
        return label
    }()
    
    let imageView: UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.image = UIImage(systemName: "wifi")
        return image
    }()
    
    init() {
        super.init(frame:.zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(){
     
        addSubview(imageView)
        addSubview(label)
        
        imageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(8)
            $0.leading.equalToSuperview().offset(30)
            $0.bottom.equalToSuperview().inset(8)
            $0.size.equalTo(30)
        }
        
        label.snp.makeConstraints {
            $0.centerY.equalTo(imageView.snp.centerY)
            $0.leading.equalTo(imageView.snp.trailing).offset(8)
            $0.trailing.equalToSuperview()
        }
    }
    
}

