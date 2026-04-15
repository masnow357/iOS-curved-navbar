//
//  CurvedCutButtonView.swift
//  iOS curved navbar
//
//  Created by Jonathan Triana on 15/04/26.
//

import SwiftUI

struct CurvedCutButtonView: View {
    
    let item: BottomBarItem
    let isActive: Bool
    let action: () -> Void
    
    var notchDepth: CGFloat {
        isActive ? 1 : 0
    }

    var body: some View {
        Button(
            action: action
        ){
            ZStack(alignment: .top) {
                
                ZStack(alignment: .top) {
                    
                    VStack(spacing: 10) {
                        Text(item.label)
                            .padding(.top, 40-(40*notchDepth))
                    }
                    .frame(maxWidth: .infinity, maxHeight: 100)
                    .background(Color.white)
                    .foregroundStyle(Color.black)
                    
                    BottomBarShape(notchDepth: notchDepth)
                        .fill(Color.black)
                        .blendMode(.destinationOut)
                    
                }.compositingGroup()
                
                item.icon
                    .frame(width: 50, height: 50)
                    .background(Color.white)
                    .clipShape(
                        Circle()
                    )
                    .offset(y: 10-40*notchDepth)
                    .foregroundStyle(Color.black)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: 100)
        .animation(.easeInOut(duration: 0.4), value: isActive)
        .buttonStyle(NoHighlightButtonStyle())
    }
}

#Preview {
    VStack{
        CurvedCutButtonView(item: .list, isActive: true, action: {}).frame(width: 150)
    }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
    .background(Color.gray.opacity(0.2))
    
}
