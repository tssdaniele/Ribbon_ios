//
//  ContentView.swift
//  Test-ios
//
//  Created by Daniele Tassone on 24/11/2022.
//

import SwiftUI




struct ContentView: View {
    
    @StateObject var viewModel = ViewModel()
    @State var btnIsSelected = false
    
    var body: some View {
        
        NavigationView {
            
            List(viewModel.characters, id: \.self) { character in
                
                
                
                HStack {
                    NavigationLink(destination: DetailView(character: character)) {
                        HStack {
                            
                            URLImage(urlString: character.img, width: 70, height: 90, data: nil)
                            
                            Text(character.name)
                                .bold()
                            
                        }
                        .padding(3)
                        
                        
                    }
                    
                }
                
                
            }
            .navigationTitle("Characters")
            .onAppear {
                viewModel.fetch()
            }
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
