// MIT license. Copyright (c) 2018 SwiftyFORM. All rights reserved.
import Foundation

public class StaticTextFormItem: FormItem {
	override func accept(visitor: FormItemVisitor) {
		visitor.visit(object: self)
	}

	public var title: String = ""
	public var titleColor: UIColor = UIColor.black
	public var titleFont: UIFont = .preferredFont(forTextStyle: .body)

	@discardableResult
	public func title(_ title: String) -> Self {
		self.title = title
		return self
	}

	@discardableResult
	public func titleColor(_ color: UIColor) -> Self {
		self.titleColor = color
		return self
	}
	
	@discardableResult
	public func titleFont(_ font: UIFont) -> Self {
		self.titleFont = font
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
			innerValue = newValue
			syncCellWithValue(innerValue)
		}
	}

	@discardableResult
	public func value(_ value: String) -> Self {
		self.value = value
		return self
	}
	
	public var valueColor: UIColor = UIColor.black
	public var valueFont: UIFont = .preferredFont(forTextStyle: .body)
	
	@discardableResult
	public func valueColor(_ color: UIColor) -> Self {
		self.valueColor = color
		return self
	}
	
	@discardableResult
	public func valueFont(_ font: UIFont) -> Self {
		self.valueFont = font
		return self
	}
}
