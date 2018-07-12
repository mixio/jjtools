import Foundation

public func jjprint(_ items: Any..., file: String = #file, line: Int = #line) {

    let header = """
        ---------------
        \(file):\(line)
        ---------------
        """
   print(header)
   print(items)

}
