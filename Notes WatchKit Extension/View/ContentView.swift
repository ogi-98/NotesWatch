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
    func getDocumentDirectory() -> URL {
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return path[0]
    }
    
    func saveNotes() {
//        dump(notes)
        DispatchQueue.main.async {
            do {
                // 1. convert the otes array to data with JSONEncoder
                let data = try JSONEncoder().encode(notes)
                // 2. create a new URL to save the file using getDocumentDirectory
                let url = getDocumentDirectory().appendingPathComponent("notes")
                // 3. write the data to given URL
                try data.write(to: url)
            } catch  {
                print("saving data is faild")
            }
        }
    }
    
    func loadNotes() {
        DispatchQueue.main.async {
            do {
                // 1. Get the notes URL path
                let url = getDocumentDirectory().appendingPathComponent("notes")
                // 2. Create a new property for the data
                let data = try Data(contentsOf: url)
                // 3. Decode the data
                notes = try JSONDecoder().decode([Note].self, from: data)
            } catch {
            
            }
        }
    }
    func deleteNote(offSets: IndexSet) {
        withAnimation {
            notes.remove(atOffsets: offSets)
            saveNotes()
        }
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
            
            if notes.count >= 1 {
                List {
                    ForEach(0..<notes.count, id: \.self) { i in
                        HStack {
                            Capsule()
                                .frame(width: 4)
                                .foregroundColor(.accentColor)

                            Text(notes[i].text)
                                .lineLimit(1)
                                .padding(.leading, 5)
                        }//: HStack
                    }//: Loop
                    .onDelete { indexNum in
                        deleteNote(offSets: indexNum)
                    }
                }
            } else {
                Spacer()
                Image(systemName: "note.text")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.gray)
                    .opacity(0.25)
                    .padding(20)
                Spacer()
            }//: List
        }//: VStack
        .navigationTitle("Notes")
//        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            loadNotes()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
