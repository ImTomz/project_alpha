//
//  AddChildViewModel.swift
//  project_alpha
//
//  Created by Tomas Boda on 21/10/2020.
//

import Foundation

class AddChildViewModel {
    func addChild(childVM: ChildViewModel) {
        CoreDataManager.shared.addChild(id: childVM.id, name: childVM.name, birthDate: childVM.birthDate)
    }
}
