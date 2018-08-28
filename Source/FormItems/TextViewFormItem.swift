// MIT license. Copyright (c) 2017 SwiftyFORM. All rights reserved.
import Foundation

public class TextViewFormItem: FormItem {
	override func accept(visitor: FormItemVisitor) {
		visitor.visit(object: self)
	}

	public var placeholder: String = ""

	@discardableResult
	public func placeholder(_ placeholder: String) -> Self {
		self.placeholder = placeholder
		return self
	}

	public var title: String = ""
	public var titleColor: UIColor = UIColor.black
	public var titleFont: UIFont = .preferredFont(forTextStyle: .body)
	public var textColor: UIColor = .black
	public var textFont: UIFont = .preferredFont(forTextStyle: .body)
	
	@discardableResult
	public func title(_ title: String) -> Self {
		self.title = title
		return self
	}
	@discardableResult
	public func titleColor(_ color: UIColor?) -> Self {
		self.titleColor = color ?? .black
		return self
	}
	@discardableResult
	public func titleFont(_ font: UIFont) -> Self {
		self.titleFont = font
		return self
	}
	@discardableResult
	public func textColor(_ color: UIColor?) -> Self {
		self.textColor = color ?? .black
		return self
	}
	@discardableResult
	public func textFont(_ font: UIFont) -> Self {
		self.textFont = font
		return self
	}

	typealias SyncBlock = (_ value: String) -> Void
	var syncCellWithValue: SyncBlock = { (string: String) in
		SwiftyFormLog("sync is not overridden")
	}

	internal var innerValue: String = ""
	public var value: String {
		get {
			return self.innerValue
		}
		set {
			self.assignValueAndSync(newValue)
		}
	}

	func assignValueAndSync(_ value: String) {
		innerValue = value
		syncCellWithValue(value)
	}
}
