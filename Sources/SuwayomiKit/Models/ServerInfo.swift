import API
import Foundation

public struct ServerInfo: Hashable, Sendable {
    public struct Platform: Hashable, Sendable {
        public struct OS: Hashable, Sendable {
            public let name: String
            public let version: String

            public init(name: String, version: String) {
                self.name = name
                self.version = version
            }
        }

        public struct JVM: Hashable, Sendable {
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
    public let githubURL: URL?
    public let discordURL: URL?
    public let platform: Platform

    public init(
        name: String,
        version: String,
        buildTime: String,
        buildType: String,
        githubURL: URL?,
        discordURL: URL?,
        platform: Platform
    ) {
        self.name = name
        self.version = version
        self.buildTime = buildTime
        self.buildType = buildType
        self.githubURL = githubURL
        self.discordURL = discordURL
        self.platform = platform
    }

    init(_ server: API.AboutServerQuery.Data.AboutServer) {
        self.name = server.name
        self.version = server.version
        self.buildTime = server.buildTime
        self.buildType = server.buildType
        self.githubURL = URL(string: server.github)
        self.discordURL = URL(string: server.discord)
        self.platform = Platform(
            headless: server.platformInfo.headless,
            arch: server.platformInfo.arch,
            os: .init(name: server.platformInfo.os.name, version: server.platformInfo.os.version),
            jvm: .init(vmName: server.platformInfo.jvm.vmName, javaVersion: server.platformInfo.jvm.javaVersion)
        )
    }
}
