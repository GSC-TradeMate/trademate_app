# TradeMate Mobile Application

---

## Project Setup

1. **Clone the Repository**

   ```bash
    git clone https://github.com/GSC-TradeMate/trademate_app
    cd trademate_app
   ```

2. **Install Flutter SDK**
   Ensure you have Flutter installed. You can verify the installation by running:

   ```bash
   flutter doctor
   ```

   ```
    Flutter version 3.24.5 on channel stable at C:\src\flutter
    Upstream repository https://github.com/flutter/flutter.git
    Framework revision dec2ee5c1f (2 months ago), 2024-11-13 11:13:06 -0800
    Engine revision a18df97ca5
    Dart version 3.5.4
    DevTools version 2.37.3
   ```

   Resolve any issues flagged by the command.

3. **Install Dependencies**

   ```bash
   flutter pub get
   ```

4. **Run the Application**
   To test the project on an emulator or physical device:
   ```bash
   flutter run
   ```

---

## Branching Strategy

Follow the **Git Flow** workflow:

1. **Main Branch**: `main`
   - Production-ready code only.
2. **Development Branch**: `dev`
   - For testing and integration of features.
3. **Feature Branches**: `feat/<feature-name>`
   - For individual tasks or new features.
   - Branch off from `dev` and merge back into `dev` upon completion.
4. **Bugfix Branches**: `bugfix/<issue-description>`
   - For resolving bugs found in the `dev` branch.
5. **Hotfix Branches**: `hotfix/<issue-description>`
   - For urgent fixes in the `main` branch.

### Naming Conventions

- Use lowercase with hyphens for branch names: `feat/user-authentication`.
- Commit messages should follow this format:
  - **Add**: For new features.
  - **Fix**: For bug fixes.
  - **Refactor**: For code improvements.
  - **Docs**: For documentation updates.
  - **Test**: For adding or updating tests.
  - Example: `Add: user authentication logic`.

---

## Development Rules

1. **Code Quality**:

   - Follow the [Dart Style Guide](https://dart.dev/effective-dart/style).
   - Use meaningful variable and function names.
   - Ensure functions have a single responsibility.

2. **Testing**:

   - Write unit tests for all new features.
   - Ensure `flutter test` passes before merging code.

3. **Pull Requests**:

   - Submit a pull request (PR) to `dev` for all changes.
   - PRs must have a meaningful title and description.
   - Tag relevant team members for review.
   - Ensure no merge conflicts before requesting a review.

4. **Linting**:
   - Use the `flutter analyze` command to check for linting issues.
   - Fix all warnings and errors before committing.

---

## Environment Configuration

- Create a `.env` file for sensitive data and secrets (e.g., API keys). Add the `.env` file to `.gitignore`.
- Use a package like `flutter_dotenv` to load environment variables.

Example file: `./.env.example`

---

## Best Practices

1. **Documentation**:
   - Document all major functions and classes with comments.
2. **Reusability**:
   - Create reusable components where applicable.
3. **State Management**:
   - Use the agreed-upon state management solution (GetX).
4. **Version Control**:
   - Commit changes frequently with descriptive messages.

## Troubleshooting

- If you encounter issues, refer to the Discord or raise a GitHub issue.
