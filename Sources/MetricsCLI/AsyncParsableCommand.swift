import ArgumentParser

// Copy from https://github.com/apple/swift-argument-parser
// Should be removed when bumping swift-argument-parser to 1.2.2

/// A type that can be executed asynchronously, as part of a nested tree of
/// commands.
@available(macOS 10.15, macCatalyst 13, iOS 13, tvOS 13, watchOS 6, *)
public protocol AsyncParsableCommand: ParsableCommand {
  /// The behavior or functionality of this command.
  ///
  /// Implement this method in your `ParsableCommand`-conforming type with the
  /// functionality that this command represents.
  ///
  /// This method has a default implementation that prints the help screen for
  /// this command.
  mutating func run() async throws
}

@available(macOS 10.15, macCatalyst 13, iOS 13, tvOS 13, watchOS 6, *)
extension AsyncParsableCommand {
  /// Executes this command, or one of its subcommands, with the program's
  /// command-line arguments.
  ///
  /// Instead of calling this method directly, you can add `@main` to the root
  /// command for your command-line tool.
  public static func main() async {
    do {
      var command = try parseAsRoot()
      if var asyncCommand = command as? AsyncParsableCommand {
        try await asyncCommand.run()
      } else {
        try command.run()
      }
    } catch {
      exit(withError: error)
    }
  }
}
