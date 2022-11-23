import UIKit
import MyIdSDK

class MyIdController: UIViewController {
    var onResult: (String) -> Void
    var onCancel: () -> Void
    
    
    init(onResult: @escaping (String) -> Void, onCancel: @escaping () -> Void) {
        self.onResult = onResult
        self.onCancel = onCancel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        MyIdSdk.start(withConfigureOptions: { options in
            options?.clientId = "YOUR_CLIENT_ID"
            options?.locale = .UZ
        }, withDelegate: self)
    }
    
    func toJson(json: [String: Any]) -> String {
        do {
            let data = try JSONSerialization.data(withJSONObject: json)
            return String(data: data, encoding: String.Encoding.utf8) ?? ""
        } catch let JSONError {
            print(JSONError)
        }
        
        return ""
    }
}

extension MyIdController: MyIdSdkDelegate {
    
    func myidOnSuccess(result: MyIdResult) {
        let jsonObject: [String: Any] = [
            "code": result.code ?? "",
        ]
        
        onResult(toJson(json: jsonObject))
    }
    
    func myidOnError(exception: MyIdException) {
        let jsonObject: [String: Any] = [
            "error": [
                "code": exception.code,
                "message": exception.message,
            ],
        ]
        
        onResult(toJson(json: jsonObject))
    }
    
    func myidOnUserExited() {
        onCancel()
    }
}
