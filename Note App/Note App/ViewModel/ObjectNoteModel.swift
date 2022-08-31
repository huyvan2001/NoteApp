//
//  ObjectNoteModel.swift
//  Note App
//
//  Created by Lê Văn Huy on 29/08/2022.
//

import Foundation

class ObjectNoteModel: ObservableObject,Identifiable{
    @Published var searchText = ""
    @Published var importantNode = [ObjectNote]()
    @Published var data: [ObjectNote] = [
        .init(title: "Hello", note: "I am UX UI Designer",importantNote:false, date_created: Date(), last_edition: Date()),
        .init(title: "Spend", note: "I spend so much time",importantNote:false ,date_created: Date(), last_edition: Date()),
        .init(title: "Timeline", note: "Hehehheheeh",importantNote:false ,date_created: Date(), last_edition: Date())
    ]
    func addNewObjectNote(_ objectNote: ObjectNote){
        data.insert(objectNote, at: 0)
        print(data)
    }
    func deleteObjectNote(_ objectNote: ObjectNote){
       
        
        guard let index = data.firstIndex(where: { item in
            item == objectNote
        }) else { return}
        
        data.remove(at: index)
    }
    func getObject(id: UUID){
    }
    func updateObjectNote(id: UUID,title: String, note: String,important_Note: Bool, last_edition: Date){
        guard let objectNote = data.first(where: { item in
            item.id == id
        })
        else {return}
        objectNote.title = title
        objectNote.note = note
        objectNote.importantNote = important_Note
        objectNote.last_edition = last_edition
    }
    func searchNote() -> [ObjectNote] {
        if searchText.isEmpty{
            return data
        }
        else {
            return data.filter({
                $0.title.contains(searchText) || $0.note.contains(searchText)
            })
        }
    }
    func noteImportant(){
        importantNode = data.filter({ object in
            object.importantNote == true
        })
        objectWillChange.send()
    }
    func deleteNoteImportant(_ objectNote: ObjectNote){
        guard let index = importantNode.firstIndex(where: { item in
            item == objectNote
        }) else { return}
        
        importantNode.remove(at: index)
    }
}
