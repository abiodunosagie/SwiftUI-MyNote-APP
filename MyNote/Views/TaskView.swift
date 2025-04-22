//
//  NotesView.swift
//  MyNote
//
//  Created by Abiodun Osagie on 21/04/2025.
//

import SwiftUI

struct TaskView: View {
    let note: NoteModel
    let onToggleComplete: () -> Void
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                HStack {
                    Image(
                        systemName:note.isCompleted ? "checkmark.circle.fill" : "circle"
                    )
                    .foregroundStyle(note.isCompleted ? .green : .red)
                    .onTapGesture {onToggleComplete()}
                    Text(note.title)
                        .font(.headline)
                }
                Text(note.displayDate)
                    .font(.caption)
                    .foregroundStyle(.gray)
            }
            
            
            Spacer()
            Text(note.type.displayText)
                .font(.caption)
                .foregroundStyle(note.type.color)
                .fontWeight(.bold)
                .padding(.horizontal, 12)
                .padding(.vertical, 6)
                .background(note.type.color.opacity(0.2))
                .clipShape(Capsule())
            
        }
    }
}

