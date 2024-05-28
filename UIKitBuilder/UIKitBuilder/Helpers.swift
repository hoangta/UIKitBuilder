//
//  Helpers.swift
//  UIKitBuilder
//
//  Created by Hoang Ta on 21/5/24.
//

import UIKit

protocol Configurable {}
extension Configurable {
    func config(_ config: (Self) -> Void) -> Self {
        config(self)
        return self
    }
}
extension Configurable where Self: AnyObject {
    func set<Value>(_ value: Value, for keyPath: ReferenceWritableKeyPath<Self, Value>) -> Self {
        self[keyPath: keyPath] = value
        return self
    }
}
extension UIView: Configurable {}

protocol HasLayouts: AnyObject {
    var layouts: [(UIView, UIView) -> Void] { get set }
}
extension UIView: HasLayouts {}

private var hasLayoutsContext: UInt8 = 0
extension HasLayouts where Self: UIView {
    func layout(_ layout: @escaping (UIView, UIView) -> Void) -> Self {
        self.layouts.append(layout)
        return self
    }

    private func synchronizedBag<T>( _ action: () -> T) -> T {
        objc_sync_enter(self)
        let result = action()
        objc_sync_exit(self)
        return result
    }

    var layouts: [(UIView, UIView) -> Void] {
        get {
            return synchronizedBag {
                if let cancellables = objc_getAssociatedObject(self, &hasLayoutsContext) as? [(UIView, UIView) -> Void] {
                    return cancellables
                }
                let cancellables = [(UIView, UIView) -> Void]()
                objc_setAssociatedObject(self, &hasLayoutsContext, cancellables, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
                return cancellables
            }
        }
        set {
            synchronizedBag {
                objc_setAssociatedObject(self, &hasLayoutsContext, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            }
        }
    }
}
