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
    
    init(id: UUID, name: String, birthDate: Date) {
        self.id = id
        self.name = name
        self.birthDate = birthDate
    }
    
    init(child: Child) {
        self.id = child.id!
        self.name = child.name!
        self.birthDate = child.birthDate!
    }
}
