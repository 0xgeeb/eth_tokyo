// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import { ERC721 } from "../lib/openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";
import { ERC721URIStorage } from "../lib/openzeppelin-contracts/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import { Counters } from "../lib/openzeppelin-contracts/contracts/utils/Counters.sol";


contract ProofofParticipation is ERC721URIStorage {

  using Counters for Counters.Counter;
  Counters.Counter private _tokenIds;

  constructor() ERC721 ("Proof of Participation", "PoP") {
    _tokenIds.increment();
  }

  uint256 public tokenIds;
  
  function mint() external {
    uint256 _tokenId = _tokenIds.current();
    _safeMint(msg.sender, _tokenId);
    _tokenIds.increment();
  }

  function checkParticipation() internal view {
    
  }

}
