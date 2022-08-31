//
//  HeaderView.swift
//  Note App
//
//  Created by Lê Văn Huy on 30/08/2022.
//

import SwiftUI

struct HeaderView: View {
    var text: String = ""
    var body: some View {
            VStack{
                HStack{
                    Text(text)
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
            .padding()
            .frame(height: 100)
        .background(Color.blue)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
