//
//  SearchProductView.swift
//  Tata 1mg
//
//  Created by Yashom on 21/10/24.
//

import SwiftUI

struct SearchBarProductView: View {
    @State private var searchText: String = ""


    var body: some View {
        VStack {
            // Search bar
            HStack {
                TextField("Search for 'Medicine'", text: $searchText)
                    .padding(10)
                    .padding(.horizontal, 25)
                    .background(RoundedRectangle(cornerRadius: 20).stroke(.black))
                    .overlay(
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.black)
                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
                                .padding(.trailing,25)

                            if !searchText.isEmpty {
                                Button(action: {
                                    self.searchText = ""
                                }) {
                                    Image(systemName: "xmark.circle.fill")
                                        .foregroundColor(.gray)
                                        .padding(.trailing, 10)
                                }
                            }
                        }
                    )
                    .padding(.horizontal, 10)
            }
        }

    }
}

struct SearchBarProductView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarProductView()
    }
}
