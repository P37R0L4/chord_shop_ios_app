//
//  GradientView.swift
//  ChordShop
//
//  Created by Lucas Petrola on 01/09/23.
//

import SwiftUI

func LinearGradientBackgroundView () -> any ShapeStyle {
        LinearGradient(
            colors: [
                .pink,
                .blue
            ],
            startPoint: .leading,
            endPoint: .trailing
        )
}
