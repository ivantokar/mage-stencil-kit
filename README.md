# MageStencilKit

**MageStencilKit** is a lightweight Swift library that provides a collection of powerful, extensible filters for [Stencil](https://github.com/stencilproject/Stencil) — the Swift templating language.

Originally built for [Mage CLI](https://github.com/yourname/mage), it is designed to work in **any Swift project** that uses Stencil templates: code generators, documentation tools, web template engines, or Swift-based CLI utilities.

---

## ✨ Features

- 🪄 `camelcase`: `user_profile_id` → `userProfileId`
- 🧱 `pascalcase`: `user-profile-id` → `UserProfileId`
- 🐍 `snakecase`: `UserProfileId` → `user_profile_id`
- 🧩 `kebabcase`: `User Profile ID` → `user-profile-id`
- 🔁 `pluralize`: `company` → `companies`
- 🔠 `titlecase`: `hello world` → `Hello World`
- 🔡 `capitalizedFirst`: `vapor` → `Vapor`
- 🔎 `isAcronym`: `HTML` → `true`, `Http` → `false`

---

## 🔁 Input to Output Case Conversions

| Input           | `camelcase`     | `pascalcase`    | `snakecase`       | `kebabcase`       |
| --------------- | --------------- | --------------- | ----------------- | ----------------- |
| `UserProfile`   | `userProfile`   | `UserProfile`   | `user_profile`    | `user-profile`    |
| `user_profile`  | `userProfile`   | `UserProfile`   | `user_profile`    | `user-profile`    |
| `user-profile`  | `userProfile`   | `UserProfile`   | `user_profile`    | `user-profile`    |
| `user profile`  | `userProfile`   | `UserProfile`   | `user_profile`    | `user-profile`    |
| `USERProfileID` | `userProfileId` | `UserProfileId` | `user_profile_id` | `user-profile-id` |

---

## 📦 Installation

### Swift Package Manager

Add to your `Package.swift`:

```swift
.package(url: "https://github.com/yourname/mage-stencil-kit.git", from: "1.0.0")
```

Then to your target dependencies:

```swift
.product(name: "MageStencilKit", package: "mage-stencil-kit")
```

---

## 🛠 Usage

```swift
import Stencil
import MageStencilKit

let env = Environment(loader: ...)
MageStencilFilters.register(on: env)
```

Use in `.stencil` templates:

```stencil
{{ "user_profile_id" | camelcase }}       → userProfileId
{{ "user profile" | pascalcase }}          → UserProfile
{{ "UserProfileId" | snakecase }}          → user_profile_id
```

---

## 🧪 Run Tests

We use Swift's new [Testing](https://github.com/apple/swift-testing) framework.

```bash
swift test
```

---

## 🔖 License

MIT License. Created with ❤️ to make Stencil more expressive in Swift projects.
