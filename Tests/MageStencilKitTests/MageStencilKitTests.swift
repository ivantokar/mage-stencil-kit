import MageStencilKit
import Stencil
import Testing

@Suite struct MageStencilKitTests {
    func render(_ template: String, _ context: [String: Any]) throws -> String {
        let env = Environment(loader: nil)
        MageStencilFilters.register(on: env)
        return try env.renderTemplate(string: template, context: context)
    }

    @Test func camelCase() throws {
        let result = try render("{{ input | camelcase }}", ["input": "user_profile_id"])
        #expect(result == "userProfileId")
    }

    @Test func pascalCase() throws {
        let result = try render("{{ input | pascalcase }}", ["input": "user-profile-id"])
        #expect(result == "UserProfileId")
    }

    @Test func snakeCase() throws {
        let result = try render("{{ input | snakecase }}", ["input": "UserProfileId"])
        #expect(result == "user_profile_id")
    }

    @Test func kebabCase() throws {
        let result = try render("{{ input | kebabcase }}", ["input": "user profile ID"])
        #expect(result == "user-profile-id")
    }

    @Test func pluralize() throws {
        #expect(try render("{{ word | pluralize }}", ["word": "company"]) == "companies")
        #expect(try render("{{ word | pluralize }}", ["word": "bus"]) == "buses")
        #expect(try render("{{ word | pluralize }}", ["word": "user"]) == "users")
    }

    @Test func titleCase() throws {
        let result = try render("{{ name | titlecase }}", ["name": "hello world"])
        #expect(result == "Hello World")
    }

    @Test func capitalizedFirst() throws {
        let result = try render("{{ name | capitalizedFirst }}", ["name": "vapor"])
        #expect(result == "Vapor")
    }

    @Test func isAcronym() throws {
        #expect(try render("{{ name | isAcronym }}", ["name": "HTML"]) == "true")
        #expect(try render("{{ name | isAcronym }}", ["name": "Http"]) == "false")
    }
}
