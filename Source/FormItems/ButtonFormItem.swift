// MIT license. Copyright (c) 2018 SwiftyFORM. All rights reserved.
import Foundation

public class ButtonFormItem: FormItem {
	override func accept(visitor: FormItemVisitor) {
		visitor.visit(object: self)
	}

	public var title: String = ""
	@discardableResult
	public func title(_ title: String) -> Self {
		self.title = title
		return self
	}
	
	public var titleColor: UIColor = .black
	@discardableResult
	public func titleColor(_ titleColor: UIColor?) -> Self {
		self.titleColor = titleColor ?? .black
		return self
	}
	
	public var titleFont: UIFont = .preferredFont(forTextStyle: .body)
	@discardableResult
	public func titleFont(_ titleFont: UIFont) -> Self {
		self.titleFont = titleFont
		return self
	}
	
	public var titleAlignment: NSTextAlignment = .center
	@discardableResult
	public func titleAlignment(_ titleAlignment: NSTextAlignment) -> Self {
		self.titleAlignment = titleAlignment
		return self
	}
	
	public var backgroundColor: UIColor?
	@discardableResult
	public func backgroundColor(_ backgroundColor: UIColor?) -> Self {
		self.backgroundColor = backgroundColor
		return self
	}

	public var action: () -> Void = {}
	@discardableResult
	public func action(_ action: @escaping ()->Void) -> Self {
		self.action = action
		return self
	}
}
