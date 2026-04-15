//
//  BottomBarItem.swift
//  iOS curved navbar
//
//  Created by Jonathan Triana on 15/04/26.
//

import SwiftUI

enum BottomBarItem: String, CaseIterable {
    case list = "List"
    case scan = "Scan"
    case search = "Search"

    var icon: Image {
        switch self {
        case .list:
            return Image(systemName: "list.bullet")
        case .scan:
            return Image(systemName: "camera")
        case .search:
            return Image(systemName: "magnifyingglass")
        }
    }

    var label: String {
        rawValue
    }

    var route: String {
        rawValue
    }
}
