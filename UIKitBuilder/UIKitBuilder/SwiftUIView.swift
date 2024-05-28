//
//  SwiftUIView.swift
//  UIKitBuilder
//
//  Created by Hoang Ta on 27/5/24.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        VStack(spacing: 12) {
            Image(systemName: "globe").onTapGesture {
                testRegexBuilder()
            }

            Text("Hello, World!")
                .foregroundStyle(Color.white)
                .padding(16)
                .background(Color.black)
                .cornerRadius(12)
        }
    }
}

struct NotSwiftUIView: View {
    struct VStack: View {
        struct Closure {
            func addView(_ view: Any) {}
        }
        let spacing: CGFloat
        let closure: (Closure) -> Void

        var body: some View {
            EmptyView()
        }
    }

    var body: some View {
        VStack(spacing: 12) { stack in
            stack.addView(Image(systemName: "globe"))
            stack.addView(
                Text("Hello, World!")
                    .foregroundStyle(Color.white)
                    .padding(16)
                    .background(Color.black)
                    .cornerRadius(12)
            )
        }
    }
}

#Preview {
    SwiftUIView()
        .previewLayout(.fixed(width: 50, height: 100))
}
