//
//  NoteType.swift
//  MyNote
//
//  Created by Abiodun Osagie on 21/04/2025.
//

import Foundation
import SwiftUICore

enum NoteType : String, CaseIterable, Identifiable{
    case normal
    case urgent
    case optional
    var id: Self { self }
    
    var color: Color {
        switch self {
        case .normal: return .green
        case .urgent: return .red
        case .optional: return .blue
        }
    }

    var displayText: String {
        switch self {
        case .normal: return "Normal"
        case .urgent: return "Urgent"
        case .optional: return "Optional"
        }
    }
}

