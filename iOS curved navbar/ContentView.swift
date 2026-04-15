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
                backgroundButton(item, isActive: selected == item){
                    selected = item
                }
            }
        }
    }
}

@ViewBuilder
func backgroundButton(_ item: BottomBarItem, isActive: Bool, action: @escaping () -> Void) -> some View {
    Button(
        action: action
    ){
        ZStack(alignment: .top) {
            
            ZStack(alignment: .top) {
                
                VStack(spacing: 10) {
                    if !isActive {
                        item.icon
                    }
                    Text(item.label)
                }
                .frame(maxWidth: .infinity, maxHeight: 100)
                .background(Color.white)
                .foregroundStyle(Color.black)
                
                if isActive {
                    BottomBarShape()
                        .fill(Color.black)
                        .blendMode(.destinationOut)
                }
                
            }.compositingGroup()
            
            if isActive {
                item.icon
                    .frame(width: 50, height: 50)
                    .background(Color.white)
                    .clipShape(
                        Circle()
                    )
                    .offset(y: -30)
                    .foregroundStyle(Color.black)
            }
        }
    }.frame(maxWidth: .infinity, maxHeight: 100)
}

struct BottomBarShape: Shape {
    
    func path(in rect: CGRect) -> Path {
        
        var path = Path()

        let base = rect.width/6
        let x2 = base * 2
        let x3 = base * 3
        let x4 = base * 4
        let x5 = base * 5
        let x6 = base * 6

        path.move(to: CGPoint(x: 0, y: 0))
        
        path.addQuadCurve(
            to: CGPoint(x: x2, y: base),
            control: CGPoint(x: base, y: 0)
        )
        
        path.addQuadCurve(
            to: CGPoint(x: x4, y: base),
            control: CGPoint(x: x3, y: x2)
        )
        
        path.addQuadCurve(
            to: CGPoint(x: x6, y: 0),
            control: CGPoint(x: x5, y: 0)
        )
        
        
        path.closeSubpath()

        return path
    }
}

#Preview {
    VStack{
        ContentView()
    }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
    .background(Color.gray.opacity(0.2))
    
}

#Preview {
    VStack{
        BottomBarShape()
        .fill(Color.gray)
        .frame(height: 90)
    }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
    .background(Color.gray.opacity(0.2))
    
}
