//
//  ContentView.swift
//  MyNote
//
//  Created by Abiodun Osagie on 21/04/2025.
//

import SwiftUI

struct HomeView: View {
    // MARK: - PROPERTIES
    
    @State private var notes: [NoteModel] = [
        NoteModel(
            title: "Learn SwiftUI",
            type: .urgent,
            date: Date(),
            isCompleted: true,
        ),
        NoteModel(title: "Finishing a course today and i will definitly figure out the code too",
                  type: .optional, date: Date(),
                  isCompleted: false,
                 )
    ]
    
    @State private var showEditNoteView = false
    @State private var noteToEdit: NoteModel?
    
    fileprivate func FloatingButton() -> some View {
        VStack {
            Spacer()
            NavigationLink {
                AddNote(notes: $notes)
            } label: {
                Image(systemName: "plus")
                    .font(.title)
                    .frame(width: 70, height: 70)
                    .foregroundStyle(.white)
                   
                  
            }
            .background(Color.primaryLightGreen)
            .clipShape(Circle())
        }
    }
    
    // MARK: - COMPUTED FUNCTIONS

    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    List {
                        ForEach(notes) { note in
                            Button {
                                noteToEdit = note
                            } label: {
                                NoteView(note: note)
                                    .foregroundStyle(.black)
                            }
                           

                        }//: LOOP
                    }
                }//: VSTACK
                FloatingButton()
                .navigationTitle("Task")
                .navigationDestination(item: $noteToEdit, destination: { noteToEdit in
                    AddNote(notes: $notes, noteToEdit: noteToEdit)
                })
                .navigationDestination(
                    isPresented: $showEditNoteView) {
                        AddNote(notes: $notes)
                    }
            }//: ZSTACK
        }//: NAVIGATION STACK
       
    }
}

#Preview {
    HomeView()
}


struct NoteView: View {
    let note: NoteModel
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                HStack {
                    Image(
                        systemName:note.isCompleted ? "checkmark.circle.fill" : "circle"
                    )
                    .foregroundStyle(note.isCompleted ? .green : .red)
                    Text(note.title)
                        .font(.headline)
                        .lineLimit(1)
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
