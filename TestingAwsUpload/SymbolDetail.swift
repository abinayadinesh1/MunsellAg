//
//  SymbolDetail.swift
//  TestingAwsUpload
//
//  Created by Abinaya on 5/26/23.
//

import Foundation
import SwiftUI

struct SymbolDetail: View {
    var symbol: CoverImage

    var body: some View {
        VStack {
            Text(symbol.name)
                .font(.system(.largeTitle, design: .rounded))

            symbol.cover
                .resizable()
                .scaledToFit()
                .symbolRenderingMode(.hierarchical)
                .foregroundColor(.accentColor)
        }
        .padding()
    }
}

//struct SymbolDetail: View {
//    var symbol: Symbol
//
//
//    var body: some View {
//        VStack {
//            Text(symbol.name)
//                .font(.system(.largeTitle, design: .rounded))
//
//            Image(systemName: symbol.name)
//                .resizable()
//                .scaledToFit()
//                .symbolRenderingMode(.hierarchical)
//                .foregroundColor(.accentColor)
//        }
//        .padding()
//    }
//}


struct Details_Previews: PreviewProvider {
    static var previews: some View {
        SymbolDetail(symbol: CoverImage(name: "New Cutie", cover: Image("hb1")))
//        SymbolDetail(symbol: Symbol(name: "magnifyingglass"))
    }
}
