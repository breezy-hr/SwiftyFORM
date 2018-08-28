// MIT license. Copyright (c) 2017 SwiftyFORM. All rights reserved.
import UIKit

public class ViewControllerFormItemCellModel {
	public let title: String
	public let titleColor: UIColor
	public let titleFont: UIFont
	public let placeholder: String

	public init(title: String, placeholder: String, titleColor: UIColor, titleFont: UIFont) {
		self.title = title
		self.titleColor = titleColor
		self.titleFont = titleFont
		self.placeholder = placeholder
	}

	public init(title: String, placeholder: String) {
		self.title = title
		self.titleColor = UIColor.black
		self.titleFont = .preferredFont(forTextStyle: .body)
		self.placeholder = placeholder
	}
}

public class ViewControllerFormItemCell: UITableViewCell, SelectRowDelegate {
	public let model: ViewControllerFormItemCellModel
	let innerDidSelectRow: (ViewControllerFormItemCell, ViewControllerFormItemCellModel) -> Void

	public init(model: ViewControllerFormItemCellModel, didSelectRow: @escaping (ViewControllerFormItemCell, ViewControllerFormItemCellModel) -> Void) {
		self.model = model
		self.innerDidSelectRow = didSelectRow
		super.init(style: .value1, reuseIdentifier: nil)
		accessoryType = .disclosureIndicator
		textLabel?.text = model.title
		textLabel?.textColor = model.titleColor
		textLabel?.font = model.titleFont
		detailTextLabel?.text = model.placeholder
	}

	public required init(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	public func form_didSelectRow(indexPath: IndexPath, tableView: UITableView) {
		SwiftyFormLog("will invoke")
		// hide keyboard when the user taps this kind of row
		tableView.form_firstResponder()?.resignFirstResponder()

		innerDidSelectRow(self, model)
		SwiftyFormLog("did invoke")
	}
}
