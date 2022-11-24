//
//  ImageViewModel.swift
//  Test-ios
//
//  Created by Daniele Tassone on 24/11/2022.
//

import Foundation
import SwiftUI



struct URLImage: View {
    
    let urlString: String
    let width:CGFloat
    let height:CGFloat
    @State var data: Data?
    
    var body: some View {
        
        if let data = data, let uiimage = UIImage(data: data) {
            Image(uiImage: uiimage)
                .resizable()
                .frame(width: width, height: height)
            
            
        } else {
            Image("")
                .resizable()
                .frame(width: width, height: height)
                .background(Color.gray)
                .onAppear {
                    fetchData()
                }
        }
    }
    
    private func fetchData() {
        guard let url = URL(string: urlString) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, _ in
            self.data = data
            
        }
        task.resume()
    }
}
