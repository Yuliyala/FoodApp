//
//  SelectedScreenViewController.swift
//  FoodApp
//
//  Created by Yuliya Lapenak on 1/15/23.
//

import UIKit
import SnapKit
import Alamofire
import Kingfisher

class SelectedScreenViewController: UIViewController {
    
    var recipe: RecipePreviewModel!
   
    let stackView: UIStackView = {
        let  view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.alignment = .fill
        view.distribution = .fill
        return view
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 25, weight: .bold)
        label.numberOfLines = 0
        return label
    }()
    
    let foodImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        setupView()
        setup()
    }
    
    func setup() {
        titleLabel.text = recipe.title
        let url = URL(string: recipe.image ?? "")
        foodImageView.kf.setImage(with: url)
//        titleLabel.text =
//        descriptionLabel.text = article.description
//        authorLabel.text = article.fullAuthor
//        dateLabel.text =  article.publishedAt.toDate()?.toString()
//
//        let url = URL(string: article.urlToImage ?? "")
//        imageView.kf.setImage(with: url)
    }
    
    func setupView() {
        view.addSubview(stackView)
       
        stackView.addArrangedSubview(titleLabel) //добавление элемента в стэк
        stackView.addArrangedSubview(foodImageView)
        stackView.setCustomSpacing(40, after: titleLabel)
  
        stackView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(25)
            $0.leading.trailing.equalToSuperview().inset(16)
        }
        
        titleLabel.snp.makeConstraints {
            $0.height.equalTo(60)
        }

        foodImageView.snp.makeConstraints {
            $0.width.equalToSuperview()
            $0.height.equalTo(250)
        }
        
        }
}
