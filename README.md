# Homebrew O²L Tap

This is the official Homebrew tap for the **O²L Programming Language**.

## What is O²L?

O²L (Object-to-Language) is a modern object-oriented programming language that reimagines software development with an "everything-is-an-object" philosophy. Built with C++23, O²L eliminates primitives and null values while providing comprehensive standard libraries and powerful development tools.

## Installation

### Install O²L via Homebrew

```bash
# Add the O²L tap
brew tap zombocoder/o2l

# Install O²L
brew install o2l
```

### Verify Installation

```bash
# Check version
o2l --version

# Create a test program
echo 'Object Hello { @external method main(): Void { System.println("Hello, O²L!") } }' > hello.obq

# Run it
o2l run hello.obq
```

## What Gets Installed

The O²L Homebrew formula installs:

- **`o2l`** - Main interpreter and runtime
- **`o2l-pkg`** - Package manager for project scaffolding
- **`o2l-fmt`** - Code formatter for consistent style
- **`o2l-lsp-server`** - Language Server Protocol implementation

Plus comprehensive documentation and examples in:

- `/opt/homebrew/share/doc/o2l/` - Documentation
- `/opt/homebrew/share/o2l/examples/` - Example programs
- `/opt/homebrew/share/o2l/lsp/` - LSP configuration

## Quick Start

### Create Your First Project

```bash
# Create project directory
mkdir my-o2l-project && cd my-o2l-project

# Initialize O²L project
o2l-pkg init

# Run the generated example
o2l run src/main.obq

# Run tests
o2l run src/tests/main_test.obq
```

### Basic O²L Program

```o2l
import system.io

Object Calculator {
    property initialValue: Int

    constructor(value: Int) {
        this.initialValue = value
    }

    @external method calculate(): Int {
        result: Int = this.initialValue
        result = result * 2
        result = result + 10
        return result
    }

    @external method main(): Void {
        calc: Calculator = new Calculator(21)
        result: Int = calc.calculate()
        io.println("Result: %d", result)  // Output: Result: 52
    }
}
```

## Language Features

- **Everything is an Object** - Unified programming model
- **Null Safety** - No null pointer exceptions
- **Immutable Properties** - Object properties can't be reassigned
- **Mutable Variables** - Method-scope variables are mutable
- **Rich Standard Library** - 200+ built-in methods
- **FFI Support** - Seamless C library integration
- **Modern Syntax** - `else if`, `while` loops, exception handling

## Standard Libraries

- **HTTP Client/Server** - Web development capabilities
- **JSON Processing** - Parse and generate JSON
- **Regular Expressions** - Pattern matching
- **URL Manipulation** - URL parsing and construction
- **Math Library** - 40+ mathematical functions
- **DateTime** - Date and time operations
- **File System** - File and directory operations
- **Text Processing** - 48 string manipulation methods

## Requirements

- **macOS Monterey (12.0) or later**
- **Homebrew** package manager

The formula automatically handles all build dependencies including:

- C++23 compatible compiler (Clang)
- CMake and Ninja
- libffi for Foreign Function Interface
- Google Test for unit testing

## Documentation

- **Project Homepage**: https://github.com/zombocoder/o2l
- **Language Reference**: Available after installation in documentation directory
- **Examples**: Browse examples in `/opt/homebrew/share/o2l/examples/`

## Troubleshooting

### Build Issues

If you encounter build issues:

```bash
# Update Homebrew and try again
brew update
brew upgrade
brew reinstall o2l
```

### Check Dependencies

```bash
# Verify libffi is installed
brew list libffi

# Check if you have the latest Xcode Command Line Tools
xcode-select --install
```

### Get Help

- **Issues**: https://github.com/zombocoder/o2l/issues
- **Discussions**: https://github.com/zombocoder/o2l/discussions

## Development

This tap formula is maintained alongside the main O²L project.

To contribute:

1. Fork this repository
2. Make your changes
3. Test with `brew install --build-from-source ./o2l.rb`
4. Submit a pull request

## License

This Homebrew tap is released under the same Apache 2.0 License as the O²L Programming Language.

---

**Happy coding with O²L!** 🚀
