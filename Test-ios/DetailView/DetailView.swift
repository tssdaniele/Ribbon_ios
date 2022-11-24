//
//  DetailView.swift
//  Test-ios
//
//  Created by Daniele Tassone on 24/11/2022.
//

import SwiftUI

struct DetailView: View {
    
    var character:CharacterModelElement
    @StateObject var viewModel = DetailViewModel()
    @State var btnIsSelected = false
    @State var idS = [String]()
    
    var body: some View {
        
        VStack {
            
            VStack(alignment: .trailing) {
                
                URLImage(urlString: character.img, width: .infinity, height: 400, data: nil)
                
                
                
                Button(action: {
                    
                    btnIsSelected.toggle()
                    
                    if idS.contains("\(character.charID)") {
                        let indexToRemove = idS.firstIndex(of: "\(character.charID)")
                        idS.remove(at: indexToRemove!)
                    } else {
                        idS.append("\(character.charID)")
                    }
                    UserDefaults.standard.set(idS, forKey: "idKey")
                    
                }, label: {
                    
                    if btnIsSelected {
                        Image("selected")
                            .resizable()
                            .frame(width: 50, height: 50)
                    } else {
                        Image("unSelected")
                            .resizable()
                            .frame(width: 50, height: 50)
                    }
                    
                    
                })
                .padding(.top, -30)
                .padding(.trailing, 20)
            }
            .padding(0)
            
            
            
            //            Text(character.name)
            //                .bold()
            
            List(viewModel.quots, id: \.self) { quot in
                
                VStack(alignment: .leading) {
                    HStack(alignment: .top) {
                        Text("Quote:")
                            .bold()
                        Text("\(quot.quote)")
                        
                        
                    }
                    
                    HStack(alignment: .top) {
                        Text("Author:")
                            .bold()
                        Text("\(quot.author)")
                        
                        
                    }
                    HStack(alignment: .top) {
                        Text("Series:")
                            .bold()
                        Text("\(quot.series)")
                        
                    }
                    
                    
                }
            }
            .onAppear {
                
                viewModel.fetch(id: character.charID)
                if let ids = UserDefaults.standard.value(forKey: "idKey") as? [String] {
                    idS = ids
                    
                }
                UserDefaults.standard.set(idS, forKey: "idKey")
                
                
                if checkIdExistOrNot(id: character.charID) {
                    btnIsSelected = true
                } else {
                    btnIsSelected = false
                }
            }
            //            .navigationBarHidden(true)
            .navigationBarTitle(Text(character.name), displayMode: .inline)
        }
        
        
    }
    
    
    func checkIdExistOrNot(id:Int) -> Bool {
        
        var exist = false
        
        if let ids = UserDefaults.standard.value(forKey: "idKey") as? [String] {
            if ids.contains("\(id)") {
                exist = true
            } else {
                exist = false
            }
        }
        
        return exist
    }
}

struct DetailView_Previews: PreviewProvider {
    
    static let character = CharacterModelElement(charID: 1, name: "", birthday: Birthday.the07081993, occupation: [""], img: "", status: Status.alive, nickname: "", appearance: [1], portrayed: "", category: Category.betterCallSaul, betterCallSaulAppearance: [1])
    
    static var previews: some View {
        
        DetailView(character: character)
    }
}
