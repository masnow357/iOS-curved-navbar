//
//  ContentView.swift
//  iOS curved navbar
//
//  Created by Jonathan Triana on 13/04/26.
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

struct ContentView: View {
    @State var selected: BottomBarItem = .list
    var body: some View {
        HStack(spacing: 0) {
            ForEach(BottomBarItem.allCases, id: \.self){ item in
                CurvedCutButtonView(item: item, isActive: selected == item){
                    selected = item
                }
            }
        }
    }
}

#Preview {
    VStack{
        ContentView()
    }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
    .background(Color.gray.opacity(0.2))
    
}
