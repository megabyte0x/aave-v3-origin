// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "./MarketInput.sol";

contract DefaultMarketInput is MarketInput {
    function _getMarketInput(address deployer)
        internal
        pure
        override
        returns (
            Roles memory roles,
            MarketConfig memory config,
            DeployFlags memory flags,
            MarketReport memory deployedContracts
        )
    {
        roles.marketOwner = deployer;
        roles.emergencyAdmin = deployer;
        roles.poolAdmin = deployer;

        config.marketId = "Aave V3 Testnet Market";
        config.providerId = 84532;
        config.oracleDecimals = 8;
        config.flashLoanPremium = 0.0005e4;
        config.networkBaseTokenPriceInUsdProxyAggregator = 0x3c65e28D357a37589e1C7C86044a9f44dDC17134;
        config.marketReferenceCurrencyPriceInUsdProxyAggregator = 0x3c65e28D357a37589e1C7C86044a9f44dDC17134;
        config.wrappedNativeToken = 0x4200000000000000000000000000000000000006;

        flags.l2 = true;

        return (roles, config, flags, deployedContracts);
    }
}
