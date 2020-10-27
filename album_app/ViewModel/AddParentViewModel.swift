//
//  AddParentViewModel.swift
//  album_app
//
//  Created by Tomas Boda on 24/10/2020.
//

import Foundation

class AddParentViewModel {
    func addParent(parentVM: ParentViewModel) {
        CoreDataManager.shared.addParent(name: parentVM.name)
    }
}
