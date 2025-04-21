//
//  NoteModel.swift
//  MyNote
//
//  Created by Abiodun Osagie on 21/04/2025.
//

import Foundation

struct NoteModel: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let type: NoteType
    let date: Date
    var isCompleted: Bool = false
    var displayDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        return dateFormatter.string(from: date)
    }
}
