//
//  SwiftUIFormView.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/7/7.
//  Copyright © 2020 蔡强. All rights reserved.
//

import SwiftUI

struct SwiftUIFormView: View {
    var body: some View {
        Form {
            Section{
                Text("这个是Form")
                    .font(.title)
                Text("您可以在这个位置放置任何控件")
                Text("cell会自动适配内容")
                Text("请记住，这个不过是一个View里面放了另外一个View")
            }.padding(.init(top: 100, leading: 10, bottom: 10, trailing: 0))
            Section {
                Text("限制")
                    .font(.title)
                Text("有内置的边距很难避免。看看下面的颜色，您可以看到边距在哪里")
                Color.purple
                    .frame(width: 100, height: 40)
                    .padding(.init(top: 20, leading: 10, bottom: 20, trailing: 20))
            }
        }
    }
}

struct SwiftUIFormView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIFormView()
    }
}
