//
//  SwiftUIBindingView.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/7/10.
//  Copyright © 2020 蔡强. All rights reserved.
//

import SwiftUI

struct SwiftUIBindingView: View {
    
    @State var account = ""
    @State var password = ""
    
    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            TextField("请输入账号", text: $account)
                .background(Color.red)
                .padding()
            TextField("请输入密码", text: $password)
                .background(Color.red)
                .padding()
            Button(action: {
                print("click")
            }) {
                Text("button")
            }
            .disabled(account.isEmpty && password.isEmpty)
        }
    }
}

struct SwiftUIBindingView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIBindingView()
    }
}
