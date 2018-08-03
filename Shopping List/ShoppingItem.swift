//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Alex Roberts on 8/3/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation


struct ShoppingItem: Codable, Equatable {
	
	init(imageName: String, name: String, isAdded: Bool) {
		self.name = name
		self.imageName = imageName
		self.isAdded = isAdded
	}
	
	var imageName: String
	var name: String
	var isAdded: Bool = false
}

