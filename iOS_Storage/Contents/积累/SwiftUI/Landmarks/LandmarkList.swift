//
//  LandmarkList.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/7/9.
//  Copyright © 2020 蔡强. All rights reserved.
//

import SwiftUI

struct LandmarkList: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    var body: some View {
        NavigationView {
            List(landmarkData) { landmark in
                NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                    LandmarkRow(landmark: landmark)
                }
            }
            .navigationBarTitle(Text("Landmarks"))
            .navigationBarItems(
                leading: Button(action: {
                    print("返回")
                    self.mode.wrappedValue.dismiss()
                }, label: {
                    Text("返回")
                }),
                trailing: Button(action: {
                    print("详情按钮点击")
                }, label: {
                    Text("详情")
                })
            )
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
            .previewDevice(PreviewDevice(rawValue: "iPhone SE"))
    }
}
