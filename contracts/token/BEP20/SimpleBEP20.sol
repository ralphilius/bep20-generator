// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./lib/BEP20.sol";

import "../../service/ServicePayer.sol";
import "../../utils/GeneratorCopyright.sol";

/**
 * @title SimpleBEP20
 * @author BEP20 Generator (https://vittominacori.github.io/bep20-generator)
 * @dev Implementation of the SimpleBEP20
 */
contract SimpleBEP20 is BEP20, ServicePayer, GeneratorCopyright("v2.1.0") {

    constructor (
        string memory name_,
        string memory symbol_,
        uint256 initialBalance_,
        address payable feeReceiver_
    )
        BEP20(name_, symbol_)
        ServicePayer(feeReceiver_, "SimpleBEP20")
        payable
    {
        require(initialBalance_ > 0, "SimpleBEP20: supply cannot be zero");

        _mint(_msgSender(), initialBalance_);
    }
}
