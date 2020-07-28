//
//  HWLogger.swift
//  HWLogger
//
//  Created by hanwe lee on 2020/06/26.
//  Copyright © 2020 hanwe lee. All rights reserved.
//

public enum HWLogLevel:Int {
    case fatalError = 0
    case error
    case warning
    case info
    case debug
}

public class HWLogger {
    
    //MARK: public property
    
    /*
     로그파일이 저장될 위치
     */
    public var logFilePath:String
    
    /*
     로그파일 삭제주기 (일단위)
     */
    public var logFileDeletionCycle:Int
    
    /*
     현재 로그 파일 레벨
     */
    public var logFileLevel:HWLogLevel = .info
    
    /*
     온오프기능
     */
    public var isFilewriteOn:Bool = true
    //todo timezone?
    
    //MARK: private property
    private static let defaultDeleteCycleDay:Int = 30
    private static let defaultLogFilePath:String = ""
    
    let queue:DispatchQueue = DispatchQueue(label: "com.hwLoggerQueue")
    
    //MARK: public function
    public static let sharedInstance : HWLogger = {
        let instance = HWLogger(logFilePath: "", logFileDeletionCycle: 0)
        return instance
    }()
    
    public init(logFilePath:String,logFileDeletionCycle:Int) {
        self.logFilePath = ""
        self.logFileDeletionCycle = 0
    }
    
    convenience public init(logFilePath:String) {
        self.init(logFilePath: logFilePath,logFileDeletionCycle:HWLogger.defaultDeleteCycleDay)
    }
    
    convenience public init(logFileDeletionCycle:Int) {
        self.init(logFilePath:HWLogger.defaultLogFilePath,logFileDeletionCycle:logFileDeletionCycle)
    }
    convenience public init() {
        self.init(logFilePath:HWLogger.defaultLogFilePath,logFileDeletionCycle:HWLogger.defaultDeleteCycleDay)
    }
    
    public func wrtieLog(logLevel:HWLogLevel,message:String) {
        if isFilewriteOn {
            if self.logFileLevel.rawValue >= logLevel.rawValue {

            }
        }
//        do {
//            // get the documents folder url
//            if let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
//                // create the destination url for the text file to be saved
//                let fileURL = documentDirectory.appendingPathComponent("file.txt")
//                // define the string/text to be saved
//                let text = "Hello World !!!"
//                // writing to disk
//                // Note: if you set atomically to true it will overwrite the file if it exists without a warning
//                try text.write(to: fileURL, atomically: false, encoding: .utf8)
//                print("saving was successful")
//                // any posterior code goes here
//                // reading from disk
//                let savedText = try String(contentsOf: fileURL)
//                print("savedText:", savedText)   // "Hello World !!!\n"
//            }
//        } catch {
//            print("error:", error)
//        }
        self.queue.async {
            do {
                let dir: URL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last! as URL
                let url = dir.appendingPathComponent("logFile.txt")
                try "\(message) \(Date())".appendLineToURL(fileURL: url as URL)
                let result = try String(contentsOf: url as URL, encoding: String.Encoding.utf8)
                let savedText = try String(contentsOf: url)
                print("savedText:", savedText)   // "Hello World !!!\n"
            }
            catch {
                print("Could not write to file")
            }
        }
        
    }
    
    public func sendAllLogToServer(serverAddress:String,completeHandler:@escaping () -> (),failureHandler:@escaping (Error) -> ()) {
        
    }
    
    public func removeTmp() {
        let dir: URL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last! as URL
        let url = dir.appendingPathComponent("logFile.txt")
        let fileMgr:FileManager = FileManager.init()
        try! fileMgr.removeItem(at: url)
    }
    
    //MARK: private function
    
    
    
}
