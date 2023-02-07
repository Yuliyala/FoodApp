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
        view.distribution = .fill
        view.alignment = .top
        return view
    }()
    
    let stackViewForLabel: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        return view
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.numberOfLines = 0
        return label
    }()
    
    let wineImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
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
        stackView.addArrangedSubview(stackViewForLabel)
        
        stackViewForLabel.addArrangedSubview(titleLabel)
        stackViewForLabel.addArrangedSubview(descriptionLabel)
//        stackView.setCustomSpacing(40, after: wineImageView)
        
        stackView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.top.equalToSuperview().offset(8)
            $0.bottom.equalToSuperview().inset(8)
        }
        
        wineImageView.snp.makeConstraints {
            $0.size.equalTo(100)
        }
    }
    
    func set(model: WineModel) {
        wineImageView.kf.setImage(with: URL(string: model.imageUrl))
        titleLabel.text = model.title
        descriptionLabel.text = model.description
    }
}
