//
//  ObjectNote.swift
//  Note App
//
//  Created by Lê Văn Huy on 29/08/2022.
//

import Foundation
import Combine

class ObjectNote: ObservableObject, Equatable,Identifiable {
    
    static func == (lhs: ObjectNote, rhs: ObjectNote) -> Bool {
        return lhs.id == rhs.id
    }
    
    @Published var id: UUID = UUID()
    @Published var title: String
    @Published var note: String
    @Published var date_created: Date
    @Published var last_edition: Date
    init(title:String = "title",note: String = "note", date_created: Date = Date(), last_edition: Date = Date()){
        self.title = title
        self.note = note
        self.date_created = date_created
        self.last_edition = last_edition
    }
    
    
}

