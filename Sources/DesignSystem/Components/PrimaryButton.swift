//
//  Untitled.swift
//  DesignSystem
//
//  Created by Ajay Odedara on 09/05/2026.
//

import UIKit

public class PrimaryButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        self.setTitle("Primary Button", for: .normal)
        self.setTitleColor(Design.Colors.System.label, for: .normal)
        self.backgroundColor = Design.Colors.System.fill
        self.titleLabel?.font = Design.PrimaryFont.smRegular
        self.layer.cornerRadius = Design.Measurements.CornerRadius.lg
    }
}
