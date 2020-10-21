//
//  AddButtonView.swift
//  project_alpha
//
//  Created by Tomas Boda on 14/10/2020.
//

import SwiftUI

struct AddButtonView: View {
    
    
    @State private var newChildName = ""
    @State private var birthDate = ""
    
    
    var body: some View {
        VStack{
            HStack {
                TextField("New child name", text: self.$newChildName)
                    .background(Color.init("BackgroundColor"))
                    .padding()
            }
            HStack {
                TextField("New child birth date", text: self.$birthDate)
                    .background(Color.init("BackgroundColor"))
                    .padding()
            }
            
            Button(action: {
                
                let vm = AddChildViewModel()
                vm.addChild(childVM: ChildViewModel(id: UUID(), name: self.newChildName, birthDate: self.birthDate))
                
                self.newChildName = ""
                self.birthDate = ""
                
            }, label: {
                Text("Add")
            })
            Spacer()
        }
        

        
    }
}

struct AddButtonView_Previews: PreviewProvider {
    static var previews: some View {
        AddButtonView()
    }
}
