//
//  ShoppingListViewCell.swift
//  Shopping List
//
//  Created by Alex Roberts on 8/3/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListViewCell: UICollectionViewCell {
	
	private func updateViews() {
		guard let imageName = shoppingItem?.imageName else { return }
		imageView.image = UIImage(named: imageName)!
		descriptionLabel.text = shoppingItem?.name
		guard let isAdded = shoppingItem?.isAdded else { return }
		isAddedLabel.text = isAdded ? "Added" : "Not Added"
	}
	
	var shoppingItem: ShoppingItem? {
		didSet{
			updateViews()
		}
	}
	
	@IBOutlet weak var isAddedLabel: UILabel!
	
	@IBOutlet weak var imageView: UIImageView!
	
	@IBOutlet weak var descriptionLabel: UILabel!
	
}
