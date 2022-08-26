# Testing Ape support for Vyper interfaces

### Setup

1. Install Python 3.9.8 (or similar)

1. `pip install -r requirements.txt`

1. `ape plugins install .`

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
