//
//  SettingsView.swift
//  project_alpha
//
//  Created by Tomas Boda on 14/10/2020.
//

import SwiftUI

struct SettingsView: View {
    
    @State private var parentName: String = ""
    @ObservedObject var parentViewModel = ParentShowViewModel()
    
    var body: some View {
        VStack {
            Text("Settings").font(.title)
            TextField("Parent Name", text: self.$parentName)
                .background(Color.init("BackgroundColor"))
                .padding()
            Button(action: {
                
                parentViewModel.editParent(parent: ParentViewModel(name: self.parentName))
                    
            }, label: {
                Text("Save")
            })
        }
       
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
