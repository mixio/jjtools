import Foundation

public func jjprinth(_ items: Any..., file: String = #file, line: Int = #line, function: String = #function) {
    if let path = jjTruncatedPathToSources(file) {
        let header = """
        +-----------------------------------
        | 📄 | \(path):\(line) | \(function)
        +-----------------------------------
        """
        print(header)
    }
    print(items)
}

public func jjprint(_ items: Any..., file: String = #file, line: Int = #line, function: String = #function) {
    let path = jjTruncatedPathToSources(file)
    print(items, "\(path ?? file):\(line) | \(function)")
}

public func jjdump(_ items: Any..., file: String = #file, line: Int = #line, function: String = #function) {
    if let path = jjTruncatedPathToSources(file) {
        let header = """
        +-----------------------------------
        | 📄 | \(path):\(line) | \(function)
        +-----------------------------------
        """
        print(header)
    }
    dump(items)
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

    print("+-----------------------------")
    let _ = Thread.callStackSymbols.forEach { print($0) }
    print("+-----------------------------")

//    let demangled = CallStackParser.classAndMethodForStackSymbol(Thread.callStackSymbols[2], includeImmediateParentClass: true)
//    print("+-----------------------------")
//    print(demangled)
//    print("+-----------------------------")

}

private func jjTruncatedPathToSources(_ path: String) -> String? {
    var pathComponents = path.split(separator: "/")
    var indexOfSources: Array<[String.SubSequence]>.Index? = nil

#if swift(>=4.2)
    indexOfSources = pathComponents.firstIndex(of: "Sources")
#else
    for (index, component) in pathComponents.enumerated() {
        if component == "Sources" {
            indexOfSources = index
            break
        }
    }
#endif

    if let indexOfSources = indexOfSources {
        pathComponents.removeFirst(indexOfSources + 1)
        let truncatedPath = pathComponents.joined(separator: "/")
        return truncatedPath
    } else {
        return path
    }
}
