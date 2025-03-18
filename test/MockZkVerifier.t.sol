// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test} from "forge-std/Test.sol";
import {CoFheTest} from "../src/CoFheTest.sol";
import {EncryptedInput} from "../src/MockCoFHE.sol";
import "@fhenixprotocol/cofhe-contracts/FHE.sol";

contract MockZkVerifierTests is Test {
    CoFheTest CFT;

    function setUp() public {
        CFT = new CoFheTest(false);
    }

    function test_zkVerify() public {
        address sender = address(128);

        EncryptedInput memory input = CFT.zkVerifier().zkVerify(
            5,
            Utils.EUINT8_TFHE,
            sender,
            0,
            block.chainid
        );

        input = CFT.zkVerifierSigner().zkVerifySign(input, sender);

        // Hash should be in storage
        CFT.assertHashValue(input.ctHash, 5);

        // Signature should be valid
        CFT.taskManager().MOCK_verifyInEuintSignature(
            input.ctHash,
            int32(int8(input.securityZone)),
            input.utype,
            input.signature
        );
    }

    function test_zkVerifyPacked() public {
        uint8[] memory utypes = new uint8[](2);
        utypes[0] = Utils.EUINT8_TFHE;
        utypes[1] = Utils.EUINT8_TFHE;

        uint256[] memory values = new uint256[](2);
        values[0] = 5;
        values[1] = 6;

        address sender = address(128);

        EncryptedInput[] memory inputs = CFT.zkVerifier().zkVerifyPacked(
            values,
            utypes,
            sender,
            0,
            block.chainid
        );

        inputs = CFT.zkVerifierSigner().zkVerifySignPacked(inputs, sender);

        // Hash should be in storage
        CFT.assertHashValue(inputs[0].ctHash, 5);
        CFT.assertHashValue(inputs[1].ctHash, 6);

        // Signature should be valid
        CFT.taskManager().MOCK_verifyInEuintSignature(
            inputs[0].ctHash,
            int32(int8(inputs[0].securityZone)),
            inputs[0].utype,
            inputs[0].signature
        );
        CFT.taskManager().MOCK_verifyInEuintSignature(
            inputs[1].ctHash,
            int32(int8(inputs[1].securityZone)),
            inputs[1].utype,
            inputs[1].signature
        );
    }
}
