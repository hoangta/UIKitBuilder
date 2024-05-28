//
//  RegexBuilder.swift
//  UIKitBuilder
//
//  Created by Hoang Ta on 28/5/24.
//

import Foundation
import RegexBuilder

func testRegexBuilder() {
    let word = OneOrMore(.word)
    let emailPattern = Regex {
        Capture {
            ZeroOrMore {
                word
                "."
            }
            word
        }
        "@"
        Capture {
            word
            OneOrMore {
                "."
                word
            }
        }
    }

    let text = "My email is my.name@example.com@dd."
    if let match = text.firstMatch(of: emailPattern) {
        let (wholeMatch, name, domain) = match.output
        // wholeMatch is "my.name@example.com"
        // name is "my.name"
        // domain is "example.com"
    }
}
