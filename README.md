# MageStencilKit

Custom Stencil filters for the [Mage CLI](https://github.com/ivantokar/mage), built with Swift and designed to support flexible code generation for Vapor and SwiftPM projects.

---

## ✨ Features

- `camelcase`: `user_profile` → `userProfile`
- `pascalcase`: `user-profile-id` → `UserProfileId`
- `snakecase`: `UserProfileId` → `user_profile_id`
- `kebabcase`: `User Profile ID` → `user-profile-id`
- `pluralize`: `company` → `companies`
- `titlecase`: `hello world` → `Hello World`
- `capitalizedFirst`: `vapor` → `Vapor`
- `isAcronym`: `HTML` → `true`, `Http` → `false`

---

## 📦 Installation

### As a Swift Package

Add to your `Package.swift`:

```swift
.package(url: "https://github.com/ivantokar/mage-stencil-kit.git", from: "1.0.0")
```

And to your target:

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

Then use in templates:

```stencil
{{ "user_profile_id" | camelcase }}       → userProfileId
{{ "user profile" | pascalcase }}          → UserProfile
{{ "UserProfileId" | snakecase }}          → user_profile_id
```

---

## 🧪 Run Tests

```bash
swift test
```

---

## 🔖 License

MIT License. Created with ❤️ for the Mage CLI ecosystem.
