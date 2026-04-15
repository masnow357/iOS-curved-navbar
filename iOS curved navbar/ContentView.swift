//
//  ContentView.swift
//  iOS curved navbar
//
//  Created by Jonathan Triana on 13/04/26.
//

import SwiftUI

struct ContentView: View {
    @State var selected: BottomBarItem = .list
    var body: some View {
        VStack{
            HStack(spacing: 0) {
                ForEach(BottomBarItem.allCases, id: \.self){ item in
                    CurvedCutButtonView(item: item, isActive: selected == item){
                        selected = item
                    }
                }
            }
        }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        .background(Color.gray.opacity(0.2))
        
    }
}

#Preview {
    ContentView()
}
