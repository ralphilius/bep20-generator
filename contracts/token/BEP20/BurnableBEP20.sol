// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./lib/BEP20Burnable.sol";

import "../../service/ServicePayer.sol";

/**
 * @title BurnableBEP20
 * @dev Implementation of the BurnableBEP20
 */
contract BurnableBEP20 is BEP20Burnable, ServicePayer {

    constructor (
        string memory name_,
        string memory symbol_,
        uint8 decimals_,
        uint256 initialBalance_,
        address payable feeReceiver_
    )
        BEP20(name_, symbol_)
        ServicePayer(feeReceiver_, "BurnableBEP20")
        payable
    {
        require(initialBalance_ > 0, "BurnableBEP20: supply cannot be zero");

        _setupDecimals(decimals_);
        _mint(_msgSender(), initialBalance_);
    }
}
