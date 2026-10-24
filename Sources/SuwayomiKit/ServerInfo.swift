import API
import Foundation

public struct ServerInfo: Sendable, Equatable {
    public struct Platform: Sendable, Equatable {
        public struct OS: Sendable, Equatable {
            public let name: String
            public let version: String
        }

        public struct JVM: Sendable, Equatable {
            public let vmName: String
            public let javaVersion: String
        }

        public let headless: Bool
        public let arch: String
        public let os: OS
        public let jvm: JVM
    }

    public let name: String
    public let version: String
    public let buildTime: String
    public let buildType: String

    public let github: URL
    public let discord: URL
    public let platform: Platform
}

extension ServerInfo {
    static func from(_ server: AboutServerQuery.Data.AboutServer) -> Self {
        return ServerInfo(
            name: server.name,
            version: server.version,
            buildTime: server.buildTime,
            buildType: server.buildType,
            github: URL(string: server.github)!,
            discord: URL(string: server.discord)!,
            platform: ServerInfo.Platform.from(server.platformInfo)
        )
    }
}

extension ServerInfo.Platform {
    static func from(_ platform: AboutServerQuery.Data.AboutServer.PlatformInfo) -> Self {
        Self(
            headless: platform.headless,
            arch: platform.arch,
            os: ServerInfo.Platform.OS.from(platform.os),
            jvm: ServerInfo.Platform.JVM.from(platform.jvm),
        )
    }
}

extension ServerInfo.Platform.OS {
    static func from(_ os: AboutServerQuery.Data.AboutServer.PlatformInfo.Os) -> Self {
        Self(name: os.name, version: os.version)
    }
}

extension ServerInfo.Platform.JVM {
    static func from(_ jvm: AboutServerQuery.Data.AboutServer.PlatformInfo.Jvm) -> Self {
        Self(vmName: jvm.vmName, javaVersion: jvm.javaVersion)
    }
}
