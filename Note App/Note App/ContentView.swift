//
//  ContentView.swift
//  Note App
//
//  Created by Lê Văn Huy on 29/08/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            MainView()
        }
    }
}
