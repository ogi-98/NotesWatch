//
//  Note.swift
//  Notes WatchKit Extension
//
//  Created by Oğuz Kaya on 4.10.2021.
//

import Foundation

struct Note: Identifiable, Codable {
    let id: UUID
    let text: String
}
