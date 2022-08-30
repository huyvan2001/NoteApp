//
//  MainView.swift
//  Note App
//
//  Created by Lê Văn Huy on 29/08/2022.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var viewModel : ObjectNoteModel
    
    var body: some View {
        VStack{
            Header
            ScrollView{
                LazyVStack{
                    ForEach(viewModel.data,id:\.id){ object in
                        NavigationLink {
                            AddView(objectNote: object,id: object.id)
                        } label: {
                            NoteRow(objectNote: object)
                        }

                    }

                }
            }
            Spacer()
            Add
            
        }
}
}


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(ObjectNoteModel())
    }
}
extension MainView{
    var Header: some View {
            VStack{
                HStack{
                    Text("Notes")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                    Spacer()
                    NavigationLink {
                        SearchView()
                    } label: {
                        Image(systemName: "magnifyingglass")
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
    var Add: some View {
        NavigationLink {
            AddView()
        } label: {
            ZStack{
                Image(systemName: "plus")
                    .frame(width:50,height:40)
                    .foregroundColor(Color.blue)
                    .font(.largeTitle)
                    .overlay(RoundedRectangle(cornerRadius: 15)
                        .stroke(Color.blue))
            }
        }

    }
}
