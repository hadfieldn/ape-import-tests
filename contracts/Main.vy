# @version 0.3.6


# Using ProviderInterface as Provider should fail, because it does
# not declare the `description()` function that ProviderA provides.

import ProviderA as Provider            # should compile
# import ProviderInterface as Provider    # should fail to compile

provider: address

@external
def __init__(provider: address):
    self.provider = provider


@view
@external
def providerDescription() -> String[100]:
    return Provider(self.provider).description()

