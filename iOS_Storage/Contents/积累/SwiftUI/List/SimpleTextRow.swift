//
//  SimpleTextRow.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/7/10.
//  Copyright © 2020 蔡强. All rights reserved.
//

import SwiftUI

struct SimpleTextRow: View {
    
    var title: String
    
    var body: some View {
        Text("hello \(title)")
    }
}

struct SimpleTextRow_Previews: PreviewProvider {
    static var previews: some View {
        SimpleTextRow(title: "")
    }
}
