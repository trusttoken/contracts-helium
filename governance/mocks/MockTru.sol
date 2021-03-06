// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MockTru is ERC20 {
    constructor() ERC20("MockTru", "MT") {}

    function decimals() public view virtual override returns (uint8) {
        return 8;
    }

    function mint(address receiver, uint256 amount) external {
        _mint(receiver, amount);
    }
}
