//
//  exOnGDButton.swift
//  project_Udamy
//
//  Created by MacOS on 1/14/1440 AH.
//  Copyright © 1440 AH MacOS. All rights reserved.
//

import UIKit

struct buttonOption : OptionSet {
    let rawValue:Int
    static let roundText = buttonOption(rawValue: 1 << 0)
    static let squareIcon = buttonOption(rawValue: 1 << 1)
}

