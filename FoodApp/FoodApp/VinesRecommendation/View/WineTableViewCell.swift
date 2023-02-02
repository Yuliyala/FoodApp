//
//  WineTableViewCell.swift
//  FoodApp
//
//  Created by Yuliya Lapenak on 2/1/23.
//

import UIKit

class WineTableViewCell: UITableViewCell {
    
    static let identifier = "WineTableViewCell"
    
    let stackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        return view
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let wineImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(){
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(wineImageView)
        stackView.addArrangedSubview(titleLabel)
        
        stackView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.top.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
        wineImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(16)
            $0.size.equalTo(40)
        }
        titleLabel.snp.makeConstraints {
            $0.leading.equalTo(wineImageView.snp.trailing).offset(30)
            $0.top.equalToSuperview().offset(16)
        }
        
    }
    
    func set(model: WineModel) {
        wineImageView.kf.setImage(with: URL(string: model.imageUrl))
        titleLabel.text = model.title
    }
}
