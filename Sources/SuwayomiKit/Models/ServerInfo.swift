import API
import Foundation

public struct ServerInfo: Sendable, Equatable, Codable {
    public struct Platform: Sendable, Equatable, Codable {
        public struct OS: Sendable, Equatable, Codable {
            public let name: String
            public let version: String

            public init(name: String, version: String) {
                self.name = name
                self.version = version
            }
        }

        public struct JVM: Sendable, Equatable, Codable {
            public let vmName: String
            public let javaVersion: String

            public init(vmName: String, javaVersion: String) {
                self.vmName = vmName
                self.javaVersion = javaVersion
            }
        }

        public let headless: Bool
        public let arch: String
        public let os: OS
        public let jvm: JVM

        public init(headless: Bool, arch: String, os: OS, jvm: JVM) {
            self.headless = headless
            self.arch = arch
            self.os = os
            self.jvm = jvm
        }
    }

    public let name: String
    public let version: String
    public let buildTime: String
    public let buildType: String

    public let github: URL?
    public let discord: URL?
    public let platform: Platform

    public init(
        name: String,
        version: String,
        buildTime: String,
        buildType: String,
        github: URL?,
        discord: URL?,
        platform: Platform
    ) {
        self.name = name
        self.version = version
        self.buildTime = buildTime
        self.buildType = buildType
        self.github = github
        self.discord = discord
        self.platform = platform
    }
}

extension ServerInfo {
    static func from(_ server: AboutServerQuery.Data.AboutServer) -> Self {
        ServerInfo(
            name: server.name,
            version: server.version,
            buildTime: server.buildTime,
            buildType: server.buildType,
            github: URL(string: server.github),
            discord: URL(string: server.discord),
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
            jvm: ServerInfo.Platform.JVM.from(platform.jvm)
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
