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
    var screenWidth = UIScreen.main.bounds.width
    
    var body: some View {
        ZStack {
            Color.init("BackgroundColor")
                .navigationBarTitle(Text(self.childName),displayMode: .inline)
                .navigationBarItems(trailing: AlbumsTrailingButton(isAddMenuPresented: $isAddMenuPresented))
            ScrollView {
                
                LazyVGrid(columns: [GridItem(.flexible(minimum: screenWidth/3, maximum: screenWidth/3),spacing: 1),
                                    GridItem(.flexible(minimum: screenWidth/3, maximum: screenWidth/3),spacing: 1),
                                    GridItem(.flexible(minimum: screenWidth/3, maximum: screenWidth/3))],spacing: 1
                            , content: {
                    ForEach(0..<20, id: \.self){ num in
                        Image(systemName: "person")
                            .resizable()
                            .frame(width: screenWidth/3,
                                   height: screenWidth/3,
                                   alignment: .center)
                            .background(Color.init(.gray))
                    }
                    
                })
                
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
