//
//  Header.swift
//  Notes WatchKit Extension
//
//  Created by Oğuz Kaya on 4.10.2021.
//

import SwiftUI

struct Header: View {
    
    var title: String = ""
    
    
    var body: some View {
        VStack {
            // TITLE
            if title != "" {
                Text(title.uppercased())
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.accentColor)
            }
            // SEPARATOR
            HStack {
                Capsule()
                    .frame(height: 1)
                
                Image(systemName: "note.text")
                
                Capsule()
                    .frame(height: 1)
                
            }//: HStack
            .foregroundColor(.accentColor)
        }//: VStack
        
    }
}

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Header(title: "Credits")
            Header()
        }
        
    }
}
