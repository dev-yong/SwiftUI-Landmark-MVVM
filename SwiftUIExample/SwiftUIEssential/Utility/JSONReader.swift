//
//  JSONReader.swift
//  SwiftUIExample
//
//  Created by 이광용 on 2019/06/12.
//  Copyright © 2019 GwangYongLee. All rights reserved.
//

import Foundation

struct JSONReader {
    private let decoder = JSONDecoder()
    func load<T: Decodable>(_ fileName: String,
                            as type: T.Type = T.self) -> T {
        guard let path = Bundle.main.url(forResource: fileName,
                                         withExtension: "json") else {
                                            fatalError("Couldn't find \(fileName) in main bundle.")
        }
        do {
            let data = try Data(contentsOf: path)
            return try decoder.decode(T.self, from: data)
        } catch {
            fatalError(error.localizedDescription)
        }
    }
}


