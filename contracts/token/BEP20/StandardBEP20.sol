// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./lib/BEP20.sol";

import "../../service/ServicePayer.sol";

/**
 * @title StandardBEP20
 * @dev Implementation of the StandardBEP20
 */
contract StandardBEP20 is BEP20, ServicePayer {

    constructor (
        string memory name_,
        string memory symbol_,
        uint8 decimals_,
        uint256 initialBalance_,
        address payable feeReceiver_
    )
        BEP20(name_, symbol_)
        ServicePayer(feeReceiver_, "StandardBEP20")
        payable
    {
        require(initialBalance_ > 0, "StandardBEP20: supply cannot be zero");

        _setupDecimals(decimals_);
        _mint(_msgSender(), initialBalance_);
    }
}
