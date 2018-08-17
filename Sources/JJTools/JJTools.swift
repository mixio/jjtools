import Foundation

public func jjprint(_ items: Any..., file: String = #file, line: Int = #line) {
    if let path = jjTruncatedPathToSources(file) {
        let header = """
        +-----------------------------
        | 📄 | \(path):\(line)
        +-----------------------------
        """
        print(header)
    }
    print(items)
}

public func jjprintex(_ items: Any..., file: String = #file, line: Int = #line) {
    if let path = jjTruncatedPathToSources(file) {
        let header = """
        +-----------------------------
        | 📄 | \(path):\(line)
        +-----------------------------
        """
        print(header)
    }
    print(items)

    let stackTrace = Thread.callStackSymbols.joined(separator: "\n")
    print("+-----------------------------")
    print(stackTrace)
    print("+-----------------------------")

}

private func jjTruncatedPathToSources(_ path: String) -> String? {
    var pathComponents = path.split(separator: "/")
    let indexOfSources: Array<[String.SubSequence]>.Index?
    if #available(macOS 10.4, *) {
        indexOfSources = pathComponents.firstIndex(of: "Sources")
    } else {
        indexOfSources = pathComponents.firstIndex(where: { $0 == "Sources" })
    }
    if let indexOfSources = indexOfSources {
        pathComponents.removeFirst(indexOfSources + 1)
        let truncatedPath = pathComponents.joined(separator: "/")
        return truncatedPath
    } else {
        return path
    }
}
