//
//  System.swift
//  DesignSystem
//
//  Created by Ajay Odedara on 09/05/2026.
//
import UIKit

extension Design.Colors {
    public enum System {
        public static let fill = UIColor(named: "Fill", in: .module, compatibleWith: nil)!
        public static let background = UIColor(named: "Background", in: .module, compatibleWith: nil)!
        public static let label = UIColor(named: "Label", in: .module, compatibleWith: nil)!
    }
    public enum SystemTints {
        public static let blue = UIColor(named: "Blue", in: .module, compatibleWith: nil)!
    }
}
