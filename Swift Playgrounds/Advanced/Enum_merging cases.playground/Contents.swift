import UIKit

//Enum with related props merged into sigle source for better management

enum KYCStatus {
    case rejected
    case pending
    case approved
    case unknown
}

//Use this single source for validation
enum KYCDocumentStage {
    case uploadData(KYCStatus)
    case authorize(KYCStatus)
    case validation(KYCStatus)
}

//So you can now use only KYCDocumentStage
let current = KYCDocumentStage.authorize(.pending)
