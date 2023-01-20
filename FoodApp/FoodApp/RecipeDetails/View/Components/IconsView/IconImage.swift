//
//  IconImage.swift
//  FoodApp
//
//  Created by Yuliya Lapenak on 1/20/23.
//

import UIKit


class IconImage: UIImageView {
    
    let icon: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
}

