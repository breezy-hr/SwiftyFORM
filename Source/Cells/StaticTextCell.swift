// MIT license. Copyright (c) 2018 SwiftyFORM. All rights reserved.
import UIKit

public struct StaticTextCellModel {
	var title: String = ""
	var titleColor: UIColor = .black
	var titleFont: UIFont = .preferredFont(forTextStyle: .body)
	var value: String = ""
	var valueColor: UIColor = .black
	var valueFont: UIFont = .preferredFont(forTextStyle: .body)
}

public class StaticTextCell: UITableViewCell {
	public var model: StaticTextCellModel

	public init(model: StaticTextCellModel) {
		self.model = model
		super.init(style: .value1, reuseIdentifier: nil)
		loadWithModel(model)
	}

	public required init(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	public func loadWithModel(_ model: StaticTextCellModel) {
		selectionStyle = .none
		textLabel?.text = model.title
		textLabel?.textColor = model.titleColor
		textLabel?.font = model.titleFont
		detailTextLabel?.text = model.value
		detailTextLabel?.textColor = model.valueColor
		detailTextLabel?.font = model.valueFont
	}

}
