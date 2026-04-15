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
    
    var body: some View {
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
}

#Preview {
    VStack{
        CurvedCutButtonView(item: .list, isActive: true, action: {}).frame(width: 150)
    }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
    .background(Color.gray.opacity(0.2))
    
}
