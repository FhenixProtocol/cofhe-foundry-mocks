// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {FHE, euint32, inEuint32} from "../src/FHE.sol";

contract ExampleFHECounter {
    euint32 public eNumber;

    function setNumber(inEuint32 memory inNumber) public {
        eNumber = FHE.asEuint32(inNumber);
        FHE.allowThis(eNumber);
    }

    function increment() public {
        eNumber = FHE.add(eNumber, FHE.asEuint32(1));
        FHE.allowThis(eNumber);
    }

    function add(inEuint32 memory inNumber) public {
        eNumber = FHE.add(eNumber, FHE.asEuint32(inNumber));
        FHE.allowThis(eNumber);
    }

    function sub(inEuint32 memory inNumber) public {
        euint32 inAsEuint32 = FHE.asEuint32(inNumber);
        euint32 eSubOrZero = FHE.select(
            FHE.lte(inAsEuint32, eNumber),
            inAsEuint32,
            FHE.asEuint32(0)
        );
        eNumber = FHE.sub(eNumber, eSubOrZero);
        FHE.allowThis(eNumber);
    }

    function mul(inEuint32 memory inNumber) public {
        eNumber = FHE.mul(eNumber, FHE.asEuint32(inNumber));
        FHE.allowThis(eNumber);
    }

    function decrypt() public {
        FHE.decrypt(eNumber);
    }

    function getDecryptResult(euint32 input1) public view returns (uint32) {
        return FHE.getDecryptResult(input1);
    }

    function getDecryptResultSafe(
        euint32 input1
    ) public view returns (uint32 value, bool decrypted) {
        return FHE.getDecryptResultSafe(input1);
    }
}
