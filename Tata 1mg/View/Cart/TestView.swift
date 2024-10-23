//
//  TestView.swift
//  Tata 1mg
//
//  Created by Yashom on 23/10/24.
//

import SwiftUI

struct TestView: View {
    @State private var showDetail = false
        
        var body: some View {
            VStack {
                Button("Go to Detail") {
                    showDetail = true
                }
            }
            .bgNavLink(content: DetailView(), isAction: $showDetail)
        }
}

struct DetailView: View {
    var body: some View {
        Text("Detail View")
            .navigationTitle("Detail")
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
