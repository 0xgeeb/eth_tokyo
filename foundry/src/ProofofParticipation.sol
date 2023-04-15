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
  
  function mint() external {
    uint256 _tokenId = _tokenIds.current();
    _safeMint(msg.sender, _tokenId);
    _tokenIds.increment();
  }

  function checkParticipation() external returns (uint256) {
    uint256 bctBalance = checkBCTBalance();
    uint256 pactBalance = checkPACTBalance();
    uint256 ethixBalance = checkETHIXBalance();
    uint256 gooddollarBalance = checkGBalance();
    return gooddollarBalance;
  }

  function checkBCTBalance() internal returns (uint256 _bctBalance) {
    address bct = 0x4c5f90C50Ca9F849bb75D93a393A4e1B6E68Accb;
    address bctWhale = 0x3Db779C4b9Dba398a3ec6b4284FBC2E20f7d39b0;
    (bool success, bytes memory data) = bct.call(
      abi.encodeWithSignature(
        "balanceOf(address)", 
        bctWhale
      )
    );
    require(success, "bct check failed");
    assembly {
      _bctBalance := mload(add(data, 32))
    }
  }

  function checkPACTBalance() internal returns (uint256 _pactBalance) {
    address pact = 0x73A2De6A8370108D43c3C80430C84c30df323eD2;
    address pactWhale = 0x7110b4Df915cb92F53Bc01cC9Ab15F51e5DBb52F;
    (bool success, bytes memory data) = pact.call(
      abi.encodeWithSignature(
        "balanceOf(address)",
        pactWhale
      )
    );
    require(success, "pact check failed");
    assembly {
      _pactBalance := mload(add(data, 32))
    }
  }

  function checkETHIXBalance() internal returns (uint256 _ethixBalance) {
    address ethix = 0x9995cc8F20Db5896943Afc8eE0ba463259c931ed;
    address ethixWhale = 0x60869958A341DA3F69A8C4933844271e22C5Be76;
    (bool success, bytes memory data) = ethix.call(
      abi.encodeWithSignature(
        "balanceOf(address)", 
        ethixWhale
      )
    );
    require(success, "ethix check failed");
    assembly {
      _ethixBalance := mload(add(data,32))
    }
  }

  function checkGBalance() internal returns (uint256 _gBalance) {
    address g = 0x62B8B11039FcfE5aB0C56E502b1C372A3d2a9c7A;
    address gWhale = 0xDEb250aDD368b74ebCCd59862D62fa4Fb57E09D4;
    (bool success, bytes memory data) = g.call(
      abi.encodeWithSignature(
        "balanceOf(address)",
        gWhale
      )
    );
    require(success, "g$ check failed");
    assembly {
      _gBalance := mload(add(data, 32))
    }
  }

}
