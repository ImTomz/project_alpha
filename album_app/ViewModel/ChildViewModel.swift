//
//  ChildViewModel.swift
//  project_alpha
//
//  Created by Tomas Boda on 21/10/2020.
//

import Foundation

class ChildViewModel: Identifiable {
    var id: UUID
    var name: String
    var birthDate: Date
    var image: Data
    
    init(id: UUID, name: String, birthDate: Date, image: Data) {
        self.id = id
        self.name = name
        self.birthDate = birthDate
        self.image = image
    }
    
    init(child: Child) {
        self.id = child.id!
        self.name = child.name!
        self.birthDate = child.birthDate!
        self.image = child.image!
    }
}
