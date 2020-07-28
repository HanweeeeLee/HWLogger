//
//  DataExtension.swift
//  HWLogger
//
//  Created by hanwe on 2020/07/28.
//  Copyright © 2020 hanwe lee. All rights reserved.
//

extension Data {
    func append(fileURL: URL) throws {
        if let fileHandle = FileHandle(forWritingAtPath: fileURL.path) {
            defer {
                fileHandle.closeFile()
            }
            fileHandle.seekToEndOfFile()
            fileHandle.write(self)
        }
        else {
            try write(to: fileURL, options: .atomic)
        }
    }
}
