//
//  SettingsViewController.swift
//  Planets
//
//  Created by Alex Roberts on 8/2/18.
//  Copyright © 2018 Lambda Inc. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		//updateViews()
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// Do any additional setup after loading the view.
	}
	
	/*
	@IBAction func changeShouldShowPluto(_ sender: UISwitch) {
		
		let userDefaults = UserDefaults.standard
		userDefaults.set(sender.isOn, forKey: .shouldShowPlutoKey)
	}
	
	private func updateViews() {
		let userDefaults = UserDefaults.standard
		shouldShowPlutoSwitch.isOn = userDefaults.bool(forKey: .shouldShowPlutoKey)
	}
	
	@IBOutlet weak var shouldShowPlutoSwitch: UISwitch!
	*/
}
