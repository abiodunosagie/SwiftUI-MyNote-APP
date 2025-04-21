//
//  AddNote.swift
//  MyNote
//
//  Created by Abiodun Osagie on 21/04/2025.
//

import SwiftUI

struct AddNote: View {
    // MARK: - PROPERTIES
    
    @State private var selectedNotePriority: NoteType = .normal
    @State private var notetitle = ""
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showAlert = false
    @Binding var notes: [NoteModel]
    var noteToEdit: NoteModel?
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Task title")
                .font(.system(size: 20, weight: .semibold))
            TextField("Title", text: $notetitle)
                .font(.system(size: 15))
                .textFieldStyle(.roundedBorder)
                .autocapitalization(.none)
                .padding(.bottom, 30)
            Text("Priority")
                .font(.system(size: 20, weight: .semibold))
            Picker(
                "Choose priority",
                selection: $selectedNotePriority) {
                    ForEach(NoteType.allCases) { noteType in
                        Text(noteType.displayText)
                            .tag(noteType)
                    }
                }//: PICKER
            Button {
                guard notetitle.count >= 2 else {
                    alertTitle = "Invalid note title"
                    alertMessage = "Note title must be 2 or more characters long please."
                    showAlert = true
                    return
                }
                
                let note = NoteModel(
                    title: notetitle,
                    type: selectedNotePriority,
                    date: Date(),
                    isCompleted: false
                )
                
                notes.append(note)
                
                dismiss()
                
            } label: {
                Text(noteToEdit == nil ? "Create" : "Update")
                    .font(.system(size: 15, weight: .semibold))
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(.primaryLightGreen)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
            }
            Spacer()

        }
        .onAppear(perform: {
            if let noteToEdit = noteToEdit {
                notetitle = noteToEdit.title
                selectedNotePriority = noteToEdit.type
            }
        })
        .padding()
        .alert(alertTitle, isPresented: $showAlert) {
            Button {
                
            } label: {
                Text("Okay")
            }

        } message: {
            Text(alertMessage)
        }

        
    }
}

#Preview {
    AddNote(notes: .constant([]))
}
