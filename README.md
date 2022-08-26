# Testing Ape support for Vyper interfaces

This repo contains separate branches to test different Vyper syntaxes for importing an interface:

- `master` -- compiles successfully with both Ape and Vyper
- `absolute-import-from-current-dir` -- fails to compile with Ape
- `absolute-import-from-subfolder` -- fails to compile with Ape
- `relative-import` -- fails to compile with Ape


## Background

Per the [Vyper documentation](https://vyper.readthedocs.io/en/stable/interfaces.html#importing-interfaces) on importing interfaces, all of the following should work:

```vyper

# works with `ape compile`
import ProviderInterface as Provider                       # absolute import

# does NOT work with `ape compile` (but does work with `vyper` compile)
import contracts.ProviderInterface as Provider             # absolute import with full path
from . import ProviderInterface as Provider                # relative import
from .interfaces import ProviderInterface as Provider.     # relative import with subfolder
```

Each of the above will compile directly with Vyper, but when compiling with ape 0.4.0 - 0.4.5, the compiler raises a `FileNotFoundError`:

```
ERROR: (VyperCompileError) FileNotFoundError:  Cannot locate interface 'contracts/ProviderInterface{.vy,.json}'
```

## Setup

1. Install Python 3.9.8 (or similar)

1. `pip install -r requirements.txt`

1. `ape plugins install .`


## Tests

If the compiler is working successfully with the import statements, the following tests should function as described. However, when any branch other than `main` is compiled with `ape compile`, the compilation fails with a FileNotFoundError when trying to locate the interface.


### Test that valid usage compiles successfully

1. `ape compile`

1. Compilation should succeed without errors.

### Test that invalid usage is caught by compiler

1. Edit import in `Main.vy` to the following

   ```vyper
   # import ProviderA as Provider         # should compile
   import ProviderInterface as Provider   # should fail to compile
   ```

1. `ape compile`

1. Compilation should fail with the following message:

   ```
   ERROR: (VyperCompileError) vyper.exceptions.UnknownAttribute: Provider has no member 'description'.
   ```
