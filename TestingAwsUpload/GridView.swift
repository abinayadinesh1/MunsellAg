// your experiments
// cover image for expiremtn, name of experiment/location ("Tomato Garden Bed")
// click on experiment, get name, details, date started experiment, water schedule, etc.
// see all the samples you've uploaded
// be able to click on an example and view data
// be able to make a new example

//sample: when upload a picture, needs to be sent to aws so we can do processing on that image




//
//GridView.swift
//TestingAwsUpload
//
//Created by Abinaya on 4/30/23.

import SwiftUI


struct GridView: View {
    @State private var experiments: [Experiment] = []
    @State private var individualPlots: [Sample] = []
    @State var updatedIndividualPlots: [Sample] //cant be private
    @State private var showAll = false
    var items = Array(1...20) // Replace this with your array of items

    var body: some View {
        NavigationView{
            ScrollView{
            VStack {
                Text("Your Experiments").font(.largeTitle).padding(.top)
                if individualPlots.isEmpty && updatedIndividualPlots.isEmpty{
                    Text("No individual plots created")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .padding()
                } else {
                    ScrollView {
                        LazyVGrid(columns: [GridItem(.flexible())], spacing: 10) {
                            ForEach(individualPlots) { plot in
                                Image(uiImage: plot.image)
                            }
                        }
                    }
                }
                Text("Where is this?")
                NavigationLink("Create a new plot", destination: Sample(updatedIndividualPlots: $updatedIndividualPlots))
                    .navigationBarTitleDisplayMode(.inline)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .font(.system(size: 20, weight: .medium, design: .rounded)).navigationBarHidden(true)
                
            }.navigationBarHidden(true).navigationBarTitleDisplayMode(.inline).navigationBarTitle("")
        }
        }.navigationBarHidden(true).navigationBarTitleDisplayMode(.inline).navigationBarTitle("")

    }
    
//        VStack {
//            if showAll {
//                // Display the entire grid
//                grid(Array(items))
//            } else {
//                // Display only three columns with one row
//                grid(Array(items.prefix(3)))
//            }
//
//            Button(action: {
//                showAll.toggle()
//            }) {
//                Text(showAll ? "Show Fewer" : "Show All")
//                    .padding()
//                    .background(Color.blue)
//                    .foregroundColor(.white)
//                    .cornerRadius(10)
//            }
//            Text("Analytics").font(.title).foregroundColor(.green)
//            HStack {
//                Rectangle()
//                    .fill(.green)
//                    .frame(width: 200, height: 200)
//                Rectangle()
//                    .fill(.green)
//                    .frame(width: 200, height: 200)
//            }.foregroundColor(.mint)
//        }
//        .padding()
    
    func grid(_ items: [Int]) -> some View {
        let rows = (items.count + 2) / 3
        
        return LazyVGrid(columns: Array(repeating: .init(.flexible()), count: 3), spacing: 10) {
            ForEach(items, id: \.self) { item in
            }
            
            // Add empty cells to fill up the last row if necessary
            ForEach(0..<(rows * 3 - items.count), id: \.self) { _ in
                Color.clear
            }
        }
    }
}

struct TestPlot: View {
    let item: Int
    
    var body: some View {
        // Replace this with your custom view implementation for each item
        Text("Item \(item)")
            .frame(maxWidth: .infinity, maxHeight: 100)
            .background(Color.gray)
            .cornerRadius(10)
            .padding()
    }
}





//import Foundation
//import Amplify
//import SwiftUI
//import AmplifyImage
//
//struct GridView: View {
//
//    let columns : [GridItem]
//    let showAll : Bool
//    let plots : [IndividualPlot] = Array(IndividualPlot(plotTitle: " ", previewImage: "pos_logo_2"), IndividualPlot(plotTitle: " ", previewImage: "pos_logo_2"))
//    var counter : Int = 0
//
//    var body: some View{
//        LazyVGrid(columns: columns) {
//            plots.forEach{ plot in
//
//            }
////            ForEach(0...2, id: \.self) { value in
////                counter += 1
////                if(counter > 2 && showAll == false) {
////                    break
////                }
////            }
//        }
////        ScrollView{
////            LazyVGrid(columns: columns) {
////                ForEach(imageKeys, id: \.self) {key in
//////                    Text(key[0..<9])
////                    AmplifyImage(key:key).scaleToFillWidth().padding(15)
////                }
////            }
////        }.onAppear(perform: getImageKeys)
//    }
//
////    func getImageKeys() {
////        Amplify.Storage.list { result in
////            if case .success(let storageResult) = result {
////                self.imageKeys = storageResult.items.map(\.key).filter{ $0.isEmpty == false}
////            }
////
////        }
////    }
//}
//
//
