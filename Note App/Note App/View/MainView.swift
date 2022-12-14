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
            HeaderView(text: "Notes")
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
        }
        .navigationBarHidden(true)
    }
    
    
    
}


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(ObjectNoteModel())
    }
}

