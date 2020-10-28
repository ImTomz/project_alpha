//
//  AddButtonView.swift
//  project_alpha
//
//  Created by Tomas Boda on 14/10/2020.
//

import SwiftUI

struct AddButtonView: View {
    
    @Binding var showView: Bool
    
    @State private var newChildName = ""
    @State private var birthDate = Date()
    
    
    var body: some View {
        VStack{
            HStack {
                TextField("New child name", text: self.$newChildName)
                    .background(Color.init("BackgroundColor"))
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            HStack {
                DatePicker(selection: $birthDate, displayedComponents: .date) {
                    Text("Select a date")
                }.labelsHidden()
                .accentColor(.gray)
            }
            HStack {
                Button(action: {
                    
                    let vm = AddChildViewModel()
                    vm.addChild(childVM: ChildViewModel(id: UUID(), name: self.newChildName, birthDate: self.birthDate))
                    self.showView = false
                    self.newChildName = ""
                    
                }, label: {
                    Text("Add")
                })
                Button {
                    self.showView = false
                } label: {
                    Text("Cancel")
                }

            }
            
            Spacer()
        }
        

        
    }
}

//struct AddButtonView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddButtonView()
//    }
//}
