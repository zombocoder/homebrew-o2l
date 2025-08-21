class O2l < Formula
    desc "O²L Programming Language - Modern object-oriented language with everything-is-an-object design"
    homepage "https://github.com/zombocoder/o2l"
    url "https://github.com/zombocoder/o2l/archive/refs/tags/v0.0.1.tar.gz"
    sha256 "" # This will be calculated automatically when you upload the formula
    license "Apache-2.0"
  
    depends_on "cmake" => :build
    depends_on "ninja" => :build
    depends_on "libffi"
    depends_on "pkg-config" => :build
    depends_on "googletest" => :build
  
    # Requires C++23 support
    depends_on macos: :monterey
    
    def install
      # Set up build environment for C++23
      ENV.cxx23
      
      # Configure with CMake
      system "cmake", "-B", "build",
                      "-DCMAKE_BUILD_TYPE=Release",
                      "-DCMAKE_OSX_DEPLOYMENT_TARGET=12.0",
                      "-GNinja",
                      *std_cmake_args
      
      # Build the project
      system "cmake", "--build", "build", "--config", "Release"
      
      # Run basic tests during installation
      cd "build" do
        system "./bin/o2l", "--version"
        
        # Run unit tests if available
        system "./tests/o2l_tests" if File.exist?("./tests/o2l_tests")
        
        # Test with a simple example if available
        if File.exist?("../examples/minimal_test.obq")
          system "./bin/o2l", "run", "../examples/minimal_test.obq"
        end
      end
      
      # Install main binary
      bin.install "build/bin/o2l"
      
      # Install additional tools if they exist
      bin.install "build/bin/o2l-fmt" if File.exist?("build/bin/o2l-fmt")
      bin.install "build/bin/o2l-lsp-server" if File.exist?("build/bin/o2l-lsp-server")
      bin.install "build/bin/o2l-pkg" if File.exist?("build/bin/o2l-pkg")
      
      # Install documentation
      doc.install "README.md"
      doc.install "LICENSE"
      doc.install "CHANGELOG.md" if File.exist?("CHANGELOG.md")
      doc.install "LANGUAGE_REFERENCE.md" if File.exist?("LANGUAGE_REFERENCE.md")
      doc.install "DYNAMIC_LIBRARIES.md" if File.exist?("DYNAMIC_LIBRARIES.md")
      
      # Install examples for users to reference
      if Dir.exist?("examples")
        (share/"o2l").install "examples"
      end
      
      # Install LSP configuration
      if Dir.exist?("lsp")
        (share/"o2l").install "lsp"
      end
      
      # Install wiki documentation if available
      if Dir.exist?("wiki")
        (share/"o2l").install "wiki"
      end
    end
  
    test do
      # Basic functionality test
      system "#{bin}/o2l", "--version"
    end
  end