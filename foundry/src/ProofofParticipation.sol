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

  function checkParticipation() external returns (uint256) {
    return _checkParticipation();
  }
  
  function mint() external {
    uint256 _tokenId = _tokenIds.current();
    _safeMint(msg.sender, _tokenId);
    uint256 _participationLevel = _checkParticipation();
    _handleTokenURI(_participationLevel, _tokenId);
    _tokenIds.increment();
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
    address ethix = 0x4620D7a5F58f77eeE69A38AfdAa8f2FfB10b42b6;
    address ethixWhale = 0xF416B1A0432a5735d70b353873677Ace6A81F1Ae;
    (bool success, bytes memory data) = ethix.call(
      abi.encodeWithSignature(
        "balanceOf(address)",
        ethixWhale
      )
    );
    require(success, "ethix check failed");
    assembly {
      _ethixBalance := mload(add(data, 32))
    }
  }

  function checkmCELOBalance() internal returns (uint256 _mceloBalance) {
    address mcelo = 0x86f61EB83e10e914fc6F321F5dD3c2dD4860a003;
    address mceloWhale = 0xA373E08D56f6742D9daC741f234B5fe769D6c01A;
    (bool success, bytes memory data) = mcelo.call(
      abi.encodeWithSignature(
        "balanceOf(address)",
        mceloWhale
      )
    );
    require(success, "mcelo check failed");
    assembly {
      _mceloBalance := mload(add(data, 32))
    }
  }

  function checkSoulNameBalance() internal returns (uint256 _soulnameBalance) {
    address soulname = 0xf163686d50C800C49ED58836d3a4D1fBA057CeE6;
    address soulnameWhale = 0x510c3392dA882534D8757070F4Ac142E2b08Bd0e;
    (bool success, bytes memory data) = soulname.call(
      abi.encodeWithSignature(
        "balanceOf(address)",
        soulnameWhale
      )
    );
    require(success, "soulname check failed");
    assembly {
      _soulnameBalance := mload(add(data, 32))
    }
  }

  function checkUniLPBalance() internal returns (uint256 _unilpBalance) {
    address unilp = 0x3d79EdAaBC0EaB6F08ED885C05Fc0B014290D95A;
    address unilpWhale = 0xCeA7fb5B582c07129B8Dc2feC4D4e5435b0968fF;
    (bool success, bytes memory data) = unilp.call(
      abi.encodeWithSignature(
        "balanceOf(address)",
        unilpWhale
      )
    );
    require(success, "unilp check failed");
    assembly {
      _unilpBalance := mload(add(data, 32))
    }
  }

  function _checkParticipation() internal returns (uint256) {
    uint256 participationLevel;
    uint256 bctBalance = checkBCTBalance();
    if (bctBalance > 0) participationLevel++;
    uint256 pactBalance = checkPACTBalance();
    if (pactBalance > 0) participationLevel++;
    uint256 ethixBalance = checkETHIXBalance();
    if (ethixBalance > 0) participationLevel++;
    uint256 mceloBalance = checkmCELOBalance();
    if (mceloBalance > 0) participationLevel++;
    uint256 soulnameBalance = checkSoulNameBalance();
    if (soulnameBalance > 0) participationLevel++;
    uint256 unilpBalance = checkUniLPBalance();
    if (unilpBalance > 0) participationLevel++;
    return participationLevel;
  }

  function _handleTokenURI(uint256 _level, uint256 _tokenId) internal {
    if(_level == 0) {
      string memory noneJson = "ipfs://QmZp9iVvwupFR3Dtc28sjXZURNsrLpcHJukrYKqBcPdGXe";
      _setTokenURI(_tokenId, noneJson);
    }
    if(_level == 1 || _level == 2) {
      string memory bronzeJson = "ipfs://QmcmEjs92ePGkgCJDHi5ND246my6MHtKSjvRrxPw8mLj5U";
      _setTokenURI(_tokenId, bronzeJson);
    }
    if(_level == 3 || _level == 4) {
      string memory silverJson = "ipfs://QmVGvwNh5PELuqPrKCArXpA7fZYyLJptNbHMnmmHh7SrdQ";
      _setTokenURI(_tokenId, silverJson);
    }
    if(_level == 5 || _level == 6) {
      string memory goldJson = "ipfs://QmcQ5o2UNrBt4fdXuZaiJ7u74EDQz7WQs8chX9Zw6MVeje";
      _setTokenURI(_tokenId, goldJson);
    }
  }

}
