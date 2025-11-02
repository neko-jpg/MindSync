# Flutter ToDo App - AGENTS.md

## Regarding the work
Once your work is complete, be sure to place a file named Progress.md in each directory you created and record or update the latest progress status. Manage your progress status within that file.
When starting or resuming work on that section, check at the beginning of the task whether a Progress.md file exists in that directory. Understand the work status before commencing your work.
To ensure consistency in UI elements, we want to create files like:
lib/
 ├── theme/
 │    ├── app_colors.dart      // カラーパレット定義
 │    ├── app_typography.dart  // テキストスタイル
 │    ├── app_theme.dart       // ThemeDataをまとめる
 │    └── app_spacing.dart     // 余白やradiusなど
 └── main.dart
Design should be managed at the design system layer using files like these. Unless instructed otherwise by the client, UI design must adhere to the existing design system to maintain overall consistency. Modifying or altering the existing design system without user approval is strictly prohibited in this project.
Submitting code with errors remaining in Flutter test and Flutter analyze is prohibited in this project.
Therefore, if errors occur or tests fail during analysis or testing, please perform debugging work.

## Project Overview
This is a cross-platform ToDo management app built with Flutter. It uses Riverpod for state management, Supabase for backend integration, and GoRouter for navigation. Focus on clean, reactive UI with proper error handling and testing. Target: iOS, Android, Web.

## Tech Stack
- Flutter 3.16+
- Dart 3.2+
- Riverpod 2.4+ (state management)
- Freezed (immutable models)
- GoRouter (routing)
- Supabase (auth & DB)
- Dio (HTTP client)
- cached_network_image (images)
- flutter_hooks (hooks)

Add dependencies with: `flutter pub add <package>`

## Setup Commands
- Install deps: `flutter pub get`
- Generate code: `flutter pub run build_runner build --delete-conflicting-outputs`
- Start dev server: `flutter run`
- Analyze code: `flutter analyze`
- Format code: `flutter format .`

## Project Structure
- lib/main.dart (entry point)
- lib/core/ (constants, extensions, utils, theme)
- lib/features/todo/ (feature: data/, domain/, presentation/)
- lib/shared/ (widgets, models, providers)
- lib/services/ (SupabaseService, ApiService)
- test/ (unit, widget, integration tests)
- integration_test/ (end-to-end tests)

Keep files small: 1 file = 1 responsibility.

## Code Style Guidelines
- Use descriptive names (e.g., isLoading, todoList).
- Always use const constructors for widgets.
- Prefer arrow functions (=>).
- Line length: 80 chars max, trailing commas.
- Use log() instead of print().
- File order: Public widgets → Private sub-widgets → Helpers → Constants → Types/Models.
- Theme everything with Theme.of(context).

## Do's and Don'ts
**Do:**
- Prioritize composition over inheritance.
- Handle loading/errors with AsyncValue in Riverpod.
- Use ListView.builder for lists.
- Make UI responsive with MediaQuery/LayoutBuilder.

**Don't:**
- Create widgets in _build methods (use classes).
- Hardcode colors/sizes (use theme).
- Add heavy new deps without approval.
- Ignore accessibility (e.g., semantics for buttons).

## State Management
Use Riverpod:
- AsyncNotifierProvider for async ops.
- NotifierProvider for sync state.
- ref.watch() for reactivity.
- ref.invalidate() to reset.
Example: ref.read(todoNotifierProvider).addTodo(newTodo);

Models: Use @freezed for immutability (e.g., @freezed class Todo).

## Testing Instructions
- Run all: `flutter test`
- Widget tests: `flutter test --machine` (detailed logs).
- Integration: `flutter test integration_test/`
- Use mockito for mocks.
- Add/update tests for changes (unit/widget first).
- Fix until green; run `flutter analyze` after moves/imports.

Test First: Write tests before new features.

## UI/Performance Best Practices
- Break into small private widget classes.
- Specify TextField props (textCapitalization, keyboardType).
- Optimize images: AssetImage for static, cached_network_image for dynamic (with errorBuilder).
- Handle empty states/errors in UI.

## PR Instructions / Safety
- Title: [feat(todo)] Add delete functionality
- Before commit: `flutter analyze && flutter test && flutter format .`
- Permissions: Read/write files, run tests/builds OK. No new deps/deletes without approval.
- If stuck: Ask questions or create draft PR.
- Security: Never commit secrets; use env vars for Supabase keys.
