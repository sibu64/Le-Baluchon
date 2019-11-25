import Foundation

class FetchCurrencyAPI {
    let DATE_KEY = "dateKey"
    let userDefault = UserDefaults.standard
    
    func save(with date: Date = Date()) {
        userDefault.set(date, forKey: DATE_KEY)
        userDefault.synchronize()
    }
    
    func shouldFetch() ->Bool {
        guard let date = userDefault.object(forKey: DATE_KEY) as? Date else {
            return true
        }

        if Calendar.current.dateComponents([.hour], from: date, to: Date()).hour != nil {
        return true
    }
        return false
   }
}
