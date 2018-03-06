//
//  DataBase.swift
//  Circle
//
//  Created by Davi Boberg on 05/03/18.
//  Copyright © 2018 Gabriel Branco Frizzo. All rights reserved.
//

import Foundation

protocol Questionary {
    func connect()
    func loadQuestionary()
    func saveAnswers()
}
