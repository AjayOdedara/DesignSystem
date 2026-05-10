//
//  AlertView.swift
//  DesignSystem
//
//  Created by Ajay Odedara on 10/05/2026.
//

import SwiftUI

public enum AlertType: String {
    case info
    case success
    case warning
    case error
    
    var accessibilityHint: String {
        switch self {
        case .info:
            return "This is an informational message"
        case .success:
            return "This is a success message"
        case .warning:
            return "This is a warning message"
        case .error:
            return "This is an error message"
        }
    }
}

public struct AlertView<InfoSection: View, Footer: View>: View {
    
    private let title: String
    private let message: String
    private let type: AlertType
    private let footer: Footer
    
    @Environment(\.showBorder) var showBorder: Bool
    
    public init(
        title: String,
        message: String,
        type: AlertType,
        @AlertInfoSectionBuilder infoSection: () -> InfoSection,
        @ViewBuilder footer: () -> Footer,
        
    ) {
        self.title = title
        self.message = message
        self.type = type
        self.footer = footer()
    }
    
    public var body: some View {
        VStack(
            alignment: .leading,
            spacing: 0
        ) {
            Text(title)
                .font(.headline)
            Text(message)
                .font(.subheadline)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            footer
                .padding(.top, 25)
            
        }
        // COmponent responsibility
        .accessibilityElement(children: .combine)
        .accessibilityLabel("\(type.rawValue) alert: \(title). \(message)")
        .accessibilityAddTraits(.isModal)
        .accessibilityHint(type.accessibilityHint)
        
        .padding()
        // .background(type.backgroundColor)
        .cornerRadius(12)
        .shadow(radius: 4)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(
                    // type.borderColor,
                    lineWidth: showBorder ? 1 : 0
                )
        )
        .padding(.horizontal, 20)
    }
}

struct ShowBorder: EnvironmentKey {
    static let defaultValue: Bool = false
}

extension EnvironmentValues {
    var showBorder: Bool {
        get {
            self[ShowBorder.self]
        } set {
            self[ShowBorder.self] = newValue
        }
    }
}

extension View {
    public func showBorder(_ show: Bool) -> some View {
        environment(\.showBorder, show)
    }
}


@resultBuilder
public struct AlertInfoSectionBuilder {
    
    public static func buildBlock() -> EmptyView {
        EmptyView()
    }
    
    public static func buildBlock(
        _ disclaimer: Text
    ) -> some View {
        disclaimer
//            .disclaimerStyle()
    }
    
    public static func buildBlock(
        _ timer: TimerView
    ) -> some View {
        timer
    }
    
    public static func buildBlock(
        _ disclaimer: Text,
        _ timer: TimerView
    ) -> some View {
        VStack(
            alignment: .leading,
            spacing: 12
        ) {
            disclaimer
                //.disclaimerStyle()
            
            timer
        }
    }
}

public struct TimerView: View {
    public var body: some View {
        Text("timer view")
    }
}
