//
//  ImportantNoteView.swift
//  Note App
//
//  Created by Lê Văn Huy on 30/08/2022.
//

import SwiftUI

struct ImportantNoteView: View {
    @EnvironmentObject var viewModel: ObjectNoteModel
    var body: some View {
        VStack{
            HeaderView(text: "Important Notes")
            ScrollView{
                LazyVStack{
                    ForEach(viewModel.importantNode,id:\.id){ object in
                        NavigationLink {
                            AddView(objectNote: object,id: object.id)
                        } label: {
                            NoteRow(objectNote: object)
                        }
                        
                    }
                }
            }
            Spacer()
        }
        .navigationBarTitleDisplayMode(.inline)
        
    }
}

struct ImportantNoteView_Previews: PreviewProvider {
    static var previews: some View {
        ImportantNoteView()
            .environmentObject(ObjectNoteModel())
    }
}
