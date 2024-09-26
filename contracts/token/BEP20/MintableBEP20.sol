// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./lib/BEP20Capped.sol";
import "./lib/BEP20Mintable.sol";

import "../../service/ServicePayer.sol";

/**
 * @title MintableBEP20
 * @dev Implementation of the MintableBEP20
 */
contract MintableBEP20 is BEP20Capped, BEP20Mintable, ServicePayer {

    constructor (
        string memory name_,
        string memory symbol_,
        uint8 decimals_,
        uint256 cap_,
        uint256 initialBalance_,
        address payable feeReceiver_
    )
        BEP20(name_, symbol_)
        BEP20Capped(cap_)
        ServicePayer(feeReceiver_, "MintableBEP20")
        payable
    {
        _setupDecimals(decimals_);
        _mint(_msgSender(), initialBalance_);
    }

    /**
     * @dev Function to mint tokens.
     *
     * NOTE: restricting access to owner only. See {BEP20Mintable-mint}.
     *
     * @param account The address that will receive the minted tokens
     * @param amount The amount of tokens to mint
     */
    function _mint(address account, uint256 amount) internal override(BEP20, BEP20Capped) onlyOwner {
        super._mint(account, amount);
    }

    /**
     * @dev Function to stop minting new tokens.
     *
     * NOTE: restricting access to owner only. See {BEP20Mintable-finishMinting}.
     */
    function _finishMinting() internal override onlyOwner {
        super._finishMinting();
    }
}
