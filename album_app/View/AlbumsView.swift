//
//  AlbumsView.swift
//  project_alpha
//
//  Created by Tomas Boda on 15/10/2020.
//

import SwiftUI

struct AlbumsView: View {
    @State private var isAddMenuPresented = false
    public var childName: String
    
    var body: some View {
        ZStack {
            Color.init("BackgroundColor")
                .navigationBarTitle(Text(self.childName),displayMode: .inline)
                .navigationBarItems(trailing: AlbumsTrailingButton(isAddMenuPresented: $isAddMenuPresented))
            ScrollView {
                
                LazyVStack {
                    ForEach(0..<14,id: \.self) {num in
                        Text("12.04.2020")
                        ScrollView(.horizontal){
                            LazyHStack {
                              
                                    ForEach(0..<5,id: \.self){ pic in
                                        
                                            Image(systemName: "person")
                                                .resizable()
                                                .frame(width: 100,
                                                       height: 100,
                                                       alignment: .center)
                                                .background(Color.init(.gray))
                                                                                    
                                    }
                            }                        
                        }
                        .padding(.leading,35)
                        
                    }.background(Color.init("BackgroundColor"))
                }.padding([.leading,.trailing],-20)
            }
        }
    }
}

// MARK: -Navigation trailing button view
struct AlbumsTrailingButton: View {
    
    @Binding var isAddMenuPresented: Bool
    
    var body: some View {
        Button(action: {self.isAddMenuPresented.toggle()}) {
            Image(systemName: "plus")
                .resizable()
                .frame(width: 25, height: 25, alignment: .center)
                .accentColor(.gray).padding(.trailing, 20)
        }.sheet(isPresented: $isAddMenuPresented, content: {MainView()})
    }
}

// MARK: -Preview
struct AlbumsView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumsView(childName: "")
    }
}
