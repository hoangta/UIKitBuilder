//
//  ViewController.swift
//  UIKitBuilder
//
//  Created by Hoang Ta on 21/5/24.
//

import UIKit
import TinyConstraints

class ViewController: UIViewController {
    private var flag = true
    override func viewDidLoad() {
        super.viewDidLoad()

        let stackView = UIStackView(axis: .vertical) {
            UIImageView(image: UIImage(systemName: "globe"))

            if true {
                "Hi there!"
            }
            let max = 3
            for i in 0..<max {
                UILabel()
                    .set("Hi \(i)", for: \.text)
            }
            if flag {
                if !flag {
                    UILabel()
                        .set("This is not ever shown!", for: \.text)
                        .set(.blue, for: \.backgroundColor)
                }
                UILabel()
                    .set("Hi if there?", for: \.text)
                    .set(.blue, for: \.backgroundColor)
            }
            if !flag {
                UILabel()
                    .set("This is true label!", for: \.text)
            } else {
                UILabel()
                    .set("This is false label!", for: \.text)
                    .set(.red, for: \.backgroundColor)
            }
        }
            .set(12, for: \.spacing)
            .set(.center, for: \.alignment)
            .set(.black, for: \.tintColor)

        view.addSubviews {
            stackView
                .layout { stack, _ in
                    stack.centerInSuperview()
                }
        }
    }

    func makeBodyView() -> UIView {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.axis = .vertical
        stackView.spacing = 12

        let globe = UIImageView(image: UIImage(systemName: "globe"))
        stackView.addArrangedSubview(globe)

        let label = UILabel()
        label.text = "Hello, World!"
        label.textColor = .white
        let labelContainer = UIView()
        labelContainer.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: labelContainer.centerXAnchor).isActive = true
        label.leadingAnchor.constraint(equalTo: labelContainer.leadingAnchor, constant: 16).isActive = true
        label.centerYAnchor.constraint(equalTo: labelContainer.centerYAnchor).isActive = true
        label.topAnchor.constraint(equalTo: labelContainer.topAnchor, constant: 16).isActive = true
        labelContainer.backgroundColor = .black
        labelContainer.layer.cornerRadius = 12
        stackView.addArrangedSubview(labelContainer)
        return stackView
    }

    func makeBodyView2() -> UIView {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.axis = .vertical
        stackView.spacing = 12

        let globe = UIImageView(image: UIImage(systemName: "globe"))
        stackView.addArrangedSubview(globe)

        let label = UILabel()
        label.text = "Hello, World!"
        label.textColor = .white
        let labelContainer = UIView()
        labelContainer.addSubview(label)
        label.edgesToSuperview(insets: .uniform(16))
        labelContainer.backgroundColor = .black
        labelContainer.layer.cornerRadius = 12
        stackView.addArrangedSubview(labelContainer)
        return stackView
    }

    func makeBodyView3() -> UIView {
        let stackView = UIStackView(axis: .vertical, alignment: .center, spacing: 12)

        let globe = UIImageView(image: UIImage(systemName: "globe"))
        stackView.addArrangedSubview(globe)

        let label = UILabel()
        label.text = "Hello, World!"
        label.textColor = .white
        let labelContainer = UIView()
        labelContainer.addSubview(label)
        label.edgesToSuperview(insets: .uniform(16))
        labelContainer.backgroundColor = .black
        labelContainer.layer.cornerRadius = 12
        stackView.addArrangedSubview(labelContainer)
        return stackView
    }
}

extension UIStackView {
    convenience init(
        axis: NSLayoutConstraint.Axis,
        alignment: UIStackView.Alignment,
        spacing: CGFloat
    ) {
        self.init()
        self.axis = axis
        self.alignment = alignment
        self.spacing = spacing
    }
}
