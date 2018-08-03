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
		isAddedButtonText.setTitle(isAdded ? "Added" : "Not Added", for: .normal)
	}
	
	var shoppingItem: ShoppingItem? {
		didSet{
			updateViews()
		}
	}
	

	@IBAction func toggleIsAdded(_ sender: Any) {
		guard let isAdded = shoppingItem?.isAdded else { return }
		shoppingItem?.isAdded = !isAdded
	}
	@IBOutlet weak var isAddedButtonText: UIButton!
	
	@IBOutlet weak var imageView: UIImageView!
	
	@IBOutlet weak var descriptionLabel: UILabel!
	
	
	
}
