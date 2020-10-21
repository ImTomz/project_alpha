//
//  SettingsView.swift
//  project_alpha
//
//  Created by Tomas Boda on 14/10/2020.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.managedObjectContext) var managedObjectContext

    @State private var parentName: String = ""
    
    var body: some View {
        VStack {
            Text("Settings").font(.title)
            TextField("New child birth date", text: self.$parentName)
                .background(Color.init("BackgroundColor"))
                .padding()
            Button(action: {
            
                    let parent = ParentModel(context: managedObjectContext)
                    parent.parentName = self.parentName
                    
                    do {
                        try self.managedObjectContext.save()
                    }catch{
                        print(error)
                    }
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
