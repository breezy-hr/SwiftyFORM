// MIT license. Copyright (c) 2017 SwiftyFORM. All rights reserved.
import UIKit
import SwiftyFORM

class ButtonsViewController: FormViewController {
	override func populate(_ builder: FormBuilder) {
		builder.navigationTitle = "Buttons"
		builder.toolbarMode = .none
		builder += SectionHeaderTitleFormItem().title("Table Row Buttons")
		builder += button0
		builder += button1
		builder += button2
	}

	lazy var button0: ButtonFormItem = {
		let instance = ButtonFormItem().titleColor(.red).backgroundColor(.lightGray)
		instance.title = "Button 0"
		instance.action = { [weak self] in
			self?.form_simpleAlert("Button 0", "Button clicked")
		}
		return instance
		}()

	lazy var button1: ButtonFormItem = {
		let instance = ButtonFormItem().action({ [weak self] in
			self?.form_simpleAlert("Button 1", "Button clicked")
		})
		instance.title = "Button 1"
		return instance
		}()

	lazy var button2: ButtonFormItem = {
		let instance = ButtonFormItem().titleAlignment(.left)
		instance.title = "Button 2"
		instance.action = { [weak self] in
			self?.form_simpleAlert("Button 2", "Button clicked")
		}
		return instance
		}()
}
