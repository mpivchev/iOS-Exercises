import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.framework(name: "CoreMLPredictorKit", platform: .iOS, dependencies: [
    .project(target: "CoreMLPredictorSupport", path: .relativeToManifest("../CoreMLPredictorSupport"))
])