//
//  Storyboards.swift
//  MindMap
//
//  Created by Jeff on 8/27/16.
//  Copyright © 2016 Jeff Small. All rights reserved.
//

import Foundation
import UIKit

enum StoryboardIdentifier: String {
    case Lists = "ListViews"
    case Main = "Main"
}

struct Storyboards {
    static func storyboard(withIdentifier identifier: StoryboardIdentifier) -> UIStoryboard {
        return UIStoryboard(name: identifier.rawValue, bundle: nil)
    }
}
