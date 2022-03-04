// SPDX-License-Identifier: MIT
pragma solidity 0.8.10;

import {IBasePortfolio} from "../interfaces/IBasePortfolio.sol";

contract WhitelistDeposit {
    mapping(IBasePortfolio => mapping(address => bool)) public isWhitelisted;

    event WhitelistStatusChanged(IBasePortfolio portfolio, address user, bool status);

    function deposit(IBasePortfolio portfolio, uint256 amount) external {
        require(isWhitelisted[portfolio][msg.sender], "WhitelistDeposit: User is not whitelisted for deposit");
        portfolio.deposit(amount, msg.sender);
    }

    function setWhitelistStatus(
        IBasePortfolio portfolio,
        address user,
        bool status
    ) external {
        require(portfolio.manager() == msg.sender, "WhitelistDeposit: Only portfolio manager can change whitelist status");
        isWhitelisted[portfolio][user] = status;
        emit WhitelistStatusChanged(portfolio, user, status);
    }
}
