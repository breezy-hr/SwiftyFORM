// MIT license. Copyright (c) 2017 SwiftyFORM. All rights reserved.
import SwiftyFORM

class Tutorial1_TextField_ViewController: FormViewController {
	override func populate(_ builder: FormBuilder) {
		builder += TextFieldFormItem()
			.title("Email")
			.titleFont(.systemFont(ofSize: 12))
			.titleColor(.blue)
			.textColor(.red)
			.textFont(.systemFont(ofSize: 17))
			.placeholder("Please specify")
			.keyboardType(.emailAddress)
	}
}
