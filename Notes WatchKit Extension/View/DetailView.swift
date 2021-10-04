//
//  DetailView.swift
//  Notes WatchKit Extension
//
//  Created by Oğuz Kaya on 4.10.2021.
//

import SwiftUI

struct DetailView: View {
    //MARK: - Property
    let note: Note
    let count: Int
    let index: Int
    
    
    
    
    
    //MARK: - Body
    var body: some View {
        VStack(alignment: .center, spacing: 3) {
            //Header
            HStack {
                Capsule()
                    .frame(height: 1)
                
                Image(systemName: "note.text")
                
                Capsule()
                    .frame(height: 1)
                
            }//: HStack
            .foregroundColor(.accentColor)
            //content
            Spacer()
            
            ScrollView(.vertical) {
                Text(note.text)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
            }
            
            Spacer()
            //footer
            HStack(alignment: .center) {
                Image(systemName: "gear")
                    .imageScale(.large)
                
                Spacer()
                
                Text("\(count) / \(index + 1)")
                
                Spacer()
                
                Image(systemName: "info.circle")
                    .imageScale(.large)
                
                
            }//: HStack
            .foregroundColor(.secondary)
            
        }//: VStack
        .padding() //3
    }
}

struct DetailView_Previews: PreviewProvider {
    static var sampleData: Note = Note(id: UUID(), text: "SwiftUI Sample Text")
    
    static var previews: some View {
        DetailView(note: sampleData, count: 5, index: 1)
    }
}
