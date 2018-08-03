//
//  CheckoutViewController.swift
//  Shopping List
//
//  Created by Alex Roberts on 8/3/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit
import UserNotifications

class CheckoutViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

	@IBAction func triggerNotification(_ sender: Any) {
		let content = UNMutableNotificationContent()
		content.title = "Delivery scheduled"
		let name = enterNameTextField.text!
		let address = enterAddressTextField.text!
		content.body =  name + ", your delivery to " + address + " will arrive in 15 minutes."
		let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
		let request = UNNotificationRequest(identifier: "NotificationID", content: content, trigger: trigger)
		
		//Schedule
		let notificationCenter = UNUserNotificationCenter.current()
		notificationCenter.add(request) { (error) in
			if let error = error {
				NSLog("There was an error scheduling a notification: \(error)")
				return
			}
		}
	}
	
	@IBOutlet weak var enterNameTextField: UITextField!
	
	@IBOutlet weak var enterAddressTextField: UITextField!
	
	@IBOutlet weak var numberOfItemsLabel: UILabel!
	
	var shoppingItemController = ShoppingItemController()

}
