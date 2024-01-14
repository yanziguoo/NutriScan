//
//  RunPythonScript.swift
//  nutriscan
//
//  Created by Yanzi Guo on 2024-01-14.
//

import Foundation
import PythonKit

func RunPythonScript() -> PythonObject {
    let sys = Python.import("sys")
    sys.path.append("/Users/yanziguoo/deltahacks24/nutriscan/")
    let file = Python.import("script")
    
    let response = file.runthing()
    print(response)
    return response
}
