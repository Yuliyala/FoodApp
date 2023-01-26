//
//  StepView.swift
//  FoodApp
//
//  Created by Yuliya Lapenak on 1/25/23.
//

import UIKit

class StepView: UIView {
    
    let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    init(){
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(){
        addSubview(label)
        
        label.snp.makeConstraints {
            $0.top.equalToSuperview().offset(8)
            $0.bottom.equalToSuperview().inset(8)
            $0.leading.trailing.equalToSuperview().inset(16)
        }
        
        layer.cornerRadius = 12
        backgroundColor = #colorLiteral(red: 1, green: 0.5250850916, blue: 0.9499613643, alpha: 0.2900214796)
    }
    
    func set(step: InstructionStep) {
        var text = NSMutableAttributedString()
        
        text.append(NSMutableAttributedString(
            string: "N \(step.number) \n\n" ,
            attributes: [.font: UIFont.systemFont(ofSize: 24, weight: .semibold)]))
        
        text.append(NSMutableAttributedString(
            string: step.step ,
            attributes: [.font: UIFont.systemFont(ofSize: 16, weight: .regular)]))
        
        label.attributedText = text
    }
}
