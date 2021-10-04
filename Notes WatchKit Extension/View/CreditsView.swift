//
//  CreditsView.swift
//  Notes WatchKit Extension
//
//  Created by Oğuz Kaya on 4.10.2021.
//

import SwiftUI

struct CreditsView: View {
    @State private var randomNum: Int = Int.random(in: 1..<4 )
    
    private var randomImage : String {
        return "developer-no\(randomNum)"
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 3) {
            //PROFILE IMAGE
            Image(randomImage)
                .resizable()
                .scaledToFit()
                .layoutPriority(1.0)
            //HEADER
            Header(title: "credits")
            // CONTENT
            Text("Oguz Kaya")
                .foregroundColor(.primary)
                .fontWeight(.bold)
            Text("Developer")
                .font(.footnote)
                .foregroundColor(.secondary)
                .fontWeight(.light)
        }//: VStack
    }
}

struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView()
    }
}
