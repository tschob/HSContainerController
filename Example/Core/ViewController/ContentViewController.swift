//
//  ContentViewController.swift
//  Example
//
//  Created by Hans Seiffert on 06.08.16.
//  Copyright © 2016 Hans Seiffert. All rights reserved.
//

import UIKit

class ContentViewController: UIViewController {

	@IBOutlet private weak var titleLabel		: UILabel?
	@IBOutlet private weak var messageLabel		: UILabel?

	private var didDisappear					= false

	override func viewDidLoad() {
		super.viewDidLoad()

		self.logLifecycle(#function)
	}

	override func viewDidDisappear(animated: Bool) {
		super.viewDidDisappear(animated)

		self.didDisappear = true

		self.logLifecycle(#function)
	}

	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)

		if (self.didDisappear == true) {
			self.messageLabel?.text = "REUSED"
		}
		self.logLifecycle(#function)
	}

	deinit {
		self.logLifecycle(#function)
	}

	// MARK: -

	private func logLifecycle(message: String) {
		print((self.titleLabel?.text ?? "-") + ": " + message)
	}

}