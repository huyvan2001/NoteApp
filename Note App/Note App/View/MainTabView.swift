//
//  MainTabView.swift
//  Note App
//
//  Created by Lê Văn Huy on 30/08/2022.
//

import SwiftUI

struct MainTabView: View {
    @EnvironmentObject var viewModel : ObjectNoteModel
    @State private var selectedIndex = 0
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $selectedIndex){
                    MainView()
                        .onTapGesture {
                            self.selectedIndex = 0
                        }
                        .tabItem {
                            Image(systemName: "house")
                        }
                        .tag(0)
                    
                    ImportantNoteView()
                        .onTapGesture {
                            self.selectedIndex = 1
                        }
                        .tabItem {
                            Image(systemName:"star.fill")
                        }
                        .tag(1)
                }
            Add()
        }
    }
    @ViewBuilder
    func Add() -> some View {
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

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
        MainTabView()
            .environmentObject(ObjectNoteModel())
        }
        .navigationBarHidden(true)
    }
}
