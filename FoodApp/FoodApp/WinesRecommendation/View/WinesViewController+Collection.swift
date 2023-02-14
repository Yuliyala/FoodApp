//
//  WinesViewController+Collection.swift
//  FoodApp
//
//  Created by Yuliya Lapenak on 2/7/23.
//

import UIKit

extension WinesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WineTypeCollectionViewCell.identifier, for: indexPath) as? WineTypeCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.set(type: wineTypes[indexPath.row], isSelected : wineTypes[indexPath.row] == selectedType)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return wineTypes.count
    }
}

extension WinesViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        didSelectType(type: wineTypes[indexPath.row])
    }
    
}

extension WinesViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: wineTypes[indexPath.row].readable.size(withAttributes: [.font : UIFont.systemFont(ofSize: 18, weight: .medium)]).width + 20, height: 60)
    }
}
