//
//  ContentView.swift
//  Notes WatchKit Extension
//
//  Created by Oğuz Kaya on 4.10.2021.
//

import SwiftUI

struct ContentView: View {
    //MARK: - PROPERTY
    @State private var notes: [Note] = [Note]()
    @State private var text: String = ""
    
    
    //MARK: - FUNCS
    func saveNotes() {
        dump(notes)
    }
    
    //MARK: - BODY
    var body: some View {
        VStack {
            HStack(alignment: .center, spacing: 6) {
                TextField("Add new note", text: $text)
                
                Button {
                    // 1. check textfield is not empty
                    guard text.isEmpty == false else { return }
                    // 2. create new note item with text value
                    let note = Note(id: UUID(), text: text)
                    // 3. add (append) new note into the note array
                    notes.append(note)
                    // 4. textfield empty
                    text = ""
                    // 5. save the notes
                    saveNotes()
                } label: {
                    Image(systemName: "plus.circle")
                        .font(.largeTitle)
                        
                }
                .fixedSize()
                .buttonStyle(.plain)
                .foregroundColor(.accentColor)
//                .buttonStyle(.bordered)
//                .tint(.accentColor)
//                .buttonStyle(BorderedButtonStyle(tint: .accentColor))

            }//: HStack
            Spacer()
            
            Text("\(notes.count)")
        }//: VStack
        .navigationTitle("Notes")
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
