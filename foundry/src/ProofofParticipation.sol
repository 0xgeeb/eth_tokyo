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
    uint256 participationLevel;
    // uint256 bctBalance = checkBCTBalance();
    // if (bctBalance > 0) participationLevel++;
    // uint256 pactBalance = checkPACTBalance();
    // if (pactBalance > 0) participationLevel++;
    // uint256 ethixBalance = checkETHIXBalance();
    // if (ethixBalance > 0) participationLevel++;
    // uint256 gooddollarBalance = checkGBalance();
    // if (gooddollarBalance > 0) participationLevel++;
    // uint256 mceloBalance = checkmCELOBalance();
    // if (mceloBalance > 0) participationLevel++;
    uint256 soulnameBalance = checkSoulNameBalance();
    if (soulnameBalance > 0) participationLevel++;
    // uint256 unilpBalance = checkUniLPBalance();
    // if (unilpBalance > 0) participationLevel++;
    // uint256 stakedceloBalance = checkStakedCeloBalance();
    // if (stakedceloBalance > 0) participationLevel++;
    return soulnameBalance;
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

  function checkmCELOBalance() internal returns (uint256 _mceloBalance) {
    address mcelo = 0x7D00cd74FF385c955EA3d79e47BF06bD7386387D;
    address mceloWhale = 0xa904e2cDE2f31e4A3f626f0d9054726dBcA4695E;
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
    address soulname = 0x376f5039Df4e9E9c864185d8FaBad4f04A7E394A;
    address soulnameWhale = 0xcBf203F2ee13702Ec41404856f75357e0872484e;
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
    address unilpWhale = 0xCf8A93340EA3b17Bd16779D0f848583eb599a561;
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

  function checkStakedCeloBalance() internal returns (uint256 _stakedceloBalance) {
    address stakedcelo = 0x8A1639098644A229d08F441ea45A63AE050Ee018;
    address stakedceloWhale = 0x46C5CFC2079309F4e7d9476a01730a60e2F1a164;
    (bool success, bytes memory data) = stakedcelo.call(
      abi.encodeWithSignature(
        "balanceOf(address)",
        stakedceloWhale
      )
    );
    require(success, "stakedcelo check failed");
    assembly {
      _stakedceloBalance := mload(add(data, 32))
    }
  }

}
