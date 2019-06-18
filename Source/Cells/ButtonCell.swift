// MIT license. Copyright (c) 2018 SwiftyFORM. All rights reserved.
import UIKit

public struct ButtonCellModel {
	var title: String = ""
	var titleColor: UIColor = .black
	var titleFont: UIFont = .preferredFont(forTextStyle: .body)
	var titleAlignment: NSTextAlignment = .center
	var backgroundColor: UIColor?

	var action: () -> Void = {
		SwiftyFormLog("action")
	}

}

public class ButtonCell: UITableViewCell, SelectRowDelegate {
	public let model: ButtonCellModel

	public init(model: ButtonCellModel) {
		self.model = model
		super.init(style: .default, reuseIdentifier: nil)
		loadWithModel(model)
	}

	public required init(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	public func loadWithModel(_ model: ButtonCellModel) {
		textLabel?.text = model.title
		textLabel?.textColor = model.titleColor
		textLabel?.font = model.titleFont
		textLabel?.textAlignment = model.titleAlignment
		self.backgroundColor = model.backgroundColor
	}

	public func form_didSelectRow(indexPath: IndexPath, tableView: UITableView) {
		// hide keyboard when the user taps this kind of row
		tableView.form_firstResponder()?.resignFirstResponder()

		model.action()

		tableView.deselectRow(at: indexPath, animated: true)
	}
}
