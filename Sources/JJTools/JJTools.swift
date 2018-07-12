import Foundation

public func jjprint(_ items: Any..., file: String = #file, line: Int = #line) {

    if let path = jjTruncatedPath(file) {
        let header = """
            ---------------
            \(path):\(line)
            ---------------
            """
       print(header)
    }
   print(items)

}

private func jjTruncatedPath(_ path: String) -> String? {

    guard let url = URL(string: path) else {
        return nil
    }

    var pathComponents = url.pathComponents
    while pathComponents.first != "Source" {
        pathComponents.removeFirst()
    }
    let truncatedPath = pathComponents.joined(separator: "/")
    return truncatedPath

}
