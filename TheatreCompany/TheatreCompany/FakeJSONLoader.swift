//
//  FakeJSONLoader.swift
//  TheatreCompany
//
//  Created by Jess Le on 2/9/23.
//

import Foundation
class FakeJSONLoader {
    private static var fileNameDic: [String: Data] = [:]

    static func loadFile(for name: String) -> Data? {
        if fileNameDic.keys.contains(name) {
            return fileNameDic[name]
        }

        let newFileData = readFile(for: name)
        fileNameDic[name] = newFileData

        return newFileData
    }

    private static func readFile(for name: String) -> Data? {
        guard let path = Bundle.main.path(forResource: name, ofType: "json") else {
            fatalError("Failed to locate \(name) in bundle.")
        }

        guard let data = try? Data(contentsOf: URL(fileURLWithPath: path)) else {
            fatalError("Failed to load \(name) from bundle.")
        }

        return data
    }
}
