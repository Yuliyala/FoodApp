//
//  StepsContainerView.swift
//  FoodApp
//
//  Created by Yuliya Lapenak on 1/25/23.
//

import UIKit

class StepsContainerView : UIView {
    
    let stackView: UIStackView = {
        let  view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.alignment = .fill
        view.distribution = .fill
        view.spacing = 8
        return view
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Steps"
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(){
        addSubview(stackView)
        
        stackView.addArrangedSubview(titleLabel)
        
        stackView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(16)
        }
        
    }
    
    func set(steps: [InstructionStep]) {
        steps.forEach { element in
            let stepView = StepView()
            stepView.set(step: element)
            self.stackView.addArrangedSubview(stepView)
        }
//        for element in steps {
//            let stepView = StepView()
//            stepView.set(step: element)
//            self.stackView.addArrangedSubview(stepView)
//        }
    }
    
}
