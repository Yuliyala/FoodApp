//
//  RecipePreviewTableViewCell.swift
//  FoodApp
//
//  Created by Yuliya Lapenak on 1/11/23.
//

import UIKit
import SnapKit
import Kingfisher

class RecipePreviewTableViewCell: UITableViewCell {
    
    static let identifier = "RecipePreviewTableViewCell"
    
    let stackView: UIStackView = {
        let  view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.alignment = .fill
        view.distribution = .fill
        view.spacing = 16
        return view
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    let foodImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        return image
        
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
     setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        contentView.backgroundColor = #colorLiteral(red: 0.920078814, green: 0.914947927, blue: 0.9263009429, alpha: 1)
        stackView.layer.cornerRadius = 8
        stackView.layer.masksToBounds = true
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(foodImageView)
        stackView.addArrangedSubview(titleLabel)
        
        stackView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.top.bottom.equalToSuperview().inset(10)
        }
        foodImageView.snp.makeConstraints {
            $0.width.equalTo(120)
        }
    }
    
    func set(model: RecipePreviewModel) {
        foodImageView.kf.setImage(with: URL(string: model.image))
        titleLabel.text = model.title
    }
}
