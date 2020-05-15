import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.app(name: "CoreMLPredictor", platform: .iOS, dependencies: [
    .project(target: "CoreMLPredictorKit", path: .relativeToManifest("../CoreMLPredictorKit"))
])