# @version 0.3.6

from . import ProviderInterface as Provider

implements: Provider

data: public(HashMap[address, uint256])

@external
@view
def description() -> String[100]:
    return "ProviderA description"

@external
@view
def name() -> String[50]:
    return "ProviderA"

