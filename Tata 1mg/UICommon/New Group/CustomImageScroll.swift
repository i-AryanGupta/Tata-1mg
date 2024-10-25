//
//  CustomImageScroll.swift
//  Tata 1mg
//
//  Created by Yashom on 25/10/24.
//

import SwiftUI

import SwiftUI

struct CustomImageScroll: View {
    let imageNames: [String]
    @State private var currentIndex = 0
    let timer = Timer.publish(every: 2, on: .main, in: .common).autoconnect()

    var body: some View {
        ScrollViewReader { proxy in
            ScrollView(.horizontal, showsIndicators: true) {
                HStack(spacing: 20) {
                    ForEach(imageNames.indices, id: \.self) { index in
                        Image(imageNames[index])
                            .resizable()
                            //.aspectRatio(contentMode: .fill)
                            .scaledToFit()
                            .frame(width: 375, height: 200)
                            .clipped()
                            .cornerRadius(18)
                            .id(index) // Set an ID to use with ScrollViewReader
                            .padding(.leading, index == 0 ? 20 : 0) // First image padding on the left
                            .padding(.trailing, index == imageNames.count - 1 ? 20 : 0) // Last image padding on the right
                    }
                }
            }
            .frame(height: 200)
            .onReceive(timer) { _ in
                withAnimation {
                    currentIndex = (currentIndex + 1) % imageNames.count
                    proxy.scrollTo(currentIndex, anchor: .center)
                }
            }
        }
    }
}

struct CustomImageScroll_Previews: PreviewProvider {
    static var previews: some View {
        CustomImageScroll(imageNames: ["hair_poster", "med_poster", "fever_poster", "equip_poster"])
    }
}

