// MageStencilKit.swift
// This module adds custom Stencil filters for Mage CLI

import Foundation
import Stencil

public class MageStencilFilters {
    public static func register(on environment: Environment) {
        for ext in environment.extensions {
            ext.registerFilter(
                "camelcase",
                filter: { value in
                    camelCase(value)
                })
            ext.registerFilter(
                "pascalcase",
                filter: { value in
                    pascalCase(value)
                })
            ext.registerFilter(
                "snakecase",
                filter: { value in
                    snakeCase(value)
                })
            ext.registerFilter(
                "kebabcase",
                filter: { value in
                    kebabCase(value)
                })
            ext.registerFilter(
                "pluralize",
                filter: { value in
                    (value as? String)?.pluralized() ?? value
                })
            ext.registerFilter(
                "titlecase",
                filter: { value in
                    guard let string = value as? String else { return value }
                    return string.capitalized
                })
            ext.registerFilter(
                "capitalizedFirst",
                filter: { value in
                    guard let string = value as? String else { return value }
                    return string.prefix(1).uppercased() + string.dropFirst()
                })
            ext.registerFilter(
                "isAcronym",
                filter: { value in
                    guard let string = value as? String else { return false }
                    return string.uppercased() == string && string.count <= 6
                })
        }
    }

    private static func tokenize(_ string: String) -> [String] {
        let pattern = "([a-z0-9]+|[A-Z0-9]+(?![a-z])|[A-Z][a-z0-9]+)"
        let regex = try? NSRegularExpression(pattern: pattern)
        let range = NSRange(string.startIndex..., in: string)
        let matches = regex?.matches(in: string, range: range) ?? []
        return matches.map {
            String(string[Range($0.range, in: string)!]).lowercased()
        }
    }

    private static func camelCase(_ value: Any?) -> String {
        guard let raw = value as? String else { return "" }
        let parts = tokenize(raw)
        return parts.enumerated().map { i, part in
            i == 0 ? part : part.capitalized
        }.joined()
    }

    private static func pascalCase(_ value: Any?) -> String {
        guard let raw = value as? String else { return "" }
        return tokenize(raw).map(\.capitalized).joined()
    }

    private static func snakeCase(_ value: Any?) -> String {
        guard let raw = value as? String else { return "" }
        return tokenize(raw).joined(separator: "_")
    }

    private static func kebabCase(_ value: Any?) -> String {
        guard let raw = value as? String else { return "" }
        return tokenize(raw).joined(separator: "-")
    }
}

extension String {
    fileprivate func pluralized() -> String {
        if hasSuffix("y") {
            return dropLast() + "ies"
        } else if hasSuffix("s") {
            return self + "es"
        } else {
            return self + "s"
        }
    }
}
