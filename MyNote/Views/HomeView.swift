//
//  ContentView.swift
//  MyNote
//
//  Created by Abiodun Osagie on 21/04/2025.
//

import SwiftUI

struct HomeView: View {
    // MARK: - PROPERTIES
    
    @State private var notes: [NoteModel] = []
    
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
                if notes.isEmpty {
                    VStack{
                        Image(systemName: "note.text")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 60, height: 60)
                            .foregroundStyle(.gray)
                        
                        Text("No notes yet")
                            .font(.headline)
                            .foregroundStyle(.gray)
                        Text("Tap the + button to create your first note.")
                            .font(.caption)
                            .foregroundStyle(.gray)
                    }
                    .multilineTextAlignment(.center)
                } else {
                    VStack {
                        List {
                            ForEach(notes) { note in
                                Button {
                                    noteToEdit = note
                                } label: {
                                    TaskView(note: note) {
                                        toggleComplete(note: note)
                                    }
                                    .foregroundStyle(.black)
                                }
                            }//: LOOP
                            .onDelete(perform: delete)
                        }
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
    private func delete(at offsets: IndexSet) {
        notes.remove(atOffsets: offsets)
    }
    private func toggleComplete(note: NoteModel) {
        guard let index = notes.firstIndex(of: note) else { return }
        notes[index].isCompleted.toggle()
    }

}

#Preview {
    HomeView()
}



