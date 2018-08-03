//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Alex Roberts on 8/3/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

class ShoppingItemController {
	
	init() {
		loadFromPersistentStore()
	}
	
	func createShoppingItem(imageName: String, name: String, isAdded: Bool) -> ShoppingItem {
		let shoppingItem = ShoppingItem(imageName: imageName, name: name, isAdded: isAdded)
		shoppingList.append(shoppingItem)
		return shoppingItem
	}
	
	func UpdateIsAdded(shoppingItem: ShoppingItem) {
		guard let index = shoppingList.index(of: shoppingItem) else { return }
		shoppingList[index].isAdded = !shoppingList[index].isAdded
	}
	
	// MARK: - Persistance
	
	func saveToPersistentStore() {
		guard let url = persistentFileURL else {return}
		
		do {
			let encoder = PropertyListEncoder()
			let data = try encoder.encode(shoppingList)
			try data.write(to: url)
		} catch {
			NSLog("Error saving shopping list data: \(error)")
		}
		
	}
	
	func loadFromPersistentStore() {
		let fm = FileManager.default
		guard let url = persistentFileURL, fm.fileExists(atPath: url.path) else { return }
		
		do {
			let data = try Data(contentsOf: url)
			let decoder = PropertyListDecoder()
			shoppingList = try decoder.decode([ShoppingItem].self, from: data)
		} catch {
			NSLog("Error loading shopping list data: \(error)")
		}
	}
	
	private var persistentFileURL: URL? {
		let fm = FileManager.default
		guard let documentsDir = fm.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
		return documentsDir.appendingPathComponent("shoppingList.plist")
	}
	
	// MARK: - Properties
	
	private(set) var shoppingList: [ShoppingItem] = []
}
