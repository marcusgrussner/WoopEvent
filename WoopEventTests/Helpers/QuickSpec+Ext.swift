import Nimble
import Quick

// MARK: - QuickSpec extensions

extension QuickSpec {
    
    func loadJson(from filename: String) -> Data? {
        guard
            let path =  Bundle(for: type(of: self)).path(forResource: filename, ofType: "json"),
            let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
        else { return nil }
        return data
    }
}
