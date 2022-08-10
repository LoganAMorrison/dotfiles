return {
  settings = {
    pyright = {
      -- Disables type completion, definitions, and references.
      disableLanguageServices = false,
      -- Disables the “Organize Imports” command.
      disableOrganizeImports = false,
    },
    python = {
      -- Path to Python, you can use a custom version of Python.
      pythonPath = "python",
      -- Path to folder with a list of Virtual Environments.
      venvPath = "",
      analysis = {
        --  Offer auto-import completions.
        autoImportCompletions = false,
        --  Automatically add common search paths like 'src'?
        autoSearchPaths = true,
        -- openFilesOnly: Analyzes and reports errors on only open files.
        -- workspace: Analyzes and reports errors on all files in the workspace.
        diagnosticMode = "workspace",
        -- Specifies the level of logging for the Output panel:  "Error", "Warning", "Information "Trace"
        logLevel = "Information",
        --  Additional import search resolution paths
        extraPaths = {},
        --  Path to directory containing custom type stub files.
        stubPath = "/home/logan/.local/stubs",
        --  Defines the default rule set for type checking: "basic", "off" or "strict"
        typeCheckingMode = "basic",
        --  Paths to look for typeshed modules.
        typeshedPaths = {},
        --  Use library implementations to extract type information when type stub is not present.
        useLibraryCodeForTypes = true,

        inlay_hints = {
          variableTypes = true,
          functionReturnTypes = true,
        },

        -- Allows a user to override the severity levels for individual diagnostics.
        diagnosticSeverityOverrides = {
          -- Diagnostics for 'assert' statement that will provably always assert. This can be indicative of
          -- a programming error.
          -- reportAssertAlwaysTrue = "warning",
          -- Diagnostics for function calls within a default value initialization expression. Such calls can mask
          -- expensive operations that are performed at module initialization time.
          -- reportCallInDefaultInitializer = "none",
          -- Diagnostics for attempts to redefine variables whose names are all-caps with underscores and numerals.
          -- reportConstantRedefinition = "none",
          -- Diagnostics for an imported symbol or module that is imported more than once.
          -- reportDuplicateImport = "warning",
          -- Diagnostics for member accesses on functions.
          -- reportFunctionMemberAccess = "none",
          -- Diagnostics for general type inconsistencies, unsupported operations, argument/parameter mismatches, etc.
          -- Covers all of the basic type-checking rules not covered by other rules. Does not include syntax errors.
          -- reportGeneralTypeIssues = "error",
          --  Diagnostics for two or more string literals that follow each other, indicating an implicit concatenation.
          -- This is considered a bad practice and often masks bugs such as missing commas.
          -- reportImplicitStringConcatenation = "none",
          --  Diagnostics for cyclical import chains. These are not errors in Python, but they do slow down type
          -- analysis and often hint at architectural layering issues. Generally, they should be avoided.
          -- reportImportCycles = "warning",
          --  Diagnostics for methods that override a method of the same name in a base class in an incompatible
          -- manner (wrong number of parameters, incompatible parameter types, or incompatible return type).
          -- reportIncompatibleMethodOverride = "none",
          --  Diagnostics for overrides in subclasses that redefine a variable in an incompatible way.
          -- reportIncompatibleVariableOverride = "none",
          --  Diagnostics for the use of a module-level “__getattr__” function, indicating that the stub is incomplete.
          -- reportIncompleteStub = "none",
          --  Diagnostics for invalid escape sequences used within string literals. The Python specification indicates
          -- that such sequences will generate a syntax error in future versions.
          -- reportInvalidStringEscapeSequence = "warning",
          -- Diagnostics for type stub statements that do not conform to PEP 484.
          -- reportInvalidStubStatement = "none",
          --  Diagnostics for improper use of type variables in a function signature.
          -- reportInvalidTypeVarUse = "warning",
          --  Diagnostics for imports that have no corresponding imported python file or type stub file.
          -- reportMissingImports = "error",
          --  Diagnostics for imports that have no corresponding source file. This happens when a type stub is found,
          -- but the module source file was not found, indicating that the code may fail at runtime when using this
          -- execution environment. Type checking will be done using the type stub.
          -- reportMissingModuleSource = "warning",
          --  Diagnostics for parameters that are missing a type annotation.
          -- reportMissingParameterType = "none",
          --  Diagnostics for generic class reference with missing type arguments.
          -- reportMissingTypeArgument = "none",
          --  Diagnostics for imports that have no corresponding type stub file (either a typeshed file or a custom
          -- type stub). The type checker requires type stubs to do its best job at analysis.
          -- reportMissingTypeStubs = "none",
          --  Diagnostics for an attempt to call a variable with an Optional type.
          -- reportOptionalCall = "error",
          --  Diagnostics for an attempt to use an Optional type as a context manager (as a parameter to a with
          -- statement).
          -- reportOptionalContextManager = "error",
          --  Diagnostics for an attempt to use an Optional type as an iterable value (e.g. within a for statement).
          -- reportOptionalIterable = "error",
          --  Diagnostics for an attempt to access a member of a variable with an Optional type.
          -- reportOptionalMemberAccess = "error",
          --  Diagnostics for an attempt to use an Optional type as an operand to a binary or unary operator
          -- (like '+', '==', 'or', 'not').
          -- reportOptionalOperand = "error",
          --  Diagnostics for an attempt to subscript (index) a variable with an Optional type.
          -- reportOptionalSubscript = "error",
          --  Diagnostics for function overloads that overlap in signature and obscure each other or have incompatible
          -- return types.
          -- reportOverlappingOverload = "none",
          --  Diagnostics for incorrect usage of symbol imported from a \"py.typed\" module that is not re-exported
          -- from that module.
          -- reportPrivateImportUsage = "error",
          --  Diagnostics for incorrect usage of private or protected variables or functions. Protected class members
          -- begin with a single underscore _ and can be accessed only by subclasses. Private class members begin
          -- with a double underscore but do not end in a double underscore and can be accessed only within the
          -- declaring class. Variables and functions declared outside of a class are considered private if their
          -- names start with either a single or double underscore, and they cannot be accessed outside of the declaring
          -- module.
          -- reportPrivateUsage = "none",
          -- reportPropertyTypeMismatch = "none",
          --  Diagnostics for a missing or misnamed “self” parameter in instance methods and “cls” parameter
          -- in class methods. Instance methods in metaclasses (classes that derive from “type”) are allowed to use
          -- “cls” for instance methods.
          -- reportSelfClsParameterName = "warning",
          --  Diagnostics for an attempt to access a non-required key within a TypedDict without a check for its
          -- presence.
          -- reportTypedDictNotRequiredAccess = "error",
          --  Diagnostics for unbound and possibly unbound variables.
          -- reportUnboundVariable = "error",
          --  Diagnostics for a missing or misnamed “self” parameter in instance methods and “cls” parameter
          -- in class methods. Instance methods in metaclasses (classes that derive from “type”) are allowed to use
          -- “cls” for instance methods.
          -- reportUndefinedVariable = "error",
          --  Diagnostics for instance variables that are not declared or initialized within class body or `__init__`
          -- method.
          -- reportUninitializedInstanceVariable = "none",
          --  Diagnostics for call arguments for functions or methods that have an unknown type.
          -- reportUnknownArgumentType = "none",
          --  Diagnostics for input or return parameters for lambdas that have an unknown type.
          -- reportUnknownLambdaType = "none",
          --  Diagnostics for class or instance variables that have an unknown type.
          -- reportUnknownMemberType = "none",
          --  Diagnostics for input or return parameters for functions or methods that have an unknown type.
          -- reportUnknownParameterType = "none",
          --  Diagnostics for variables that have an unknown type..
          -- reportUnknownVariableType = "none",
          --  Diagnostics for 'cast' calls that are statically determined to be unnecessary. Such calls are sometimes
          -- indicative of a programming error.
          -- reportUnnecessaryCast = "none",
          --  Diagnostics for '==' and '!=' comparisons that are statically determined to be unnecessary. Such calls
          -- are sometimes indicative of a programming error.
          -- reportUnnecessaryComparison = "none",
          --  Diagnostics for 'isinstance' or 'issubclass' calls where the result is statically determined to be always
          -- true. Such calls are often indicative of a programming error.
          -- reportUnnecessaryIsInstance = "none",
          --  Diagnostics for unsupported operations performed on __all__.
          -- reportUnsupportedDunderAll = "warning",
          --  Diagnostics for base classes whose type cannot be determined statically. These obscure the class type,
          -- defeating many type analysis features.
          -- reportUntypedBaseClass = "none",
          --  Diagnostics for class decorators that have no type annotations. These obscure the class type, defeating
          -- many type analysis features.
          -- reportUntypedClassDecorator = "none",
          --  Diagnostics for function decorators that have no type annotations. These obscure the function type,
          -- defeating many type analysis features.
          -- reportUntypedFunctionDecorator = "none",
          --  Diagnostics when “namedtuple” is used rather than “NamedTuple”. The former contains no type
          -- information, whereas the latter does.
          -- reportUntypedNamedTuple = "none",
          --  Diagnostics for call expressions whose results are not consumed and are not None.
          -- reportUnusedCallResult = "none",
          --  Diagnostics for a class with a private name (starting with an underscore) that is not accessed.
          -- reportUnusedClass = "none",
          --  Diagnostics for call expressions that return a Coroutine and whose results are not consumed.
          -- reportUnusedCoroutine = "error",
          --  Diagnostics for a function or method with a private name (starting with an underscore) that is not
          -- accessed.
          -- reportUnusedFunction = "none",
          --  Diagnostics for an imported symbol that is not referenced within that file.
          -- reportUnusedImport = "none",
          --  Diagnostics for a variable that is not accessed.
          -- reportUnusedVariable = "none",
          --  Diagnostics for an wildcard import from an external library.
          -- reportWildcardImportFromLibrary = "warning",
        },
      },
    },
  },
}
