//
//  NoteRow.swift
//  Note App
//
//  Created by Lê Văn Huy on 29/08/2022.
//

import SwiftUI

struct NoteRow: View {
    @EnvironmentObject var viewModel: ObjectNoteModel
    @StateObject var objectNote: ObjectNote
    
    var body: some View {
        VStack(alignment: .leading){
            VStack(alignment: .leading){
                VStack(alignment: .leading){

                    HStack{
                        Text(objectNote.title)
                            .font(.title)
                            .padding(.bottom,5)
                        Spacer()
                        
                        Button {
                            objectNote.importantNote.toggle()
                            viewModel.noteImportant()
                        } label: {
                            Image(systemName: objectNote.importantNote ? "star.fill" : "star")
                                .font(.largeTitle)
                                .foregroundColor(.yellow)
                        }

                    }
                    
                    
                    Text(objectNote.note)
                        .font(.body)
                }
            }
            .padding()
            .foregroundColor(Color.black)
            HStack{
                Text(objectNote.last_edition,style:.date)
                    .font(.caption)
                    .foregroundColor(Color(.systemGray))
                Spacer()
                Button {
                    if objectNote.importantNote == true {
                        viewModel.deleteObjectNote(objectNote)
                        viewModel.deleteNoteImportant(objectNote)
                    }
                    else
                    {
                        viewModel.deleteObjectNote(objectNote)
                    }
                } label: {
                    Image(systemName: "trash")
                        .frame(width: 40, height: 40)
                        .foregroundColor(Color(.systemGray))
                        .background(Color(.systemGray4))
                        .cornerRadius(5)
                }
                
            }
            .padding()
        }
        .overlay(RoundedRectangle(cornerRadius: 10)
            .stroke()
        )
        .padding()
    }
}

struct NoteRow_Previews: PreviewProvider {
    static var previews: some View {
        NoteRow(objectNote: ObjectNote())
            .environmentObject(ObjectNoteModel())
    }
}
