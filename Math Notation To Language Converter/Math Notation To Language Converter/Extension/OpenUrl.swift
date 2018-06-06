//
//  OpenUrl.swift
//  Math Notation To Language Converter
//
//  Created by yujiazheng on 31/5/18.
//  Copyright © 2018 Summer Studios. All rights reserved.
//

import Foundation
import UIKit

// function for open url, just call the function and passing string paramater as url
func openUrl(url: String) {
    print(url)
    UIApplication.shared.open(URL(string : url)!, options: [:], completionHandler: { (status) in })
}
