//
//  PrimaryButton.swift
//  DesignSystem
//
//  Created by Ajay Odedara on 09/05/2026.
//

import SwiftUI

struct PrimaryButtonSwiftUI: View {
    let title: String
    let action: () -> Void
 
    var body: some View {
        Button(title, action: action)
            .buttonStyle(PrimaryButtonStyle())
    }
}
