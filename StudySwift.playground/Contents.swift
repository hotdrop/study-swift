import UIKit

enum StudyType {
    case implementation
}

let runStudy: StudyType = StudyType.implementation
var study: Study? = nil

switch runStudy {
case .implementation:
    study = Implementation()
}

study!.run()
