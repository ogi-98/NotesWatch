//
//  SettingsView.swift
//  Notes WatchKit Extension
//
//  Created by Oğuz Kaya on 4.10.2021.
//

import SwiftUI

struct SettingsView: View {
    //MARK: - PROPERTY
    @AppStorage("lineCount") var lineCount: Int = 1
    @State private var value: Float = 1.0
    
    //MARK: - FUNCS
    
    func updateLineCount(){
        lineCount = Int(value)
    }
    
    //MARK: - BODY
    var body: some View {
        VStack(alignment: .center, spacing: 8) {
            // HEADER
            Header(title: "settings")
            // ACTUAL LINE COUNT
            Text("Lines: \(lineCount)".uppercased())
                .fontWeight(.semibold)
            // SLIDER
            Slider(value: Binding(get: {
                self.value
            }, set: { (newValue) in
                self.value = newValue
                updateLineCount()
            }), in: 1...4, step: 1)
                .tint(.accentColor)
           
            
            
        }//: VStack
        .onAppear {
            value = Float(lineCount)
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
