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
    
    let vegetarianImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let glutenFreeImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let dairyFreeImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.backgroundColor = .red
        return image
    }()
    
    let veryHealthyImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.backgroundColor = .red
        return image
    }()
    
    let cheapFreeImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.backgroundColor = .red
        return image
    }()
    
    let veryPopularFreeImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.backgroundColor = .red
        return image
    }()
    
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
        stackView.addArrangedSubview(cheapFreeImageView)
        stackView.addArrangedSubview(veryPopularFreeImageView)
        
        stackView.setCustomSpacing(16, after: vegetarianImageView)
        stackView.setCustomSpacing(16, after: glutenFreeImageView)
        stackView.setCustomSpacing(16, after: dairyFreeImageView)
        stackView.setCustomSpacing(16, after: veryHealthyImageView)
        stackView.setCustomSpacing(16, after: cheapFreeImageView)
        
        vegetarianImageView.snp.makeConstraints {
            $0.leading.equalTo(40)
            $0.size.equalTo(40)
        }
        makeConstraints(imageView: glutenFreeImageView)
        makeConstraints(imageView: dairyFreeImageView)
        makeConstraints(imageView: veryHealthyImageView)
        makeConstraints(imageView: cheapFreeImageView)
        makeConstraints(imageView: veryPopularFreeImageView)
    }
    
    
    func makeConstraints(imageView: UIImageView) {
        imageView.snp.makeConstraints {
            $0.size.equalTo(40)
        }
    }
    
//    func setImages(imageView: UIImageView,image: String) {
//        imageView.image = UIImage(named: image)
//    }
    
}

