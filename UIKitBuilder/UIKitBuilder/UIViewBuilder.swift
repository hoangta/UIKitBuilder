//
//  UIViewBuilder.swift
//  UIKitBuilder
//
//  Created by Hoang Ta on 21/5/24.
//

import UIKit

extension UIView {
    convenience init(@UIViewBuilder builder: () -> [UIView]) {
        self.init()
        addSubviews(builder: builder)
    }

    @discardableResult
    func addSubviews(@UIViewBuilder builder: () -> [UIView]) -> UIView {
        let views = builder()
        for view in views {
            addSubview(view)
        }
        for view in views {
            view.layouts.forEach { $0(view, self) }
        }
        return self
    }
}

extension UIStackView {
    convenience init(
        axis: NSLayoutConstraint.Axis,
        @UIViewBuilder builder: () -> [UIView]
    ) {
        self.init()
        self.axis = axis

        let views = builder()
        for view in views {
            addArrangedSubview(view)
        }
        for view in views {
            view.layouts.forEach { $0(view, self) }
        }
    }

    func addArrangedSubview(@UIViewBuilder builder: () -> [UIView]) {
        let views = builder()
        for view in views {
            addArrangedSubview(view)
        }
        for view in views {
            view.layouts.forEach { $0(view, self) }
        }
    }
}

@resultBuilder
struct UIViewBuilder {
    static func buildExpression(_ expression: UIView) -> [UIView] {
        return [expression]
    }

    static func buildBlock(_ components: [UIView]...) -> [UIView] {
        return components.flatMap { $0 }
    }

    static func buildOptional(_ component: [UIView]?) -> [UIView] {
        return component ?? []
    }

    static func buildEither(first component: [UIView]) -> [UIView] {
        return component
    }

    static func buildEither(second component: [UIView]) -> [UIView] {
        return component
    }

    static func buildArray(_ components: [[UIView]]) -> [UIView] {
        return components.flatMap { $0 }
    }

    static func buildExpression(_ expression: String) -> [UIView] {
        let label = UILabel()
        label.text = expression
        return [label]
    }
}
