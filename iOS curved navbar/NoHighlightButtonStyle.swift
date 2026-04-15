//
//  NoHighlightButtonStyle.swift
//  iOS curved navbar
//
//  Created by Jonathan Triana on 15/04/26.
//

import SwiftUI

struct NoHighlightButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
    }
}
