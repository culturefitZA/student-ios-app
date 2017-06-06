//
//  LibraryAPIDelegate.swift
//  TimeShift
//
//  Created by Vision Mkhabela on 6/6/17.
//  Copyright © 2017 Bitwaregon. All rights reserved.
//

import Foundation
protocol LibraryAPIDelegate: class {
	func didSetUser(sender: LibraryAPI,viewModel : UsserViewModel)
	func didRecieveError(sender:LibraryAPI,errorModel:UserErrorViewModel)
}
