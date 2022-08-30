//
//  AddView.swift
//  Note App
//
//  Created by Lê Văn Huy on 29/08/2022.
//

import SwiftUI

struct AddView: View {
    @ObservedObject var objectNote = ObjectNote(title: "", note: "", date_created: Date(), last_edition: Date())
    @EnvironmentObject var viewModel : ObjectNoteModel
    @Environment(\.presentationMode) var presentationMode
    var id:UUID?
    
    var body: some View {
        VStack(alignment: .leading){
            Header
            Spacer()
            TextField("Title",text: $objectNote.title)
                .font(.title)
                .padding()
            NavigationView{
                TextEditor(text: $objectNote.note)
                    .padding()
                    .foregroundColor(.secondary)
                    .navigationBarHidden(true)
            }
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                .stroke()
            )
            .padding()
        }
        }
    }

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView()
            .environmentObject(ObjectNoteModel())
    }
}

extension AddView{
    var Header: some View {
        VStack{
            VStack(alignment: .leading){
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "arrow.backward")
                            .font(.title3)
                            .foregroundColor(.white)
                    }
                    .padding(.bottom,4)

                HStack{
                    Text(objectNote.title)
                        .font(.largeTitle)
                        .foregroundColor(.white)
                    Spacer()
                    Button {
                        if id == nil {
                            viewModel.addNewObjectNote(objectNote)
                        }
                        else {
                            viewModel.updateObjectNote(id: id!, title: objectNote.title, note: objectNote.note, last_edition: Date())
                        }
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "square.and.arrow.up")
                            .font(.title2)
                            .foregroundColor(.white)
                    }
                }
            }
            .navigationBarHidden(true)
            .padding()
            .frame(height: 100)
            .background(Color.blue)
    }
}
}
