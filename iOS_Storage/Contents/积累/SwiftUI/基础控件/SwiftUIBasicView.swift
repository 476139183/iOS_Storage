//
//  SwiftUIBasicView.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/7/5.
//  Copyright © 2020 蔡强. All rights reserved.
//

import SwiftUI

struct SwiftUIBasicView: View {
    var body: some View {
        HStack(alignment: .bottom, spacing: 20) {
            
            VStack {
                Image(systemName: "bolt")
                    .resizable()
                    .frame(width: 40, height: 40)
                Text("  因缺思厅233, World!  ")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding(.vertical, 12.0)
                    .background(Color.orange)
                    .border(Color.green, width: 2)
                    .cornerRadius(20)
                    .padding(EdgeInsets.init(top: 10, leading: 20, bottom: 10, trailing: 20))
                ZStack {
                    Image("iu")
                    .resizable()
                        .clipShape(Circle())
                    .frame(width: 100, height: 100)
                        .shadow(radius: 10)
                    ZStack {
                        Rectangle()
                        .frame(width: 100, height: 40, alignment: .top)
                            .foregroundColor(Color.green.opacity(0.5))
                        Text("iu")
                            .font(.title)
                            .frame(width: 100, height: 40, alignment: .center)
                    }.offset(y: -30)
                }
            }
            .background(Color.yellow)
            .padding(.init(top: 0, leading: 10, bottom: 50, trailing: 0))
            
            VStack {
                // 纯文本button
                Button(action: {
                    print("click")
                }) {
                    Text("button")
                        .foregroundColor(.blue)
                        .background(Color.orange)
                        .padding(.init(top: 10, leading: 20, bottom: 10, trailing: 20))
                }
                .padding()
                .background(Color.gray)
                .cornerRadius(8)
                .border(Color.green, width: 3)
                
                // image
                Image("iu_header")
                .resizable()
                .frame(width: 100, height: 50, alignment: .center)
                    .cornerRadius(8)
                    .shadow(color: .pink, radius: 8)
                
                VStack {
                    // 图片按钮
                    Button(action: {}) {
                        HStack {
                            Image(systemName: "rectangle.grid.1x2.fill")
                            Text("按钮2")
                        }
                        .padding()
                        .background(Color.yellow)
                    }
                    
                    // 图片按钮
                    Button(action: {}) {
                        HStack {
                            Image("iu")
                                .resizable()
                                .frame(width: 30, height: 30)
                            Text("按钮2")
                        }
                        .padding()
                        .background(Color.yellow)
                    }
                    
                    Text("label")
                }
                
            }
            .padding(.init(top: 30, leading: 0, bottom: 30, trailing: 10))
            
            Spacer() // 填充
            
        }
    }
}

struct SwiftUIBasicView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIBasicView()
    }
}
