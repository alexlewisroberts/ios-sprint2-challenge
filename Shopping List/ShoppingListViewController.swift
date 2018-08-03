//
//  ShoppingListViewController.swift
//  Shopping List
//
//  Created by Alex Roberts on 8/3/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class ShoppingListViewController: UICollectionViewController, UITableViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
		if shoppingItemController.shoppingList.count != itemNames.count {
			for item in itemNames {
				_ = shoppingItemController.createShoppingItem(imageName: item, name: item, isAdded: false)
			}
			shoppingItemController.saveToPersistentStore()
		} else { return }

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }

	// MARK: UICollectionViewDataSource
	
	
	override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		// #warning Incomplete implementation, return the number of items
		return shoppingItemController.shoppingList.count
	}
	
	override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShoppingListCell", for: indexPath)
		guard let shoppingListCell = cell as? ShoppingListViewCell else { return cell }
		
		let shoppingItem = shoppingItemController.shoppingList[indexPath.row]
		shoppingListCell.shoppingItem = shoppingItem
		
		return shoppingListCell
		
	}
	
	override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		let shoppingItem = shoppingItemController.shoppingList[indexPath.row]
		shoppingItemController.UpdateIsAdded(shoppingItem: shoppingItem)
		shoppingItemController.saveToPersistentStore()
		collectionView.reloadData()
	}
	
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "checkoutSegue" {
			if let vc = segue.destination as? CheckoutViewController {
				vc.shoppingItemController = shoppingItemController
			} else { return }
		}
	}
	
	let itemNames = ["apple", "grapes", "milk", "muffin", "popcorn", "soda", "strawberries"]
	var shoppingItemController = ShoppingItemController()

}
