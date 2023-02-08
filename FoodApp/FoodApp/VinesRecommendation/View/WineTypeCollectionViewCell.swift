//
//  WineTypeCollectionViewCell.swift
//  FoodApp
//
//  Created by Yuliya Lapenak on 2/7/23.
//

import UIKit

class WineTypeCollectionViewCell: UICollectionViewCell {
    
    static let  identifier = "WineTypeCollectionViewCell"
    
    let label : UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(){
        contentView.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        contentView.layer.cornerRadius = 8
        contentView.addSubview(label)
        
        label.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(8)
            $0.centerY.equalToSuperview()
        }
        
    }
    
    func set(type: WineType, isSelected: Bool = false){
        label.text = type.readable
        contentView.layer.borderWidth = isSelected ? 1.2 : 0
        contentView.layer.borderColor = (isSelected ? UIColor.orange : UIColor.clear).cgColor
    }
}

