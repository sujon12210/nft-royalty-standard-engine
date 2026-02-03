// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "erc721a/contracts/ERC721A.sol";
import "@openzeppelin/contracts/token/common/ERC2981.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract RoyaltyNFT is ERC721A, ERC2981, Ownable {
    string public baseURI;
    uint256 public constant MINT_PRICE = 0.05 ether;

    constructor(string memory name, string memory symbol, string memory _initialBaseURI) 
        ERC721A(name, symbol) 
        Ownable(msg.sender) 
    {
        baseURI = _initialBaseURI;
        // Sets default royalty to 5% (500 basis points)
        _setDefaultRoyalty(msg.sender, 500);
    }

    function mint(uint256 quantity) external payable {
        require(msg.value >= MINT_PRICE * quantity, "Insufficient funds");
        _mint(msg.sender, quantity);
    }

    function supportsInterface(bytes4 interfaceId) public view override(ERC721A, ERC2981) returns (bool) {
        return ERC721A.supportsInterface(interfaceId) || ERC2981.supportsInterface(interfaceId);
    }

    function setRoyalty(address receiver, uint96 feeNumerator) external onlyOwner {
        _setDefaultRoyalty(receiver, feeNumerator);
    }

    function withdraw() external onlyOwner {
        payable(owner()).transfer(address(this).balance);
    }
}
