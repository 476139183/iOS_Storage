//
//  SwiftUIListView.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/7/6.
//  Copyright © 2020 蔡强. All rights reserved.
//

import SwiftUI

private struct PersonInfo: Identifiable, Hashable {
    var id = UUID()
    var name = ""
}

struct SwiftUIListView: View {
    
    @State private var persons = [PersonInfo(name: "Jack"),
                                  PersonInfo(name: "Ben"),
                                  PersonInfo(name: "Bob")]
    
    @State private var title = "List"
    
    var body: some View {
        NavigationView {
            List {
                ForEach(persons, id: \.self) { person in
                    SimpleTextRow(title: person.name)
                }
            }
            .navigationBarTitle(title)
            .navigationBarItems(
                leading: Button(action: {
                    self.persons.removeLast()
                    self.title = "删除了"
                }, label: {
                    Text("删除一个person")
                }),
                trailing: Button(action: {
                    self.persons.append(PersonInfo(name: "new"))
                    self.title = "添加了"
                }, label: {
                    Text("添加一个person")
                })
            )
        }
    }
}

struct SwiftUIListView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIListView()
    }
}
