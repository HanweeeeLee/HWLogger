//
//  StringExtension.swift
//  HWLogger
//
//  Created by hanwe on 2020/07/28.
//  Copyright © 2020 hanwe lee. All rights reserved.
//

extension String {
   func appendLineToURL(fileURL: URL) throws {
        try (self + "\n").appendToURL(fileURL: fileURL)
    }

    func appendToURL(fileURL: URL) throws {
        let data = self.data(using: String.Encoding.utf8)!
        try data.append(fileURL: fileURL)
    }
}
