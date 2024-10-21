//
//  UIExtensions.swift
//  Tata 1mg
//
//  Created by Yashom on 18/10/24.
//

import SwiftUI

enum Poppins: String{
    case light = "Poppins-Light"
    case regular = "Poppins-Regular"
    case medium = "Poppins-Medium"
    case semiBold = "Poppins-SemiBold"
    case bold = "Poppins-Bold"
}

extension Font{
    
    static func customFont(_ font: Poppins, fontSize: CGFloat) -> Font{
        custom(font.rawValue, size: fontSize)
    }
}


extension Color{
    
    static var primaryText: Color {
        return Color.black
        }
    
    static var secondaryText: Color {
        return Color(red: 248 / 255, green: 151 / 255, blue: 12 / 255)
        
    }
    
    static var btnPrimaryText: Color {
        return Color.white
    }
    
    static var btnSecondaryText: Color {
        return Color.black
    }
    
    static var btnBG: Color {
        return Color(red: 248 / 255, green: 151 / 255, blue: 12 / 255)
    }
    
    static var primaryApp: Color{
        return Color(red: 248 / 255, green: 151 / 255, blue: 12 / 255)
    }
}

extension View{
    func cornerRadius( _ radius: CGFloat, corner: UIRectCorner ) -> some View {
        clipShape( RoundedCorner(radius: radius, corner: corner) )
    }
    
    func bgNavLink(content: some View, isAction: Binding<Bool> ) -> some View {
        return self.background(
            NavigationLink(destination: content, isActive: isAction, label: {
                EmptyView()
            })
        )
    }
    
    var maxCenter: some View {
        return frame(maxWidth: .infinity, alignment: .center)
    }
    
    var maxLeft: some View {
        return frame(maxWidth: .infinity, alignment: .leading)
    }
    
    var maxRight: some View {
        return frame(maxWidth: .infinity, alignment: .trailing)
    }
    
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corner: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corner, cornerRadii: CGSize(width: radius, height: radius))
        
        return Path(path.cgPath)
    }
}

extension CGFloat{
    
    static var screenWidth: Double{
        return UIScreen.main.bounds.size.width
    }
    
    static var screenHight: Double{
        return UIScreen.main.bounds.size.height
    }
    
    static func widthPer(per: Double) -> Double{
        return screenWidth * per
        // 300 * .5 = 50% width return
    }
    
    static func heightPer(per: Double) -> Double{
        return screenHight * per
        // 300 * .5 = 50% height return
    }
}

