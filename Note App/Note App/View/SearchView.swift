//
//  SearchView.swift
//  Note App
//
//  Created by Lê Văn Huy on 30/08/2022.
//

import SwiftUI

struct SearchView: View {
    @EnvironmentObject var viewModel: ObjectNoteModel
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack{
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                HStack{
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Spacer()
                        Text("Cancel")
                            .foregroundColor(.white)
                            .frame(width: 70, height: 35)
                            .background(.blue)
                            .cornerRadius(7)
                    }
                }
            }
            .padding()
            .navigationBarHidden(true)
            searchBar
            
            ForEach(viewModel.searchNote()){
                object in
                NoteRow(objectNote: object)
            }
            
            Spacer()
        }
        .padding()

    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
            .environmentObject(ObjectNoteModel())
    }
}

extension SearchView{
    var searchBar: some View {
        HStack{
            TextField("Search...",text : $viewModel.searchText)
                .padding(8)
                .padding(.horizontal,34)
                .background(Color(.systemGray6))
                .cornerRadius(9)
                .overlay(
                    HStack{
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0,maxWidth: .infinity,alignment: .leading)
                            .padding(.leading,8)
                    }
                )
            
        }
        .padding(.horizontal,4)
    }
    }
