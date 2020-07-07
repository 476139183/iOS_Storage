//
//  SFSymbolsView.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/7/7.
//  Copyright © 2020 蔡强. All rights reserved.
//

import SwiftUI

struct SFSymbolsView: View {
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "heart.fill")
                    .imageScale(.small)
                Text("Small")
            }
            HStack {
                Image(systemName: "heart.fill")
                    .imageScale(.medium)
                Text("Medium")
            }
            HStack {
                Image(systemName: "heart.fill")
                    .imageScale(.large)
                Text("Large")
            }
        }
    }
}

struct SFSymbolsView_Previews: PreviewProvider {
    static var previews: some View {
        SFSymbolsView()
    }
}
