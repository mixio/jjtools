import Foundation

public func jjprint(_ items: Any..., file: String = #file, line: Int = #line) {
    if let path = jjTruncatedPathToSources(file) {
        let header = """
        ------------------------------
        \(path):\(line)
        ------------------------------
        """
        print(header)
    }
    print(items)
}

private func jjTruncatedPathToSources(_ path: String) -> String? {
    var pathComponents = path.split(separator: "/")
    if let indexOfSources = pathComponents.firstIndex(of: "Sources") {
        pathComponents.removeFirst(indexOfSources + 1)
        let truncatedPath = pathComponents.joined(separator: "/")
        return truncatedPath
    } else {
        return path
    }
}
