// SPDX-License-Identifier: BSD-3-Clause-Clear
// solhint-disable one-contract-per-file

pragma solidity >=0.8.19 <0.9.0;

import "@openzeppelin/contracts/utils/Strings.sol";
import "./ICofhe.sol";

type ebool is uint256;
type euint8 is uint256;
type euint16 is uint256;
type euint32 is uint256;
type euint64 is uint256;
type euint128 is uint256;
type euint256 is uint256;
type eaddress is uint256;

struct inEbool {
    int32 securityZone;
    uint256 hash;
    uint8 utype;
    bytes signature;
}

struct inEuint8 {
    int32 securityZone;
    uint256 hash;
    uint8 utype;
    bytes signature;
}

struct inEuint16 {
    int32 securityZone;
    uint256 hash;
    uint8 utype;
    bytes signature;
}

struct inEuint32 {
    int32 securityZone;
    uint256 hash;
    uint8 utype;
    bytes signature;
}

struct inEuint64 {
    int32 securityZone;
    uint256 hash;
    uint8 utype;
    bytes signature;
}

struct inEuint128 {
    int32 securityZone;
    uint256 hash;
    uint8 utype;
    bytes signature;
}

struct inEuint256 {
    int32 securityZone;
    uint256 hash;
    uint8 utype;
    bytes signature;
}

struct inEaddress {
    int32 securityZone;
    uint256 hash;
    uint8 utype;
    bytes signature;
}

// ================================
// \/ \/ \/ \/ \/ \/ \/ \/ \/ \/ \/
// TODO : CHANGE ME AFTER DEPLOYING
// /\ /\ /\ /\ /\ /\ /\ /\ /\ /\ /\
// ================================
//solhint-disable const-name-snakecase
address constant TASK_MANAGER_ADDRESS = 0xbeb4eF1fcEa618C6ca38e3828B00f8D481EC2CC2;

library Common {
    // Default value for temp hash calculation in unary operations
    string private constant DEFAULT_VALUE = "0";

    function bigIntToBool(uint256 i) internal pure returns (bool) {
        return (i > 0);
    }

    function bigIntToUint8(uint256 i) internal pure returns (uint8) {
        return uint8(i);
    }

    function bigIntToUint16(uint256 i) internal pure returns (uint16) {
        return uint16(i);
    }

    function bigIntToUint32(uint256 i) internal pure returns (uint32) {
        return uint32(i);
    }

    function bigIntToUint64(uint256 i) internal pure returns (uint64) {
        return uint64(i);
    }

    function bigIntToUint128(uint256 i) internal pure returns (uint128) {
        return uint128(i);
    }

    function bigIntToUint256(uint256 i) internal pure returns (uint256) {
        return i;
    }

    function bigIntToAddress(uint256 i) internal pure returns (address) {
        return address(uint160(i));
    }

    function toBytes(uint256 x) internal pure returns (bytes memory b) {
        b = new bytes(32);
        assembly {
            mstore(add(b, 32), x)
        }
    }

    function functionCodeToBytes1(
        string memory functionCode
    ) internal pure returns (bytes memory) {
        // Convert the hex string to bytes
        bytes memory result = new bytes(1);
        assembly {
            result := mload(add(functionCode, 1)) // Load the bytes directly from memory
        }

        return result;
    }

    function uint256ToBytes32(
        uint256 value
    ) internal pure returns (bytes memory) {
        bytes memory result = new bytes(32);
        assembly {
            mstore(add(result, 32), value)
        }
        return result;
    }

    function convertInt32ToUint256(
        int32 value
    ) internal pure returns (uint256) {
        require(value >= 0, "Value must be non-negative");
        return uint256(uint32(value));
    }

    function isInitialized(uint256 hash) internal pure returns (bool) {
        return hash != 0;
    }

    // Return true if the encrypted integer is initialized and false otherwise.
    function isInitialized(ebool v) internal pure returns (bool) {
        return isInitialized(ebool.unwrap(v));
    }

    // Return true if the encrypted integer is initialized and false otherwise.
    function isInitialized(euint8 v) internal pure returns (bool) {
        return isInitialized(euint8.unwrap(v));
    }

    // Return true if the encrypted integer is initialized and false otherwise.
    function isInitialized(euint16 v) internal pure returns (bool) {
        return isInitialized(euint16.unwrap(v));
    }

    // Return true if the encrypted integer is initialized and false otherwise.
    function isInitialized(euint32 v) internal pure returns (bool) {
        return isInitialized(euint32.unwrap(v));
    }

    // Return true if the encrypted integer is initialized and false otherwise.
    function isInitialized(euint64 v) internal pure returns (bool) {
        return isInitialized(euint64.unwrap(v));
    }

    // Return true if the encrypted integer is initialized and false otherwise.
    function isInitialized(euint128 v) internal pure returns (bool) {
        return isInitialized(euint128.unwrap(v));
    }

    // Return true if the encrypted integer is initialized and false otherwise.
    function isInitialized(euint256 v) internal pure returns (bool) {
        return isInitialized(euint256.unwrap(v));
    }

    function isInitialized(eaddress v) internal pure returns (bool) {
        return isInitialized(eaddress.unwrap(v));
    }

    function getValue(bytes memory a) internal pure returns (uint256 value) {
        assembly {
            value := mload(add(a, 0x20))
        }
    }

    function createHashInput(
        uint256 input1
    ) internal pure returns (uint256[] memory) {
        uint256[] memory inputs = new uint256[](1);
        inputs[0] = input1;
        return inputs;
    }

    function createHashInput(
        uint256 input1,
        uint256 input2
    ) internal pure returns (uint256[] memory) {
        uint256[] memory inputs = new uint256[](2);
        inputs[0] = input1;
        inputs[1] = input2;
        return inputs;
    }

    function createHashInput(
        uint256 input1,
        uint256 input2,
        uint256 input3
    ) internal pure returns (uint256[] memory) {
        uint256[] memory inputs = new uint256[](3);
        inputs[0] = input1;
        inputs[1] = input2;
        inputs[2] = input3;
        return inputs;
    }

    function createUint256Inputs(
        uint256 input1
    ) internal pure returns (uint256[] memory) {
        uint256[] memory inputs = new uint256[](1);
        inputs[0] = input1;
        return inputs;
    }

    function createUint256Inputs(
        uint256 input1,
        uint256 input2
    ) internal pure returns (uint256[] memory) {
        uint256[] memory inputs = new uint256[](2);
        inputs[0] = input1;
        inputs[1] = input2;
        return inputs;
    }

    function createUint256Inputs(
        uint256 input1,
        uint256 input2,
        uint256 input3
    ) internal pure returns (uint256[] memory) {
        uint256[] memory inputs = new uint256[](3);
        inputs[0] = input1;
        inputs[1] = input2;
        inputs[2] = input3;
        return inputs;
    }
}

library Impl {
    function trivialEncrypt(
        uint256 value,
        uint8 toType,
        int32 securityZone
    ) internal returns (uint256) {
        return
            ITaskManager(TASK_MANAGER_ADDRESS).createTask(
                toType,
                FunctionId.trivialEncrypt,
                new uint256[](0),
                Common.createUint256Inputs(
                    value,
                    toType,
                    Common.convertInt32ToUint256(securityZone)
                )
            );
    }

    function cast(uint256 key, uint8 toType) internal returns (uint256) {
        return
            ITaskManager(TASK_MANAGER_ADDRESS).createTask(
                toType,
                FunctionId.cast,
                Common.createUint256Inputs(key),
                Common.createUint256Inputs(toType)
            );
    }

    function select(
        uint8 returnType,
        ebool control,
        uint256 ifTrue,
        uint256 ifFalse
    ) internal returns (uint256 result) {
        return
            ITaskManager(TASK_MANAGER_ADDRESS).createTask(
                returnType,
                FunctionId.select,
                Common.createUint256Inputs(
                    ebool.unwrap(control),
                    ifTrue,
                    ifFalse
                ),
                new uint256[](0)
            );
    }

    function mathOp(
        uint8 returnType,
        uint256 lhs,
        uint256 rhs,
        FunctionId functionId
    ) internal returns (uint256) {
        return
            ITaskManager(TASK_MANAGER_ADDRESS).createTask(
                returnType,
                functionId,
                Common.createUint256Inputs(lhs, rhs),
                new uint256[](0)
            );
    }

    function decrypt(uint256 input) internal returns (uint256) {
        ITaskManager(TASK_MANAGER_ADDRESS).createDecryptTask(input, msg.sender);
        return input;
    }

    function getDecryptResult(uint256 input) internal view returns (uint256) {
        return ITaskManager(TASK_MANAGER_ADDRESS).getDecryptResult(input);
    }

    function getDecryptResultSafe(
        uint256 input
    ) internal view returns (uint256 result, bool decrypted) {
        return ITaskManager(TASK_MANAGER_ADDRESS).getDecryptResultSafe(input);
    }

    function not(uint8 returnType, uint256 input) internal returns (uint256) {
        return
            ITaskManager(TASK_MANAGER_ADDRESS).createTask(
                returnType,
                FunctionId.not,
                Common.createUint256Inputs(input),
                new uint256[](0)
            );
    }

    function square(
        uint8 returnType,
        uint256 input
    ) internal returns (uint256) {
        return
            ITaskManager(TASK_MANAGER_ADDRESS).createTask(
                returnType,
                FunctionId.square,
                Common.createUint256Inputs(input),
                new uint256[](0)
            );
    }

    /// @notice Generates a random value of a given type with the given seed, for the provided securityZone
    /// @dev Calls the desired function
    /// @param uintType the type of the random value to generate
    /// @param seed the seed to use to create a random value from
    /// @param securityZone the security zone to use for the random value
    function random(
        uint8 uintType,
        uint64 seed,
        int32 securityZone
    ) internal returns (uint256) {
        return
            ITaskManager(TASK_MANAGER_ADDRESS).createTask(
                uintType,
                FunctionId.random,
                new uint256[](0),
                Common.createUint256Inputs(
                    seed,
                    Common.convertInt32ToUint256(securityZone)
                )
            );
    }

    /// @notice Generates a random value of a given type with the given seed
    /// @dev Calls the desired function
    /// @param uintType the type of the random value to generate
    /// @param seed the seed to use to create a random value from
    function random(uint8 uintType, uint32 seed) internal returns (uint256) {
        return random(uintType, seed, 0);
    }

    /// @notice Generates a random value of a given type
    /// @dev Calls the desired function
    /// @param uintType the type of the random value to generate
    function random(uint8 uintType) internal returns (uint256) {
        return random(uintType, 0, 0);
    }
}

library FHE {
    /// @notice This function performs the add async operation
    /// @dev It verifies that the value matches a valid ciphertext
    /// @param lhs The first input
    /// @param rhs The second input
    /// @return The result of the operation
    function add(euint8 lhs, euint8 rhs) internal returns (euint8) {
        if (!Common.isInitialized(lhs)) {
            lhs = asEuint8(0);
        }
        if (!Common.isInitialized(rhs)) {
            rhs = asEuint8(0);
        }

        return
            euint8.wrap(
                Impl.mathOp(
                    Utils.EUINT8_TFHE,
                    euint8.unwrap(lhs),
                    euint8.unwrap(rhs),
                    FunctionId.add
                )
            );
    }

    /// @notice This function performs the add async operation
    /// @dev It verifies that the value matches a valid ciphertext
    /// @param lhs The first input
    /// @param rhs The second input
    /// @return The result of the operation
    function add(euint16 lhs, euint16 rhs) internal returns (euint16) {
        if (!Common.isInitialized(lhs)) {
            lhs = asEuint16(0);
        }
        if (!Common.isInitialized(rhs)) {
            rhs = asEuint16(0);
        }

        return
            euint16.wrap(
                Impl.mathOp(
                    Utils.EUINT16_TFHE,
                    euint16.unwrap(lhs),
                    euint16.unwrap(rhs),
                    FunctionId.add
                )
            );
    }

    /// @notice This function performs the add async operation
    /// @dev It verifies that the value matches a valid ciphertext
    /// @param lhs The first input
    /// @param rhs The second input
    /// @return The result of the operation
    function add(euint32 lhs, euint32 rhs) internal returns (euint32) {
        if (!Common.isInitialized(lhs)) {
            lhs = asEuint32(0);
        }
        if (!Common.isInitialized(rhs)) {
            rhs = asEuint32(0);
        }

        return
            euint32.wrap(
                Impl.mathOp(
                    Utils.EUINT32_TFHE,
                    euint32.unwrap(lhs),
                    euint32.unwrap(rhs),
                    FunctionId.add
                )
            );
    }

    /// @notice This function performs the add async operation
    /// @dev It verifies that the value matches a valid ciphertext
    /// @param lhs The first input
    /// @param rhs The second input
    /// @return The result of the operation
    function add(euint64 lhs, euint64 rhs) internal returns (euint64) {
        if (!Common.isInitialized(lhs)) {
            lhs = asEuint64(0);
        }
        if (!Common.isInitialized(rhs)) {
            rhs = asEuint64(0);
        }

        return
            euint64.wrap(
                Impl.mathOp(
                    Utils.EUINT64_TFHE,
                    euint64.unwrap(lhs),
                    euint64.unwrap(rhs),
                    FunctionId.add
                )
            );
    }

    /// @notice This function performs the add async operation
    /// @dev It verifies that the value matches a valid ciphertext
    /// @param lhs The first input
    /// @param rhs The second input
    /// @return The result of the operation
    function add(euint128 lhs, euint128 rhs) internal returns (euint128) {
        if (!Common.isInitialized(lhs)) {
            lhs = asEuint128(0);
        }
        if (!Common.isInitialized(rhs)) {
            rhs = asEuint128(0);
        }

        return
            euint128.wrap(
                Impl.mathOp(
                    Utils.EUINT128_TFHE,
                    euint128.unwrap(lhs),
                    euint128.unwrap(rhs),
                    FunctionId.add
                )
            );
    }

    /// @notice This function performs the add async operation
    /// @dev It verifies that the value matches a valid ciphertext
    /// @param lhs The first input
    /// @param rhs The second input
    /// @return The result of the operation
    function add(euint256 lhs, euint256 rhs) internal returns (euint256) {
        if (!Common.isInitialized(lhs)) {
            lhs = asEuint256(0);
        }
        if (!Common.isInitialized(rhs)) {
            rhs = asEuint256(0);
        }

        return
            euint256.wrap(
                Impl.mathOp(
                    Utils.EUINT256_TFHE,
                    euint256.unwrap(lhs),
                    euint256.unwrap(rhs),
                    FunctionId.add
                )
            );
    }

    /// @notice This function performs the lte async operation
    /// @dev It verifies that the value matches a valid ciphertext
    /// @param lhs The first input
    /// @param rhs The second input
    /// @return The result of the operation
    function lte(euint8 lhs, euint8 rhs) internal returns (ebool) {
        if (!Common.isInitialized(lhs)) {
            lhs = asEuint8(0);
        }
        if (!Common.isInitialized(rhs)) {
            rhs = asEuint8(0);
        }

        return
            ebool.wrap(
                Impl.mathOp(
                    Utils.EUINT8_TFHE,
                    euint8.unwrap(lhs),
                    euint8.unwrap(rhs),
                    FunctionId.lte
                )
            );
    }

    /// @notice This function performs the lte async operation
    /// @dev It verifies that the value matches a valid ciphertext
    /// @param lhs The first input
    /// @param rhs The second input
    /// @return The result of the operation
    function lte(euint16 lhs, euint16 rhs) internal returns (ebool) {
        if (!Common.isInitialized(lhs)) {
            lhs = asEuint16(0);
        }
        if (!Common.isInitialized(rhs)) {
            rhs = asEuint16(0);
        }

        return
            ebool.wrap(
                Impl.mathOp(
                    Utils.EUINT16_TFHE,
                    euint16.unwrap(lhs),
                    euint16.unwrap(rhs),
                    FunctionId.lte
                )
            );
    }

    /// @notice This function performs the lte async operation
    /// @dev It verifies that the value matches a valid ciphertext
    /// @param lhs The first input
    /// @param rhs The second input
    /// @return The result of the operation
    function lte(euint32 lhs, euint32 rhs) internal returns (ebool) {
        if (!Common.isInitialized(lhs)) {
            lhs = asEuint32(0);
        }
        if (!Common.isInitialized(rhs)) {
            rhs = asEuint32(0);
        }

        return
            ebool.wrap(
                Impl.mathOp(
                    Utils.EUINT32_TFHE,
                    euint32.unwrap(lhs),
                    euint32.unwrap(rhs),
                    FunctionId.lte
                )
            );
    }

    /// @notice This function performs the lte async operation
    /// @dev It verifies that the value matches a valid ciphertext
    /// @param lhs The first input
    /// @param rhs The second input
    /// @return The result of the operation
    function lte(euint64 lhs, euint64 rhs) internal returns (ebool) {
        if (!Common.isInitialized(lhs)) {
            lhs = asEuint64(0);
        }
        if (!Common.isInitialized(rhs)) {
            rhs = asEuint64(0);
        }

        return
            ebool.wrap(
                Impl.mathOp(
                    Utils.EUINT64_TFHE,
                    euint64.unwrap(lhs),
                    euint64.unwrap(rhs),
                    FunctionId.lte
                )
            );
    }

    /// @notice This function performs the lte async operation
    /// @dev It verifies that the value matches a valid ciphertext
    /// @param lhs The first input
    /// @param rhs The second input
    /// @return The result of the operation
    function lte(euint128 lhs, euint128 rhs) internal returns (ebool) {
        if (!Common.isInitialized(lhs)) {
            lhs = asEuint128(0);
        }
        if (!Common.isInitialized(rhs)) {
            rhs = asEuint128(0);
        }

        return
            ebool.wrap(
                Impl.mathOp(
                    Utils.EUINT128_TFHE,
                    euint128.unwrap(lhs),
                    euint128.unwrap(rhs),
                    FunctionId.lte
                )
            );
    }

    /// @notice This function performs the lte async operation
    /// @dev It verifies that the value matches a valid ciphertext
    /// @param lhs The first input
    /// @param rhs The second input
    /// @return The result of the operation
    function lte(euint256 lhs, euint256 rhs) internal returns (ebool) {
        if (!Common.isInitialized(lhs)) {
            lhs = asEuint256(0);
        }
        if (!Common.isInitialized(rhs)) {
            rhs = asEuint256(0);
        }

        return
            ebool.wrap(
                Impl.mathOp(
                    Utils.EUINT256_TFHE,
                    euint256.unwrap(lhs),
                    euint256.unwrap(rhs),
                    FunctionId.lte
                )
            );
    }

    /// @notice This function performs the sub async operation
    /// @dev It verifies that the value matches a valid ciphertext
    /// @param lhs The first input
    /// @param rhs The second input
    /// @return The result of the operation
    function sub(euint8 lhs, euint8 rhs) internal returns (euint8) {
        if (!Common.isInitialized(lhs)) {
            lhs = asEuint8(0);
        }
        if (!Common.isInitialized(rhs)) {
            rhs = asEuint8(0);
        }

        return
            euint8.wrap(
                Impl.mathOp(
                    Utils.EUINT8_TFHE,
                    euint8.unwrap(lhs),
                    euint8.unwrap(rhs),
                    FunctionId.sub
                )
            );
    }

    /// @notice This function performs the sub async operation
    /// @dev It verifies that the value matches a valid ciphertext
    /// @param lhs The first input
    /// @param rhs The second input
    /// @return The result of the operation
    function sub(euint16 lhs, euint16 rhs) internal returns (euint16) {
        if (!Common.isInitialized(lhs)) {
            lhs = asEuint16(0);
        }
        if (!Common.isInitialized(rhs)) {
            rhs = asEuint16(0);
        }

        return
            euint16.wrap(
                Impl.mathOp(
                    Utils.EUINT16_TFHE,
                    euint16.unwrap(lhs),
                    euint16.unwrap(rhs),
                    FunctionId.sub
                )
            );
    }

    /// @notice This function performs the sub async operation
    /// @dev It verifies that the value matches a valid ciphertext
    /// @param lhs The first input
    /// @param rhs The second input
    /// @return The result of the operation
    function sub(euint32 lhs, euint32 rhs) internal returns (euint32) {
        if (!Common.isInitialized(lhs)) {
            lhs = asEuint32(0);
        }
        if (!Common.isInitialized(rhs)) {
            rhs = asEuint32(0);
        }

        return
            euint32.wrap(
                Impl.mathOp(
                    Utils.EUINT32_TFHE,
                    euint32.unwrap(lhs),
                    euint32.unwrap(rhs),
                    FunctionId.sub
                )
            );
    }

    /// @notice This function performs the sub async operation
    /// @dev It verifies that the value matches a valid ciphertext
    /// @param lhs The first input
    /// @param rhs The second input
    /// @return The result of the operation
    function sub(euint64 lhs, euint64 rhs) internal returns (euint64) {
        if (!Common.isInitialized(lhs)) {
            lhs = asEuint64(0);
        }
        if (!Common.isInitialized(rhs)) {
            rhs = asEuint64(0);
        }

        return
            euint64.wrap(
                Impl.mathOp(
                    Utils.EUINT64_TFHE,
                    euint64.unwrap(lhs),
                    euint64.unwrap(rhs),
                    FunctionId.sub
                )
            );
    }

    /// @notice This function performs the sub async operation
    /// @dev It verifies that the value matches a valid ciphertext
    /// @param lhs The first input
    /// @param rhs The second input
    /// @return The result of the operation
    function sub(euint128 lhs, euint128 rhs) internal returns (euint128) {
        if (!Common.isInitialized(lhs)) {
            lhs = asEuint128(0);
        }
        if (!Common.isInitialized(rhs)) {
            rhs = asEuint128(0);
        }

        return
            euint128.wrap(
                Impl.mathOp(
                    Utils.EUINT128_TFHE,
                    euint128.unwrap(lhs),
                    euint128.unwrap(rhs),
                    FunctionId.sub
                )
            );
    }

    /// @notice This function performs the sub async operation
    /// @dev It verifies that the value matches a valid ciphertext
    /// @param lhs The first input
    /// @param rhs The second input
    /// @return The result of the operation
    function sub(euint256 lhs, euint256 rhs) internal returns (euint256) {
        if (!Common.isInitialized(lhs)) {
            lhs = asEuint256(0);
        }
        if (!Common.isInitialized(rhs)) {
            rhs = asEuint256(0);
        }

        return
            euint256.wrap(
                Impl.mathOp(
                    Utils.EUINT256_TFHE,
                    euint256.unwrap(lhs),
                    euint256.unwrap(rhs),
                    FunctionId.sub
                )
            );
    }

    /// @notice This function performs the mul async operation
    /// @dev It verifies that the value matches a valid ciphertext
    /// @param lhs The first input
    /// @param rhs The second input
    /// @return The result of the operation
    function mul(euint8 lhs, euint8 rhs) internal returns (euint8) {
        if (!Common.isInitialized(lhs)) {
            lhs = asEuint8(0);
        }
        if (!Common.isInitialized(rhs)) {
            rhs = asEuint8(0);
        }

        return
            euint8.wrap(
                Impl.mathOp(
                    Utils.EUINT8_TFHE,
                    euint8.unwrap(lhs),
                    euint8.unwrap(rhs),
                    FunctionId.mul
                )
            );
    }

    /// @notice This function performs the mul async operation
    /// @dev It verifies that the value matches a valid ciphertext
    /// @param lhs The first input
    /// @param rhs The second input
    /// @return The result of the operation
    function mul(euint16 lhs, euint16 rhs) internal returns (euint16) {
        if (!Common.isInitialized(lhs)) {
            lhs = asEuint16(0);
        }
        if (!Common.isInitialized(rhs)) {
            rhs = asEuint16(0);
        }

        return
            euint16.wrap(
                Impl.mathOp(
                    Utils.EUINT16_TFHE,
                    euint16.unwrap(lhs),
                    euint16.unwrap(rhs),
                    FunctionId.mul
                )
            );
    }

    /// @notice This function performs the mul async operation
    /// @dev It verifies that the value matches a valid ciphertext
    /// @param lhs The first input
    /// @param rhs The second input
    /// @return The result of the operation
    function mul(euint32 lhs, euint32 rhs) internal returns (euint32) {
        if (!Common.isInitialized(lhs)) {
            lhs = asEuint32(0);
        }
        if (!Common.isInitialized(rhs)) {
            rhs = asEuint32(0);
        }

        return
            euint32.wrap(
                Impl.mathOp(
                    Utils.EUINT32_TFHE,
                    euint32.unwrap(lhs),
                    euint32.unwrap(rhs),
                    FunctionId.mul
                )
            );
    }

    /// @notice This function performs the mul async operation
    /// @dev It verifies that the value matches a valid ciphertext
    /// @param lhs The first input
    /// @param rhs The second input
    /// @return The result of the operation
    function mul(euint64 lhs, euint64 rhs) internal returns (euint64) {
        if (!Common.isInitialized(lhs)) {
            lhs = asEuint64(0);
        }
        if (!Common.isInitialized(rhs)) {
            rhs = asEuint64(0);
        }

        return
            euint64.wrap(
                Impl.mathOp(
                    Utils.EUINT64_TFHE,
                    euint64.unwrap(lhs),
                    euint64.unwrap(rhs),
                    FunctionId.mul
                )
            );
    }

    /// @notice This function performs the mul async operation
    /// @dev It verifies that the value matches a valid ciphertext
    /// @param lhs The first input
    /// @param rhs The second input
    /// @return The result of the operation
    function mul(euint128 lhs, euint128 rhs) internal returns (euint128) {
        if (!Common.isInitialized(lhs)) {
            lhs = asEuint128(0);
        }
        if (!Common.isInitialized(rhs)) {
            rhs = asEuint128(0);
        }

        return
            euint128.wrap(
                Impl.mathOp(
                    Utils.EUINT128_TFHE,
                    euint128.unwrap(lhs),
                    euint128.unwrap(rhs),
                    FunctionId.mul
                )
            );
    }

    /// @notice This function performs the mul async operation
    /// @dev It verifies that the value matches a valid ciphertext
    /// @param lhs The first input
    /// @param rhs The second input
    /// @return The result of the operation
    function mul(euint256 lhs, euint256 rhs) internal returns (euint256) {
        if (!Common.isInitialized(lhs)) {
            lhs = asEuint256(0);
        }
        if (!Common.isInitialized(rhs)) {
            rhs = asEuint256(0);
        }

        return
            euint256.wrap(
                Impl.mathOp(
                    Utils.EUINT256_TFHE,
                    euint256.unwrap(lhs),
                    euint256.unwrap(rhs),
                    FunctionId.mul
                )
            );
    }

    /// @notice This function performs the lt async operation
    /// @dev It verifies that the value matches a valid ciphertext
    /// @param lhs The first input
    /// @param rhs The second input
    /// @return The result of the operation
    function lt(euint8 lhs, euint8 rhs) internal returns (ebool) {
        if (!Common.isInitialized(lhs)) {
            lhs = asEuint8(0);
        }
        if (!Common.isInitialized(rhs)) {
            rhs = asEuint8(0);
        }

        return
            ebool.wrap(
                Impl.mathOp(
                    Utils.EUINT8_TFHE,
                    euint8.unwrap(lhs),
                    euint8.unwrap(rhs),
                    FunctionId.lt
                )
            );
    }

    /// @notice This function performs the lt async operation
    /// @dev It verifies that the value matches a valid ciphertext
    /// @param lhs The first input
    /// @param rhs The second input
    /// @return The result of the operation
    function lt(euint16 lhs, euint16 rhs) internal returns (ebool) {
        if (!Common.isInitialized(lhs)) {
            lhs = asEuint16(0);
        }
        if (!Common.isInitialized(rhs)) {
            rhs = asEuint16(0);
        }

        return
            ebool.wrap(
                Impl.mathOp(
                    Utils.EUINT16_TFHE,
                    euint16.unwrap(lhs),
                    euint16.unwrap(rhs),
                    FunctionId.lt
                )
            );
    }

    /// @notice This function performs the lt async operation
    /// @dev It verifies that the value matches a valid ciphertext
    /// @param lhs The first input
    /// @param rhs The second input
    /// @return The result of the operation
    function lt(euint32 lhs, euint32 rhs) internal returns (ebool) {
        if (!Common.isInitialized(lhs)) {
            lhs = asEuint32(0);
        }
        if (!Common.isInitialized(rhs)) {
            rhs = asEuint32(0);
        }

        return
            ebool.wrap(
                Impl.mathOp(
                    Utils.EUINT32_TFHE,
                    euint32.unwrap(lhs),
                    euint32.unwrap(rhs),
                    FunctionId.lt
                )
            );
    }

    /// @notice This function performs the lt async operation
    /// @dev It verifies that the value matches a valid ciphertext
    /// @param lhs The first input
    /// @param rhs The second input
    /// @return The result of the operation
    function lt(euint64 lhs, euint64 rhs) internal returns (ebool) {
        if (!Common.isInitialized(lhs)) {
            lhs = asEuint64(0);
        }
        if (!Common.isInitialized(rhs)) {
            rhs = asEuint64(0);
        }

        return
            ebool.wrap(
                Impl.mathOp(
                    Utils.EUINT64_TFHE,
                    euint64.unwrap(lhs),
                    euint64.unwrap(rhs),
                    FunctionId.lt
                )
            );
    }

    /// @notice This function performs the lt async operation
    /// @dev It verifies that the value matches a valid ciphertext
    /// @param lhs The first input
    /// @param rhs The second input
    /// @return The result of the operation
    function lt(euint128 lhs, euint128 rhs) internal returns (ebool) {
        if (!Common.isInitialized(lhs)) {
            lhs = asEuint128(0);
        }
        if (!Common.isInitialized(rhs)) {
            rhs = asEuint128(0);
        }

        return
            ebool.wrap(
                Impl.mathOp(
                    Utils.EUINT128_TFHE,
                    euint128.unwrap(lhs),
                    euint128.unwrap(rhs),
                    FunctionId.lt
                )
            );
    }

    /// @notice This function performs the lt async operation
    /// @dev It verifies that the value matches a valid ciphertext
    /// @param lhs The first input
    /// @param rhs The second input
    /// @return The result of the operation
    function lt(euint256 lhs, euint256 rhs) internal returns (ebool) {
        if (!Common.isInitialized(lhs)) {
            lhs = asEuint256(0);
        }
        if (!Common.isInitialized(rhs)) {
            rhs = asEuint256(0);
        }

        return
            ebool.wrap(
                Impl.mathOp(
                    Utils.EUINT256_TFHE,
                    euint256.unwrap(lhs),
                    euint256.unwrap(rhs),
                    FunctionId.lt
                )
            );
    }

    /// @notice This function performs the div async operation
    /// @dev It verifies that the value matches a valid ciphertext
    /// @param lhs The first input
    /// @param rhs The second input
    /// @return The result of the operation
    function div(euint8 lhs, euint8 rhs) internal returns (euint8) {
        if (!Common.isInitialized(lhs)) {
            lhs = asEuint8(0);
        }
        if (!Common.isInitialized(rhs)) {
            rhs = asEuint8(0);
        }

        return
            euint8.wrap(
                Impl.mathOp(
                    Utils.EUINT8_TFHE,
                    euint8.unwrap(lhs),
                    euint8.unwrap(rhs),
                    FunctionId.div
                )
            );
    }

    /// @notice This function performs the div async operation
    /// @dev It verifies that the value matches a valid ciphertext
    /// @param lhs The first input
    /// @param rhs The second input
    /// @return The result of the operation
    function div(euint16 lhs, euint16 rhs) internal returns (euint16) {
        if (!Common.isInitialized(lhs)) {
            lhs = asEuint16(0);
        }
        if (!Common.isInitialized(rhs)) {
            rhs = asEuint16(0);
        }

        return
            euint16.wrap(
                Impl.mathOp(
                    Utils.EUINT16_TFHE,
                    euint16.unwrap(lhs),
                    euint16.unwrap(rhs),
                    FunctionId.div
                )
            );
    }

    /// @notice This function performs the div async operation
    /// @dev It verifies that the value matches a valid ciphertext
    /// @param lhs The first input
    /// @param rhs The second input
    /// @return The result of the operation
    function div(euint32 lhs, euint32 rhs) internal returns (euint32) {
        if (!Common.isInitialized(lhs)) {
            lhs = asEuint32(0);
        }
        if (!Common.isInitialized(rhs)) {
            rhs = asEuint32(0);
        }

        return
            euint32.wrap(
                Impl.mathOp(
                    Utils.EUINT32_TFHE,
                    euint32.unwrap(lhs),
                    euint32.unwrap(rhs),
                    FunctionId.div
                )
            );
    }

    /// @notice This function performs the div async operation
    /// @dev It verifies that the value matches a valid ciphertext
    /// @param lhs The first input
    /// @param rhs The second input
    /// @return The result of the operation
    function div(euint64 lhs, euint64 rhs) internal returns (euint64) {
        if (!Common.isInitialized(lhs)) {
            lhs = asEuint64(0);
        }
        if (!Common.isInitialized(rhs)) {
            rhs = asEuint64(0);
        }

        return
            euint64.wrap(
                Impl.mathOp(
                    Utils.EUINT64_TFHE,
                    euint64.unwrap(lhs),
                    euint64.unwrap(rhs),
                    FunctionId.div
                )
            );
    }

    /// @notice This function performs the div async operation
    /// @dev It verifies that the value matches a valid ciphertext
    /// @param lhs The first input
    /// @param rhs The second input
    /// @return The result of the operation
    function div(euint128 lhs, euint128 rhs) internal returns (euint128) {
        if (!Common.isInitialized(lhs)) {
            lhs = asEuint128(0);
        }
        if (!Common.isInitialized(rhs)) {
            rhs = asEuint128(0);
        }

        return
            euint128.wrap(
                Impl.mathOp(
                    Utils.EUINT128_TFHE,
                    euint128.unwrap(lhs),
                    euint128.unwrap(rhs),
                    FunctionId.div
                )
            );
    }

    /// @notice This function performs the div async operation
    /// @dev It verifies that the value matches a valid ciphertext
    /// @param lhs The first input
    /// @param rhs The second input
    /// @return The result of the operation
    function div(euint256 lhs, euint256 rhs) internal returns (euint256) {
        if (!Common.isInitialized(lhs)) {
            lhs = asEuint256(0);
        }
        if (!Common.isInitialized(rhs)) {
            rhs = asEuint256(0);
        }

        return
            euint256.wrap(
                Impl.mathOp(
                    Utils.EUINT256_TFHE,
                    euint256.unwrap(lhs),
                    euint256.unwrap(rhs),
                    FunctionId.div
                )
            );
    }

    /// @notice This function performs the gt async operation
    /// @dev It verifies that the value matches a valid ciphertext
    /// @param lhs The first input
    /// @param rhs The second input
    /// @return The result of the operation
    function gt(euint8 lhs, euint8 rhs) internal returns (ebool) {
        if (!Common.isInitialized(lhs)) {
            lhs = asEuint8(0);
        }
        if (!Common.isInitialized(rhs)) {
            rhs = asEuint8(0);
        }

        return
            ebool.wrap(
                Impl.mathOp(
                    Utils.EUINT8_TFHE,
                    euint8.unwrap(lhs),
                    euint8.unwrap(rhs),
                    FunctionId.gt
                )
            );
    }

    /// @notice This function performs the gt async operation
    /// @dev It verifies that the value matches a valid ciphertext
    /// @param lhs The first input
    /// @param rhs The second input
    /// @return The result of the operation
    function gt(euint16 lhs, euint16 rhs) internal returns (ebool) {
        if (!Common.isInitialized(lhs)) {
            lhs = asEuint16(0);
        }
        if (!Common.isInitialized(rhs)) {
            rhs = asEuint16(0);
        }

        return
            ebool.wrap(
                Impl.mathOp(
                    Utils.EUINT16_TFHE,
                    euint16.unwrap(lhs),
                    euint16.unwrap(rhs),
                    FunctionId.gt
                )
            );
    }

    /// @notice This function performs the gt async operation
    /// @dev It verifies that the value matches a valid ciphertext
    /// @param lhs The first input
    /// @param rhs The second input
    /// @return The result of the operation
    function gt(euint32 lhs, euint32 rhs) internal returns (ebool) {
        if (!Common.isInitialized(lhs)) {
            lhs = asEuint32(0);
        }
        if (!Common.isInitialized(rhs)) {
            rhs = asEuint32(0);
        }

        return
            ebool.wrap(
                Impl.mathOp(
                    Utils.EUINT32_TFHE,
                    euint32.unwrap(lhs),
                    euint32.unwrap(rhs),
                    FunctionId.gt
                )
            );
    }

    /// @notice This function performs the gt async operation
    /// @dev It verifies that the value matches a valid ciphertext
    /// @param lhs The first input
    /// @param rhs The second input
    /// @return The result of the operation
    function gt(euint64 lhs, euint64 rhs) internal returns (ebool) {
        if (!Common.isInitialized(lhs)) {
            lhs = asEuint64(0);
        }
        if (!Common.isInitialized(rhs)) {
            rhs = asEuint64(0);
        }

        return
            ebool.wrap(
                Impl.mathOp(
                    Utils.EUINT64_TFHE,
                    euint64.unwrap(lhs),
                    euint64.unwrap(rhs),
                    FunctionId.gt
                )
            );
    }

    /// @notice This function performs the gt async operation
    /// @dev It verifies that the value matches a valid ciphertext
    /// @param lhs The first input
    /// @param rhs The second input
    /// @return The result of the operation
    function gt(euint128 lhs, euint128 rhs) internal returns (ebool) {
        if (!Common.isInitialized(lhs)) {
            lhs = asEuint128(0);
        }
        if (!Common.isInitialized(rhs)) {
            rhs = asEuint128(0);
        }

        return
            ebool.wrap(
                Impl.mathOp(
                    Utils.EUINT128_TFHE,
                    euint128.unwrap(lhs),
                    euint128.unwrap(rhs),
                    FunctionId.gt
                )
            );
    }

    /// @notice This function performs the gt async operation
    /// @dev It verifies that the value matches a valid ciphertext
    /// @param lhs The first input
    /// @param rhs The second input
    /// @return The result of the operation
    function gt(euint256 lhs, euint256 rhs) internal returns (ebool) {
        if (!Common.isInitialized(lhs)) {
            lhs = asEuint256(0);
        }
        if (!Common.isInitialized(rhs)) {
            rhs = asEuint256(0);
        }

        return
            ebool.wrap(
                Impl.mathOp(
                    Utils.EUINT256_TFHE,
                    euint256.unwrap(lhs),
                    euint256.unwrap(rhs),
                    FunctionId.gt
                )
            );
    }

    /// @notice This function performs the gte async operation
    /// @dev It verifies that the value matches a valid ciphertext
    /// @param lhs The first input
    /// @param rhs The second input
    /// @return The result of the operation
    function gte(euint8 lhs, euint8 rhs) internal returns (ebool) {
        if (!Common.isInitialized(lhs)) {
            lhs = asEuint8(0);
        }
        if (!Common.isInitialized(rhs)) {
            rhs = asEuint8(0);
        }

        return
            ebool.wrap(
                Impl.mathOp(
                    Utils.EUINT8_TFHE,
                    euint8.unwrap(lhs),
                    euint8.unwrap(rhs),
                    FunctionId.gte
                )
            );
    }

    /// @notice This function performs the gte async operation
    /// @dev It verifies that the value matches a valid ciphertext
    /// @param lhs The first input
    /// @param rhs The second input
    /// @return The result of the operation
    function gte(euint16 lhs, euint16 rhs) internal returns (ebool) {
        if (!Common.isInitialized(lhs)) {
            lhs = asEuint16(0);
        }
        if (!Common.isInitialized(rhs)) {
            rhs = asEuint16(0);
        }

        return
            ebool.wrap(
                Impl.mathOp(
                    Utils.EUINT16_TFHE,
                    euint16.unwrap(lhs),
                    euint16.unwrap(rhs),
                    FunctionId.gte
                )
            );
    }

    /// @notice This function performs the gte async operation
    /// @dev It verifies that the value matches a valid ciphertext
    /// @param lhs The first input
    /// @param rhs The second input
    /// @return The result of the operation
    function gte(euint32 lhs, euint32 rhs) internal returns (ebool) {
        if (!Common.isInitialized(lhs)) {
            lhs = asEuint32(0);
        }
        if (!Common.isInitialized(rhs)) {
            rhs = asEuint32(0);
        }

        return
            ebool.wrap(
                Impl.mathOp(
                    Utils.EUINT32_TFHE,
                    euint32.unwrap(lhs),
                    euint32.unwrap(rhs),
                    FunctionId.gte
                )
            );
    }

    /// @notice This function performs the gte async operation
    /// @dev It verifies that the value matches a valid ciphertext
    /// @param lhs The first input
    /// @param rhs The second input
    /// @return The result of the operation
    function gte(euint64 lhs, euint64 rhs) internal returns (ebool) {
        if (!Common.isInitialized(lhs)) {
            lhs = asEuint64(0);
        }
        if (!Common.isInitialized(rhs)) {
            rhs = asEuint64(0);
        }

        return
            ebool.wrap(
                Impl.mathOp(
                    Utils.EUINT64_TFHE,
                    euint64.unwrap(lhs),
                    euint64.unwrap(rhs),
                    FunctionId.gte
                )
            );
    }

    /// @notice This function performs the gte async operation
    /// @dev It verifies that the value matches a valid ciphertext
    /// @param lhs The first input
    /// @param rhs The second input
    /// @return The result of the operation
    function gte(euint128 lhs, euint128 rhs) internal returns (ebool) {
        if (!Common.isInitialized(lhs)) {
            lhs = asEuint128(0);
        }
        if (!Common.isInitialized(rhs)) {
            rhs = asEuint128(0);
        }

        return
            ebool.wrap(
                Impl.mathOp(
                    Utils.EUINT128_TFHE,
                    euint128.unwrap(lhs),
                    euint128.unwrap(rhs),
                    FunctionId.gte
                )
            );
    }

    /// @notice This function performs the gte async operation
    /// @dev It verifies that the value matches a valid ciphertext
    /// @param lhs The first input
    /// @param rhs The second input
    /// @return The result of the operation
    function gte(euint256 lhs, euint256 rhs) internal returns (ebool) {
        if (!Common.isInitialized(lhs)) {
            lhs = asEuint256(0);
        }
        if (!Common.isInitialized(rhs)) {
            rhs = asEuint256(0);
        }

        return
            ebool.wrap(
                Impl.mathOp(
                    Utils.EUINT256_TFHE,
                    euint256.unwrap(lhs),
                    euint256.unwrap(rhs),
                    FunctionId.gte
                )
            );
    }

    /// @notice This function performs the rem async operation
    /// @dev It verifies that the value matches a valid ciphertext
    /// @param lhs The first input
    /// @param rhs The second input
    /// @return The result of the operation
    function rem(euint8 lhs, euint8 rhs) internal returns (euint8) {
        if (!Common.isInitialized(lhs)) {
            lhs = asEuint8(0);
        }
        if (!Common.isInitialized(rhs)) {
            rhs = asEuint8(0);
        }

        return
            euint8.wrap(
                Impl.mathOp(
                    Utils.EUINT8_TFHE,
                    euint8.unwrap(lhs),
                    euint8.unwrap(rhs),
                    FunctionId.rem
                )
            );
    }

    /// @notice This function performs the rem async operation
    /// @dev It verifies that the value matches a valid ciphertext
    /// @param lhs The first input
    /// @param rhs The second input
    /// @return The result of the operation
    function rem(euint16 lhs, euint16 rhs) internal returns (euint16) {
        if (!Common.isInitialized(lhs)) {
            lhs = asEuint16(0);
        }
        if (!Common.isInitialized(rhs)) {
            rhs = asEuint16(0);
        }

        return
            euint16.wrap(
                Impl.mathOp(
                    Utils.EUINT16_TFHE,
                    euint16.unwrap(lhs),
                    euint16.unwrap(rhs),
                    FunctionId.rem
                )
            );
    }

    /// @notice This function performs the rem async operation
    /// @dev It verifies that the value matches a valid ciphertext
    /// @param lhs The first input
    /// @param rhs The second input
    /// @return The result of the operation
    function rem(euint32 lhs, euint32 rhs) internal returns (euint32) {
        if (!Common.isInitialized(lhs)) {
            lhs = asEuint32(0);
        }
        if (!Common.isInitialized(rhs)) {
            rhs = asEuint32(0);
        }

        return
            euint32.wrap(
                Impl.mathOp(
                    Utils.EUINT32_TFHE,
                    euint32.unwrap(lhs),
                    euint32.unwrap(rhs),
                    FunctionId.rem
                )
            );
    }

    /// @notice This function performs the rem async operation
    /// @dev It verifies that the value matches a valid ciphertext
    /// @param lhs The first input
    /// @param rhs The second input
    /// @return The result of the operation
    function rem(euint64 lhs, euint64 rhs) internal returns (euint64) {
        if (!Common.isInitialized(lhs)) {
            lhs = asEuint64(0);
        }
        if (!Common.isInitialized(rhs)) {
            rhs = asEuint64(0);
        }

        return
            euint64.wrap(
                Impl.mathOp(
                    Utils.EUINT64_TFHE,
                    euint64.unwrap(lhs),
                    euint64.unwrap(rhs),
                    FunctionId.rem
                )
            );
    }

    /// @notice This function performs the rem async operation
    /// @dev It verifies that the value matches a valid ciphertext
    /// @param lhs The first input
    /// @param rhs The second input
    /// @return The result of the operation
    function rem(euint128 lhs, euint128 rhs) internal returns (euint128) {
        if (!Common.isInitialized(lhs)) {
            lhs = asEuint128(0);
        }
        if (!Common.isInitialized(rhs)) {
            rhs = asEuint128(0);
        }

        return
            euint128.wrap(
                Impl.mathOp(
                    Utils.EUINT128_TFHE,
                    euint128.unwrap(lhs),
                    euint128.unwrap(rhs),
                    FunctionId.rem
                )
            );
    }

    /// @notice This function performs the rem async operation
    /// @dev It verifies that the value matches a valid ciphertext
    /// @param lhs The first input
    /// @param rhs The second input
    /// @return The result of the operation
    function rem(euint256 lhs, euint256 rhs) internal returns (euint256) {
        if (!Common.isInitialized(lhs)) {
            lhs = asEuint256(0);
        }
        if (!Common.isInitialized(rhs)) {
            rhs = asEuint256(0);
        }

        return
            euint256.wrap(
                Impl.mathOp(
                    Utils.EUINT256_TFHE,
                    euint256.unwrap(lhs),
                    euint256.unwrap(rhs),
                    FunctionId.rem
                )
            );
    }

    /// @notice This function performs the and async operation
    /// @dev It verifies that the value matches a valid ciphertext
    /// @param lhs The first input
    /// @param rhs The second input
    /// @return The result of the operation
    function and(ebool lhs, ebool rhs) internal returns (ebool) {
        if (!Common.isInitialized(lhs)) {
            lhs = asEbool(true);
        }
        if (!Common.isInitialized(rhs)) {
            rhs = asEbool(true);
        }

        return
            ebool.wrap(
                Impl.mathOp(
                    Utils.EBOOL_TFHE,
                    ebool.unwrap(lhs),
                    ebool.unwrap(rhs),
                    FunctionId.and
                )
            );
    }

    /// @notice This function performs the and async operation
    /// @dev It verifies that the value matches a valid ciphertext
    /// @param lhs The first input
    /// @param rhs The second input
    /// @return The result of the operation
    function and(euint8 lhs, euint8 rhs) internal returns (euint8) {
        if (!Common.isInitialized(lhs)) {
            lhs = asEuint8(0);
        }
        if (!Common.isInitialized(rhs)) {
            rhs = asEuint8(0);
        }

        return
            euint8.wrap(
                Impl.mathOp(
                    Utils.EUINT8_TFHE,
                    euint8.unwrap(lhs),
                    euint8.unwrap(rhs),
                    FunctionId.and
                )
            );
    }

    /// @notice This function performs the and async operation
    /// @dev It verifies that the value matches a valid ciphertext
    /// @param lhs The first input
    /// @param rhs The second input
    /// @return The result of the operation
    function and(euint16 lhs, euint16 rhs) internal returns (euint16) {
        if (!Common.isInitialized(lhs)) {
            lhs = asEuint16(0);
        }
        if (!Common.isInitialized(rhs)) {
            rhs = asEuint16(0);
        }

        return
            euint16.wrap(
                Impl.mathOp(
                    Utils.EUINT16_TFHE,
                    euint16.unwrap(lhs),
                    euint16.unwrap(rhs),
                    FunctionId.and
                )
            );
    }

    /// @notice This function performs the and async operation
    /// @dev It verifies that the value matches a valid ciphertext
    /// @param lhs The first input
    /// @param rhs The second input
    /// @return The result of the operation
    function and(euint32 lhs, euint32 rhs) internal returns (euint32) {
        if (!Common.isInitialized(lhs)) {
            lhs = asEuint32(0);
        }
        if (!Common.isInitialized(rhs)) {
            rhs = asEuint32(0);
        }

        return
            euint32.wrap(
                Impl.mathOp(
                    Utils.EUINT32_TFHE,
                    euint32.unwrap(lhs),
                    euint32.unwrap(rhs),
                    FunctionId.and
                )
            );
    }

    /// @notice This function performs the and async operation
    /// @dev It verifies that the value matches a valid ciphertext
    /// @param lhs The first input
    /// @param rhs The second input
    /// @return The result of the operation
    function and(euint64 lhs, euint64 rhs) internal returns (euint64) {
        if (!Common.isInitialized(lhs)) {
            lhs = asEuint64(0);
        }
        if (!Common.isInitialized(rhs)) {
            rhs = asEuint64(0);
        }

        return
            euint64.wrap(
                Impl.mathOp(
                    Utils.EUINT64_TFHE,
                    euint64.unwrap(lhs),
                    euint64.unwrap(rhs),
                    FunctionId.and
                )
            );
    }

    /// @notice This function performs the and async operation
    /// @dev It verifies that the value matches a valid ciphertext
    /// @param lhs The first input
    /// @param rhs The second input
    /// @return The result of the operation
    function and(euint128 lhs, euint128 rhs) internal returns (euint128) {
        if (!Common.isInitialized(lhs)) {
            lhs = asEuint128(0);
        }
        if (!Common.isInitialized(rhs)) {
            rhs = asEuint128(0);
        }

        return
            euint128.wrap(
                Impl.mathOp(
                    Utils.EUINT128_TFHE,
                    euint128.unwrap(lhs),
                    euint128.unwrap(rhs),
                    FunctionId.and
                )
            );
    }

    /// @notice This function performs the and async operation
    /// @dev It verifies that the value matches a valid ciphertext
    /// @param lhs The first input
    /// @param rhs The second input
    /// @return The result of the operation
    function and(euint256 lhs, euint256 rhs) internal returns (euint256) {
        if (!Common.isInitialized(lhs)) {
            lhs = asEuint256(0);
        }
        if (!Common.isInitialized(rhs)) {
            rhs = asEuint256(0);
        }

        return
            euint256.wrap(
                Impl.mathOp(
                    Utils.EUINT256_TFHE,
                    euint256.unwrap(lhs),
                    euint256.unwrap(rhs),
                    FunctionId.and
                )
            );
    }

    /// @notice This function performs the or async operation
    /// @dev It verifies that the value matches a valid ciphertext
    /// @param lhs The first input
    /// @param rhs The second input
    /// @return The result of the operation
    function or(ebool lhs, ebool rhs) internal returns (ebool) {
        if (!Common.isInitialized(lhs)) {
            lhs = asEbool(true);
        }
        if (!Common.isInitialized(rhs)) {
            rhs = asEbool(true);
        }

        return
            ebool.wrap(
                Impl.mathOp(
                    Utils.EBOOL_TFHE,
                    ebool.unwrap(lhs),
                    ebool.unwrap(rhs),
                    FunctionId.or
                )
            );
    }

    /// @notice This function performs the or async operation
    /// @dev It verifies that the value matches a valid ciphertext
    /// @param lhs The first input
    /// @param rhs The second input
    /// @return The result of the operation
    function or(euint8 lhs, euint8 rhs) internal returns (euint8) {
        if (!Common.isInitialized(lhs)) {
            lhs = asEuint8(0);
        }
        if (!Common.isInitialized(rhs)) {
            rhs = asEuint8(0);
        }

        return
            euint8.wrap(
                Impl.mathOp(
                    Utils.EUINT8_TFHE,
                    euint8.unwrap(lhs),
                    euint8.unwrap(rhs),
                    FunctionId.or
                )
            );
    }

    /// @notice This function performs the or async operation
    /// @dev It verifies that the value matches a valid ciphertext
    /// @param lhs The first input
    /// @param rhs The second input
    /// @return The result of the operation
    function or(euint16 lhs, euint16 rhs) internal returns (euint16) {
        if (!Common.isInitialized(lhs)) {
            lhs = asEuint16(0);
        }
        if (!Common.isInitialized(rhs)) {
            rhs = asEuint16(0);
        }

        return
            euint16.wrap(
                Impl.mathOp(
                    Utils.EUINT16_TFHE,
                    euint16.unwrap(lhs),
                    euint16.unwrap(rhs),
                    FunctionId.or
                )
            );
    }

    /// @notice This function performs the or async operation
    /// @dev It verifies that the value matches a valid ciphertext
    /// @param lhs The first input
    /// @param rhs The second input
    /// @return The result of the operation
    function or(euint32 lhs, euint32 rhs) internal returns (euint32) {
        if (!Common.isInitialized(lhs)) {
            lhs = asEuint32(0);
        }
        if (!Common.isInitialized(rhs)) {
            rhs = asEuint32(0);
        }

        return
            euint32.wrap(
                Impl.mathOp(
                    Utils.EUINT32_TFHE,
                    euint32.unwrap(lhs),
                    euint32.unwrap(rhs),
                    FunctionId.or
                )
            );
    }

    /// @notice This function performs the or async operation
    /// @dev It verifies that the value matches a valid ciphertext
    /// @param lhs The first input
    /// @param rhs The second input
    /// @return The result of the operation
    function or(euint64 lhs, euint64 rhs) internal returns (euint64) {
        if (!Common.isInitialized(lhs)) {
            lhs = asEuint64(0);
        }
        if (!Common.isInitialized(rhs)) {
            rhs = asEuint64(0);
        }

        return
            euint64.wrap(
                Impl.mathOp(
                    Utils.EUINT64_TFHE,
                    euint64.unwrap(lhs),
                    euint64.unwrap(rhs),
                    FunctionId.or
                )
            );
    }

    /// @notice This function performs the or async operation
    /// @dev It verifies that the value matches a valid ciphertext
    /// @param lhs The first input
    /// @param rhs The second input
    /// @return The result of the operation
    function or(euint128 lhs, euint128 rhs) internal returns (euint128) {
        if (!Common.isInitialized(lhs)) {
            lhs = asEuint128(0);
        }
        if (!Common.isInitialized(rhs)) {
            rhs = asEuint128(0);
        }

        return
            euint128.wrap(
                Impl.mathOp(
                    Utils.EUINT128_TFHE,
                    euint128.unwrap(lhs),
                    euint128.unwrap(rhs),
                    FunctionId.or
                )
            );
    }

    /// @notice This function performs the or async operation
    /// @dev It verifies that the value matches a valid ciphertext
    /// @param lhs The first input
    /// @param rhs The second input
    /// @return The result of the operation
    function or(euint256 lhs, euint256 rhs) internal returns (euint256) {
        if (!Common.isInitialized(lhs)) {
            lhs = asEuint256(0);
        }
        if (!Common.isInitialized(rhs)) {
            rhs = asEuint256(0);
        }

        return
            euint256.wrap(
                Impl.mathOp(
                    Utils.EUINT256_TFHE,
                    euint256.unwrap(lhs),
                    euint256.unwrap(rhs),
                    FunctionId.or
                )
            );
    }

    /// @notice This function performs the xor async operation
    /// @dev It verifies that the value matches a valid ciphertext
    /// @param lhs The first input
    /// @param rhs The second input
    /// @return The result of the operation
    function xor(ebool lhs, ebool rhs) internal returns (ebool) {
        if (!Common.isInitialized(lhs)) {
            lhs = asEbool(true);
        }
        if (!Common.isInitialized(rhs)) {
            rhs = asEbool(true);
        }

        return
            ebool.wrap(
                Impl.mathOp(
                    Utils.EBOOL_TFHE,
                    ebool.unwrap(lhs),
                    ebool.unwrap(rhs),
                    FunctionId.xor
                )
            );
    }

    /// @notice This function performs the xor async operation
    /// @dev It verifies that the value matches a valid ciphertext
    /// @param lhs The first input
    /// @param rhs The second input
    /// @return The result of the operation
    function xor(euint8 lhs, euint8 rhs) internal returns (euint8) {
        if (!Common.isInitialized(lhs)) {
            lhs = asEuint8(0);
        }
        if (!Common.isInitialized(rhs)) {
            rhs = asEuint8(0);
        }

        return
            euint8.wrap(
                Impl.mathOp(
                    Utils.EUINT8_TFHE,
                    euint8.unwrap(lhs),
                    euint8.unwrap(rhs),
                    FunctionId.xor
                )
            );
    }

    /// @notice This function performs the xor async operation
    /// @dev It verifies that the value matches a valid ciphertext
    /// @param lhs The first input
    /// @param rhs The second input
    /// @return The result of the operation
    function xor(euint16 lhs, euint16 rhs) internal returns (euint16) {
        if (!Common.isInitialized(lhs)) {
            lhs = asEuint16(0);
        }
        if (!Common.isInitialized(rhs)) {
            rhs = asEuint16(0);
        }

        return
            euint16.wrap(
                Impl.mathOp(
                    Utils.EUINT16_TFHE,
                    euint16.unwrap(lhs),
                    euint16.unwrap(rhs),
                    FunctionId.xor
                )
            );
    }

    /// @notice This function performs the xor async operation
    /// @dev It verifies that the value matches a valid ciphertext
    /// @param lhs The first input
    /// @param rhs The second input
    /// @return The result of the operation
    function xor(euint32 lhs, euint32 rhs) internal returns (euint32) {
        if (!Common.isInitialized(lhs)) {
            lhs = asEuint32(0);
        }
        if (!Common.isInitialized(rhs)) {
            rhs = asEuint32(0);
        }

        return
            euint32.wrap(
                Impl.mathOp(
                    Utils.EUINT32_TFHE,
                    euint32.unwrap(lhs),
                    euint32.unwrap(rhs),
                    FunctionId.xor
                )
            );
    }

    /// @notice This function performs the xor async operation
    /// @dev It verifies that the value matches a valid ciphertext
    /// @param lhs The first input
    /// @param rhs The second input
    /// @return The result of the operation
    function xor(euint64 lhs, euint64 rhs) internal returns (euint64) {
        if (!Common.isInitialized(lhs)) {
            lhs = asEuint64(0);
        }
        if (!Common.isInitialized(rhs)) {
            rhs = asEuint64(0);
        }

        return
            euint64.wrap(
                Impl.mathOp(
                    Utils.EUINT64_TFHE,
                    euint64.unwrap(lhs),
                    euint64.unwrap(rhs),
                    FunctionId.xor
                )
            );
    }

    /// @notice This function performs the xor async operation
    /// @dev It verifies that the value matches a valid ciphertext
    /// @param lhs The first input
    /// @param rhs The second input
    /// @return The result of the operation
    function xor(euint128 lhs, euint128 rhs) internal returns (euint128) {
        if (!Common.isInitialized(lhs)) {
            lhs = asEuint128(0);
        }
        if (!Common.isInitialized(rhs)) {
            rhs = asEuint128(0);
        }

        return
            euint128.wrap(
                Impl.mathOp(
                    Utils.EUINT128_TFHE,
                    euint128.unwrap(lhs),
                    euint128.unwrap(rhs),
                    FunctionId.xor
                )
            );
    }

    /// @notice This function performs the xor async operation
    /// @dev It verifies that the value matches a valid ciphertext
    /// @param lhs The first input
    /// @param rhs The second input
    /// @return The result of the operation
    function xor(euint256 lhs, euint256 rhs) internal returns (euint256) {
        if (!Common.isInitialized(lhs)) {
            lhs = asEuint256(0);
        }
        if (!Common.isInitialized(rhs)) {
            rhs = asEuint256(0);
        }

        return
            euint256.wrap(
                Impl.mathOp(
                    Utils.EUINT256_TFHE,
                    euint256.unwrap(lhs),
                    euint256.unwrap(rhs),
                    FunctionId.xor
                )
            );
    }

    /// @notice This function performs the eq async operation
    /// @dev It verifies that the value matches a valid ciphertext
    /// @param lhs The first input
    /// @param rhs The second input
    /// @return The result of the operation
    function eq(ebool lhs, ebool rhs) internal returns (ebool) {
        if (!Common.isInitialized(lhs)) {
            lhs = asEbool(true);
        }
        if (!Common.isInitialized(rhs)) {
            rhs = asEbool(true);
        }

        return
            ebool.wrap(
                Impl.mathOp(
                    Utils.EBOOL_TFHE,
                    ebool.unwrap(lhs),
                    ebool.unwrap(rhs),
                    FunctionId.eq
                )
            );
    }

    /// @notice This function performs the eq async operation
    /// @dev It verifies that the value matches a valid ciphertext
    /// @param lhs The first input
    /// @param rhs The second input
    /// @return The result of the operation
    function eq(euint8 lhs, euint8 rhs) internal returns (ebool) {
        if (!Common.isInitialized(lhs)) {
            lhs = asEuint8(0);
        }
        if (!Common.isInitialized(rhs)) {
            rhs = asEuint8(0);
        }

        return
            ebool.wrap(
                Impl.mathOp(
                    Utils.EUINT8_TFHE,
                    euint8.unwrap(lhs),
                    euint8.unwrap(rhs),
                    FunctionId.eq
                )
            );
    }

    /// @notice This function performs the eq async operation
    /// @dev It verifies that the value matches a valid ciphertext
    /// @param lhs The first input
    /// @param rhs The second input
    /// @return The result of the operation
    function eq(euint16 lhs, euint16 rhs) internal returns (ebool) {
        if (!Common.isInitialized(lhs)) {
            lhs = asEuint16(0);
        }
        if (!Common.isInitialized(rhs)) {
            rhs = asEuint16(0);
        }

        return
            ebool.wrap(
                Impl.mathOp(
                    Utils.EUINT16_TFHE,
                    euint16.unwrap(lhs),
                    euint16.unwrap(rhs),
                    FunctionId.eq
                )
            );
    }

    /// @notice This function performs the eq async operation
    /// @dev It verifies that the value matches a valid ciphertext
    /// @param lhs The first input
    /// @param rhs The second input
    /// @return The result of the operation
    function eq(euint32 lhs, euint32 rhs) internal returns (ebool) {
        if (!Common.isInitialized(lhs)) {
            lhs = asEuint32(0);
        }
        if (!Common.isInitialized(rhs)) {
            rhs = asEuint32(0);
        }

        return
            ebool.wrap(
                Impl.mathOp(
                    Utils.EUINT32_TFHE,
                    euint32.unwrap(lhs),
                    euint32.unwrap(rhs),
                    FunctionId.eq
                )
            );
    }

    /// @notice This function performs the eq async operation
    /// @dev It verifies that the value matches a valid ciphertext
    /// @param lhs The first input
    /// @param rhs The second input
    /// @return The result of the operation
    function eq(euint64 lhs, euint64 rhs) internal returns (ebool) {
        if (!Common.isInitialized(lhs)) {
            lhs = asEuint64(0);
        }
        if (!Common.isInitialized(rhs)) {
            rhs = asEuint64(0);
        }

        return
            ebool.wrap(
                Impl.mathOp(
                    Utils.EUINT64_TFHE,
                    euint64.unwrap(lhs),
                    euint64.unwrap(rhs),
                    FunctionId.eq
                )
            );
    }

    /// @notice This function performs the eq async operation
    /// @dev It verifies that the value matches a valid ciphertext
    /// @param lhs The first input
    /// @param rhs The second input
    /// @return The result of the operation
    function eq(euint128 lhs, euint128 rhs) internal returns (ebool) {
        if (!Common.isInitialized(lhs)) {
            lhs = asEuint128(0);
        }
        if (!Common.isInitialized(rhs)) {
            rhs = asEuint128(0);
        }

        return
            ebool.wrap(
                Impl.mathOp(
                    Utils.EUINT128_TFHE,
                    euint128.unwrap(lhs),
                    euint128.unwrap(rhs),
                    FunctionId.eq
                )
            );
    }

    /// @notice This function performs the eq async operation
    /// @dev It verifies that the value matches a valid ciphertext
    /// @param lhs The first input
    /// @param rhs The second input
    /// @return The result of the operation
    function eq(euint256 lhs, euint256 rhs) internal returns (ebool) {
        if (!Common.isInitialized(lhs)) {
            lhs = asEuint256(0);
        }
        if (!Common.isInitialized(rhs)) {
            rhs = asEuint256(0);
        }

        return
            ebool.wrap(
                Impl.mathOp(
                    Utils.EUINT256_TFHE,
                    euint256.unwrap(lhs),
                    euint256.unwrap(rhs),
                    FunctionId.eq
                )
            );
    }

    /// @notice This function performs the eq async operation
    /// @dev It verifies that the value matches a valid ciphertext
    /// @param lhs The first input
    /// @param rhs The second input
    /// @return The result of the operation
    function eq(eaddress lhs, eaddress rhs) internal returns (ebool) {
        if (!Common.isInitialized(lhs)) {
            lhs = asEaddress(address(0));
        }
        if (!Common.isInitialized(rhs)) {
            rhs = asEaddress(address(0));
        }

        return
            ebool.wrap(
                Impl.mathOp(
                    Utils.EADDRESS_TFHE,
                    eaddress.unwrap(lhs),
                    eaddress.unwrap(rhs),
                    FunctionId.eq
                )
            );
    }

    /// @notice This function performs the ne async operation
    /// @dev It verifies that the value matches a valid ciphertext
    /// @param lhs The first input
    /// @param rhs The second input
    /// @return The result of the operation
    function ne(ebool lhs, ebool rhs) internal returns (ebool) {
        if (!Common.isInitialized(lhs)) {
            lhs = asEbool(true);
        }
        if (!Common.isInitialized(rhs)) {
            rhs = asEbool(true);
        }

        return
            ebool.wrap(
                Impl.mathOp(
                    Utils.EBOOL_TFHE,
                    ebool.unwrap(lhs),
                    ebool.unwrap(rhs),
                    FunctionId.ne
                )
            );
    }

    /// @notice This function performs the ne async operation
    /// @dev It verifies that the value matches a valid ciphertext
    /// @param lhs The first input
    /// @param rhs The second input
    /// @return The result of the operation
    function ne(euint8 lhs, euint8 rhs) internal returns (ebool) {
        if (!Common.isInitialized(lhs)) {
            lhs = asEuint8(0);
        }
        if (!Common.isInitialized(rhs)) {
            rhs = asEuint8(0);
        }

        return
            ebool.wrap(
                Impl.mathOp(
                    Utils.EUINT8_TFHE,
                    euint8.unwrap(lhs),
                    euint8.unwrap(rhs),
                    FunctionId.ne
                )
            );
    }

    /// @notice This function performs the ne async operation
    /// @dev It verifies that the value matches a valid ciphertext
    /// @param lhs The first input
    /// @param rhs The second input
    /// @return The result of the operation
    function ne(euint16 lhs, euint16 rhs) internal returns (ebool) {
        if (!Common.isInitialized(lhs)) {
            lhs = asEuint16(0);
        }
        if (!Common.isInitialized(rhs)) {
            rhs = asEuint16(0);
        }

        return
            ebool.wrap(
                Impl.mathOp(
                    Utils.EUINT16_TFHE,
                    euint16.unwrap(lhs),
                    euint16.unwrap(rhs),
                    FunctionId.ne
                )
            );
    }

    /// @notice This function performs the ne async operation
    /// @dev It verifies that the value matches a valid ciphertext
    /// @param lhs The first input
    /// @param rhs The second input
    /// @return The result of the operation
    function ne(euint32 lhs, euint32 rhs) internal returns (ebool) {
        if (!Common.isInitialized(lhs)) {
            lhs = asEuint32(0);
        }
        if (!Common.isInitialized(rhs)) {
            rhs = asEuint32(0);
        }

        return
            ebool.wrap(
                Impl.mathOp(
                    Utils.EUINT32_TFHE,
                    euint32.unwrap(lhs),
                    euint32.unwrap(rhs),
                    FunctionId.ne
                )
            );
    }

    /// @notice This function performs the ne async operation
    /// @dev It verifies that the value matches a valid ciphertext
    /// @param lhs The first input
    /// @param rhs The second input
    /// @return The result of the operation
    function ne(euint64 lhs, euint64 rhs) internal returns (ebool) {
        if (!Common.isInitialized(lhs)) {
            lhs = asEuint64(0);
        }
        if (!Common.isInitialized(rhs)) {
            rhs = asEuint64(0);
        }

        return
            ebool.wrap(
                Impl.mathOp(
                    Utils.EUINT64_TFHE,
                    euint64.unwrap(lhs),
                    euint64.unwrap(rhs),
                    FunctionId.ne
                )
            );
    }

    /// @notice This function performs the ne async operation
    /// @dev It verifies that the value matches a valid ciphertext
    /// @param lhs The first input
    /// @param rhs The second input
    /// @return The result of the operation
    function ne(euint128 lhs, euint128 rhs) internal returns (ebool) {
        if (!Common.isInitialized(lhs)) {
            lhs = asEuint128(0);
        }
        if (!Common.isInitialized(rhs)) {
            rhs = asEuint128(0);
        }

        return
            ebool.wrap(
                Impl.mathOp(
                    Utils.EUINT128_TFHE,
                    euint128.unwrap(lhs),
                    euint128.unwrap(rhs),
                    FunctionId.ne
                )
            );
    }

    /// @notice This function performs the ne async operation
    /// @dev It verifies that the value matches a valid ciphertext
    /// @param lhs The first input
    /// @param rhs The second input
    /// @return The result of the operation
    function ne(euint256 lhs, euint256 rhs) internal returns (ebool) {
        if (!Common.isInitialized(lhs)) {
            lhs = asEuint256(0);
        }
        if (!Common.isInitialized(rhs)) {
            rhs = asEuint256(0);
        }

        return
            ebool.wrap(
                Impl.mathOp(
                    Utils.EUINT256_TFHE,
                    euint256.unwrap(lhs),
                    euint256.unwrap(rhs),
                    FunctionId.ne
                )
            );
    }

    /// @notice This function performs the ne async operation
    /// @dev It verifies that the value matches a valid ciphertext
    /// @param lhs The first input
    /// @param rhs The second input
    /// @return The result of the operation
    function ne(eaddress lhs, eaddress rhs) internal returns (ebool) {
        if (!Common.isInitialized(lhs)) {
            lhs = asEaddress(address(0));
        }
        if (!Common.isInitialized(rhs)) {
            rhs = asEaddress(address(0));
        }

        return
            ebool.wrap(
                Impl.mathOp(
                    Utils.EADDRESS_TFHE,
                    eaddress.unwrap(lhs),
                    eaddress.unwrap(rhs),
                    FunctionId.ne
                )
            );
    }

    /// @notice This function performs the min async operation
    /// @dev It verifies that the value matches a valid ciphertext
    /// @param lhs The first input
    /// @param rhs The second input
    /// @return The result of the operation
    function min(euint8 lhs, euint8 rhs) internal returns (euint8) {
        if (!Common.isInitialized(lhs)) {
            lhs = asEuint8(0);
        }
        if (!Common.isInitialized(rhs)) {
            rhs = asEuint8(0);
        }

        return
            euint8.wrap(
                Impl.mathOp(
                    Utils.EUINT8_TFHE,
                    euint8.unwrap(lhs),
                    euint8.unwrap(rhs),
                    FunctionId.min
                )
            );
    }

    /// @notice This function performs the min async operation
    /// @dev It verifies that the value matches a valid ciphertext
    /// @param lhs The first input
    /// @param rhs The second input
    /// @return The result of the operation
    function min(euint16 lhs, euint16 rhs) internal returns (euint16) {
        if (!Common.isInitialized(lhs)) {
            lhs = asEuint16(0);
        }
        if (!Common.isInitialized(rhs)) {
            rhs = asEuint16(0);
        }

        return
            euint16.wrap(
                Impl.mathOp(
                    Utils.EUINT16_TFHE,
                    euint16.unwrap(lhs),
                    euint16.unwrap(rhs),
                    FunctionId.min
                )
            );
    }

    /// @notice This function performs the min async operation
    /// @dev It verifies that the value matches a valid ciphertext
    /// @param lhs The first input
    /// @param rhs The second input
    /// @return The result of the operation
    function min(euint32 lhs, euint32 rhs) internal returns (euint32) {
        if (!Common.isInitialized(lhs)) {
            lhs = asEuint32(0);
        }
        if (!Common.isInitialized(rhs)) {
            rhs = asEuint32(0);
        }

        return
            euint32.wrap(
                Impl.mathOp(
                    Utils.EUINT32_TFHE,
                    euint32.unwrap(lhs),
                    euint32.unwrap(rhs),
                    FunctionId.min
                )
            );
    }

    /// @notice This function performs the min async operation
    /// @dev It verifies that the value matches a valid ciphertext
    /// @param lhs The first input
    /// @param rhs The second input
    /// @return The result of the operation
    function min(euint64 lhs, euint64 rhs) internal returns (euint64) {
        if (!Common.isInitialized(lhs)) {
            lhs = asEuint64(0);
        }
        if (!Common.isInitialized(rhs)) {
            rhs = asEuint64(0);
        }

        return
            euint64.wrap(
                Impl.mathOp(
                    Utils.EUINT64_TFHE,
                    euint64.unwrap(lhs),
                    euint64.unwrap(rhs),
                    FunctionId.min
                )
            );
    }

    /// @notice This function performs the min async operation
    /// @dev It verifies that the value matches a valid ciphertext
    /// @param lhs The first input
    /// @param rhs The second input
    /// @return The result of the operation
    function min(euint128 lhs, euint128 rhs) internal returns (euint128) {
        if (!Common.isInitialized(lhs)) {
            lhs = asEuint128(0);
        }
        if (!Common.isInitialized(rhs)) {
            rhs = asEuint128(0);
        }

        return
            euint128.wrap(
                Impl.mathOp(
                    Utils.EUINT128_TFHE,
                    euint128.unwrap(lhs),
                    euint128.unwrap(rhs),
                    FunctionId.min
                )
            );
    }

    /// @notice This function performs the min async operation
    /// @dev It verifies that the value matches a valid ciphertext
    /// @param lhs The first input
    /// @param rhs The second input
    /// @return The result of the operation
    function min(euint256 lhs, euint256 rhs) internal returns (euint256) {
        if (!Common.isInitialized(lhs)) {
            lhs = asEuint256(0);
        }
        if (!Common.isInitialized(rhs)) {
            rhs = asEuint256(0);
        }

        return
            euint256.wrap(
                Impl.mathOp(
                    Utils.EUINT256_TFHE,
                    euint256.unwrap(lhs),
                    euint256.unwrap(rhs),
                    FunctionId.min
                )
            );
    }

    /// @notice This function performs the max async operation
    /// @dev It verifies that the value matches a valid ciphertext
    /// @param lhs The first input
    /// @param rhs The second input
    /// @return The result of the operation
    function max(euint8 lhs, euint8 rhs) internal returns (euint8) {
        if (!Common.isInitialized(lhs)) {
            lhs = asEuint8(0);
        }
        if (!Common.isInitialized(rhs)) {
            rhs = asEuint8(0);
        }

        return
            euint8.wrap(
                Impl.mathOp(
                    Utils.EUINT8_TFHE,
                    euint8.unwrap(lhs),
                    euint8.unwrap(rhs),
                    FunctionId.max
                )
            );
    }

    /// @notice This function performs the max async operation
    /// @dev It verifies that the value matches a valid ciphertext
    /// @param lhs The first input
    /// @param rhs The second input
    /// @return The result of the operation
    function max(euint16 lhs, euint16 rhs) internal returns (euint16) {
        if (!Common.isInitialized(lhs)) {
            lhs = asEuint16(0);
        }
        if (!Common.isInitialized(rhs)) {
            rhs = asEuint16(0);
        }

        return
            euint16.wrap(
                Impl.mathOp(
                    Utils.EUINT16_TFHE,
                    euint16.unwrap(lhs),
                    euint16.unwrap(rhs),
                    FunctionId.max
                )
            );
    }

    /// @notice This function performs the max async operation
    /// @dev It verifies that the value matches a valid ciphertext
    /// @param lhs The first input
    /// @param rhs The second input
    /// @return The result of the operation
    function max(euint32 lhs, euint32 rhs) internal returns (euint32) {
        if (!Common.isInitialized(lhs)) {
            lhs = asEuint32(0);
        }
        if (!Common.isInitialized(rhs)) {
            rhs = asEuint32(0);
        }

        return
            euint32.wrap(
                Impl.mathOp(
                    Utils.EUINT32_TFHE,
                    euint32.unwrap(lhs),
                    euint32.unwrap(rhs),
                    FunctionId.max
                )
            );
    }

    /// @notice This function performs the max async operation
    /// @dev It verifies that the value matches a valid ciphertext
    /// @param lhs The first input
    /// @param rhs The second input
    /// @return The result of the operation
    function max(euint64 lhs, euint64 rhs) internal returns (euint64) {
        if (!Common.isInitialized(lhs)) {
            lhs = asEuint64(0);
        }
        if (!Common.isInitialized(rhs)) {
            rhs = asEuint64(0);
        }

        return
            euint64.wrap(
                Impl.mathOp(
                    Utils.EUINT64_TFHE,
                    euint64.unwrap(lhs),
                    euint64.unwrap(rhs),
                    FunctionId.max
                )
            );
    }

    /// @notice This function performs the max async operation
    /// @dev It verifies that the value matches a valid ciphertext
    /// @param lhs The first input
    /// @param rhs The second input
    /// @return The result of the operation
    function max(euint128 lhs, euint128 rhs) internal returns (euint128) {
        if (!Common.isInitialized(lhs)) {
            lhs = asEuint128(0);
        }
        if (!Common.isInitialized(rhs)) {
            rhs = asEuint128(0);
        }

        return
            euint128.wrap(
                Impl.mathOp(
                    Utils.EUINT128_TFHE,
                    euint128.unwrap(lhs),
                    euint128.unwrap(rhs),
                    FunctionId.max
                )
            );
    }

    /// @notice This function performs the max async operation
    /// @dev It verifies that the value matches a valid ciphertext
    /// @param lhs The first input
    /// @param rhs The second input
    /// @return The result of the operation
    function max(euint256 lhs, euint256 rhs) internal returns (euint256) {
        if (!Common.isInitialized(lhs)) {
            lhs = asEuint256(0);
        }
        if (!Common.isInitialized(rhs)) {
            rhs = asEuint256(0);
        }

        return
            euint256.wrap(
                Impl.mathOp(
                    Utils.EUINT256_TFHE,
                    euint256.unwrap(lhs),
                    euint256.unwrap(rhs),
                    FunctionId.max
                )
            );
    }

    /// @notice This function performs the shl async operation
    /// @dev It verifies that the value matches a valid ciphertext
    /// @param lhs The first input
    /// @param rhs The second input
    /// @return The result of the operation
    function shl(euint8 lhs, euint8 rhs) internal returns (euint8) {
        if (!Common.isInitialized(lhs)) {
            lhs = asEuint8(0);
        }
        if (!Common.isInitialized(rhs)) {
            rhs = asEuint8(0);
        }

        return
            euint8.wrap(
                Impl.mathOp(
                    Utils.EUINT8_TFHE,
                    euint8.unwrap(lhs),
                    euint8.unwrap(rhs),
                    FunctionId.shl
                )
            );
    }

    /// @notice This function performs the shl async operation
    /// @dev It verifies that the value matches a valid ciphertext
    /// @param lhs The first input
    /// @param rhs The second input
    /// @return The result of the operation
    function shl(euint16 lhs, euint16 rhs) internal returns (euint16) {
        if (!Common.isInitialized(lhs)) {
            lhs = asEuint16(0);
        }
        if (!Common.isInitialized(rhs)) {
            rhs = asEuint16(0);
        }

        return
            euint16.wrap(
                Impl.mathOp(
                    Utils.EUINT16_TFHE,
                    euint16.unwrap(lhs),
                    euint16.unwrap(rhs),
                    FunctionId.shl
                )
            );
    }

    /// @notice This function performs the shl async operation
    /// @dev It verifies that the value matches a valid ciphertext
    /// @param lhs The first input
    /// @param rhs The second input
    /// @return The result of the operation
    function shl(euint32 lhs, euint32 rhs) internal returns (euint32) {
        if (!Common.isInitialized(lhs)) {
            lhs = asEuint32(0);
        }
        if (!Common.isInitialized(rhs)) {
            rhs = asEuint32(0);
        }

        return
            euint32.wrap(
                Impl.mathOp(
                    Utils.EUINT32_TFHE,
                    euint32.unwrap(lhs),
                    euint32.unwrap(rhs),
                    FunctionId.shl
                )
            );
    }

    /// @notice This function performs the shl async operation
    /// @dev It verifies that the value matches a valid ciphertext
    /// @param lhs The first input
    /// @param rhs The second input
    /// @return The result of the operation
    function shl(euint64 lhs, euint64 rhs) internal returns (euint64) {
        if (!Common.isInitialized(lhs)) {
            lhs = asEuint64(0);
        }
        if (!Common.isInitialized(rhs)) {
            rhs = asEuint64(0);
        }

        return
            euint64.wrap(
                Impl.mathOp(
                    Utils.EUINT64_TFHE,
                    euint64.unwrap(lhs),
                    euint64.unwrap(rhs),
                    FunctionId.shl
                )
            );
    }

    /// @notice This function performs the shl async operation
    /// @dev It verifies that the value matches a valid ciphertext
    /// @param lhs The first input
    /// @param rhs The second input
    /// @return The result of the operation
    function shl(euint128 lhs, euint128 rhs) internal returns (euint128) {
        if (!Common.isInitialized(lhs)) {
            lhs = asEuint128(0);
        }
        if (!Common.isInitialized(rhs)) {
            rhs = asEuint128(0);
        }

        return
            euint128.wrap(
                Impl.mathOp(
                    Utils.EUINT128_TFHE,
                    euint128.unwrap(lhs),
                    euint128.unwrap(rhs),
                    FunctionId.shl
                )
            );
    }

    /// @notice This function performs the shl async operation
    /// @dev It verifies that the value matches a valid ciphertext
    /// @param lhs The first input
    /// @param rhs The second input
    /// @return The result of the operation
    function shl(euint256 lhs, euint256 rhs) internal returns (euint256) {
        if (!Common.isInitialized(lhs)) {
            lhs = asEuint256(0);
        }
        if (!Common.isInitialized(rhs)) {
            rhs = asEuint256(0);
        }

        return
            euint256.wrap(
                Impl.mathOp(
                    Utils.EUINT256_TFHE,
                    euint256.unwrap(lhs),
                    euint256.unwrap(rhs),
                    FunctionId.shl
                )
            );
    }

    /// @notice This function performs the shr async operation
    /// @dev It verifies that the value matches a valid ciphertext
    /// @param lhs The first input
    /// @param rhs The second input
    /// @return The result of the operation
    function shr(euint8 lhs, euint8 rhs) internal returns (euint8) {
        if (!Common.isInitialized(lhs)) {
            lhs = asEuint8(0);
        }
        if (!Common.isInitialized(rhs)) {
            rhs = asEuint8(0);
        }

        return
            euint8.wrap(
                Impl.mathOp(
                    Utils.EUINT8_TFHE,
                    euint8.unwrap(lhs),
                    euint8.unwrap(rhs),
                    FunctionId.shr
                )
            );
    }

    /// @notice This function performs the shr async operation
    /// @dev It verifies that the value matches a valid ciphertext
    /// @param lhs The first input
    /// @param rhs The second input
    /// @return The result of the operation
    function shr(euint16 lhs, euint16 rhs) internal returns (euint16) {
        if (!Common.isInitialized(lhs)) {
            lhs = asEuint16(0);
        }
        if (!Common.isInitialized(rhs)) {
            rhs = asEuint16(0);
        }

        return
            euint16.wrap(
                Impl.mathOp(
                    Utils.EUINT16_TFHE,
                    euint16.unwrap(lhs),
                    euint16.unwrap(rhs),
                    FunctionId.shr
                )
            );
    }

    /// @notice This function performs the shr async operation
    /// @dev It verifies that the value matches a valid ciphertext
    /// @param lhs The first input
    /// @param rhs The second input
    /// @return The result of the operation
    function shr(euint32 lhs, euint32 rhs) internal returns (euint32) {
        if (!Common.isInitialized(lhs)) {
            lhs = asEuint32(0);
        }
        if (!Common.isInitialized(rhs)) {
            rhs = asEuint32(0);
        }

        return
            euint32.wrap(
                Impl.mathOp(
                    Utils.EUINT32_TFHE,
                    euint32.unwrap(lhs),
                    euint32.unwrap(rhs),
                    FunctionId.shr
                )
            );
    }

    /// @notice This function performs the shr async operation
    /// @dev It verifies that the value matches a valid ciphertext
    /// @param lhs The first input
    /// @param rhs The second input
    /// @return The result of the operation
    function shr(euint64 lhs, euint64 rhs) internal returns (euint64) {
        if (!Common.isInitialized(lhs)) {
            lhs = asEuint64(0);
        }
        if (!Common.isInitialized(rhs)) {
            rhs = asEuint64(0);
        }

        return
            euint64.wrap(
                Impl.mathOp(
                    Utils.EUINT64_TFHE,
                    euint64.unwrap(lhs),
                    euint64.unwrap(rhs),
                    FunctionId.shr
                )
            );
    }

    /// @notice This function performs the shr async operation
    /// @dev It verifies that the value matches a valid ciphertext
    /// @param lhs The first input
    /// @param rhs The second input
    /// @return The result of the operation
    function shr(euint128 lhs, euint128 rhs) internal returns (euint128) {
        if (!Common.isInitialized(lhs)) {
            lhs = asEuint128(0);
        }
        if (!Common.isInitialized(rhs)) {
            rhs = asEuint128(0);
        }

        return
            euint128.wrap(
                Impl.mathOp(
                    Utils.EUINT128_TFHE,
                    euint128.unwrap(lhs),
                    euint128.unwrap(rhs),
                    FunctionId.shr
                )
            );
    }

    /// @notice This function performs the shr async operation
    /// @dev It verifies that the value matches a valid ciphertext
    /// @param lhs The first input
    /// @param rhs The second input
    /// @return The result of the operation
    function shr(euint256 lhs, euint256 rhs) internal returns (euint256) {
        if (!Common.isInitialized(lhs)) {
            lhs = asEuint256(0);
        }
        if (!Common.isInitialized(rhs)) {
            rhs = asEuint256(0);
        }

        return
            euint256.wrap(
                Impl.mathOp(
                    Utils.EUINT256_TFHE,
                    euint256.unwrap(lhs),
                    euint256.unwrap(rhs),
                    FunctionId.shr
                )
            );
    }

    /// @notice This function performs the rol async operation
    /// @dev It verifies that the value matches a valid ciphertext
    /// @param lhs The first input
    /// @param rhs The second input
    /// @return The result of the operation
    function rol(euint8 lhs, euint8 rhs) internal returns (euint8) {
        if (!Common.isInitialized(lhs)) {
            lhs = asEuint8(0);
        }
        if (!Common.isInitialized(rhs)) {
            rhs = asEuint8(0);
        }

        return
            euint8.wrap(
                Impl.mathOp(
                    Utils.EUINT8_TFHE,
                    euint8.unwrap(lhs),
                    euint8.unwrap(rhs),
                    FunctionId.rol
                )
            );
    }

    /// @notice This function performs the rol async operation
    /// @dev It verifies that the value matches a valid ciphertext
    /// @param lhs The first input
    /// @param rhs The second input
    /// @return The result of the operation
    function rol(euint16 lhs, euint16 rhs) internal returns (euint16) {
        if (!Common.isInitialized(lhs)) {
            lhs = asEuint16(0);
        }
        if (!Common.isInitialized(rhs)) {
            rhs = asEuint16(0);
        }

        return
            euint16.wrap(
                Impl.mathOp(
                    Utils.EUINT16_TFHE,
                    euint16.unwrap(lhs),
                    euint16.unwrap(rhs),
                    FunctionId.rol
                )
            );
    }

    /// @notice This function performs the rol async operation
    /// @dev It verifies that the value matches a valid ciphertext
    /// @param lhs The first input
    /// @param rhs The second input
    /// @return The result of the operation
    function rol(euint32 lhs, euint32 rhs) internal returns (euint32) {
        if (!Common.isInitialized(lhs)) {
            lhs = asEuint32(0);
        }
        if (!Common.isInitialized(rhs)) {
            rhs = asEuint32(0);
        }

        return
            euint32.wrap(
                Impl.mathOp(
                    Utils.EUINT32_TFHE,
                    euint32.unwrap(lhs),
                    euint32.unwrap(rhs),
                    FunctionId.rol
                )
            );
    }

    /// @notice This function performs the rol async operation
    /// @dev It verifies that the value matches a valid ciphertext
    /// @param lhs The first input
    /// @param rhs The second input
    /// @return The result of the operation
    function rol(euint64 lhs, euint64 rhs) internal returns (euint64) {
        if (!Common.isInitialized(lhs)) {
            lhs = asEuint64(0);
        }
        if (!Common.isInitialized(rhs)) {
            rhs = asEuint64(0);
        }

        return
            euint64.wrap(
                Impl.mathOp(
                    Utils.EUINT64_TFHE,
                    euint64.unwrap(lhs),
                    euint64.unwrap(rhs),
                    FunctionId.rol
                )
            );
    }

    /// @notice This function performs the rol async operation
    /// @dev It verifies that the value matches a valid ciphertext
    /// @param lhs The first input
    /// @param rhs The second input
    /// @return The result of the operation
    function rol(euint128 lhs, euint128 rhs) internal returns (euint128) {
        if (!Common.isInitialized(lhs)) {
            lhs = asEuint128(0);
        }
        if (!Common.isInitialized(rhs)) {
            rhs = asEuint128(0);
        }

        return
            euint128.wrap(
                Impl.mathOp(
                    Utils.EUINT128_TFHE,
                    euint128.unwrap(lhs),
                    euint128.unwrap(rhs),
                    FunctionId.rol
                )
            );
    }

    /// @notice This function performs the rol async operation
    /// @dev It verifies that the value matches a valid ciphertext
    /// @param lhs The first input
    /// @param rhs The second input
    /// @return The result of the operation
    function rol(euint256 lhs, euint256 rhs) internal returns (euint256) {
        if (!Common.isInitialized(lhs)) {
            lhs = asEuint256(0);
        }
        if (!Common.isInitialized(rhs)) {
            rhs = asEuint256(0);
        }

        return
            euint256.wrap(
                Impl.mathOp(
                    Utils.EUINT256_TFHE,
                    euint256.unwrap(lhs),
                    euint256.unwrap(rhs),
                    FunctionId.rol
                )
            );
    }

    /// @notice This function performs the ror async operation
    /// @dev It verifies that the value matches a valid ciphertext
    /// @param lhs The first input
    /// @param rhs The second input
    /// @return The result of the operation
    function ror(euint8 lhs, euint8 rhs) internal returns (euint8) {
        if (!Common.isInitialized(lhs)) {
            lhs = asEuint8(0);
        }
        if (!Common.isInitialized(rhs)) {
            rhs = asEuint8(0);
        }

        return
            euint8.wrap(
                Impl.mathOp(
                    Utils.EUINT8_TFHE,
                    euint8.unwrap(lhs),
                    euint8.unwrap(rhs),
                    FunctionId.ror
                )
            );
    }

    /// @notice This function performs the ror async operation
    /// @dev It verifies that the value matches a valid ciphertext
    /// @param lhs The first input
    /// @param rhs The second input
    /// @return The result of the operation
    function ror(euint16 lhs, euint16 rhs) internal returns (euint16) {
        if (!Common.isInitialized(lhs)) {
            lhs = asEuint16(0);
        }
        if (!Common.isInitialized(rhs)) {
            rhs = asEuint16(0);
        }

        return
            euint16.wrap(
                Impl.mathOp(
                    Utils.EUINT16_TFHE,
                    euint16.unwrap(lhs),
                    euint16.unwrap(rhs),
                    FunctionId.ror
                )
            );
    }

    /// @notice This function performs the ror async operation
    /// @dev It verifies that the value matches a valid ciphertext
    /// @param lhs The first input
    /// @param rhs The second input
    /// @return The result of the operation
    function ror(euint32 lhs, euint32 rhs) internal returns (euint32) {
        if (!Common.isInitialized(lhs)) {
            lhs = asEuint32(0);
        }
        if (!Common.isInitialized(rhs)) {
            rhs = asEuint32(0);
        }

        return
            euint32.wrap(
                Impl.mathOp(
                    Utils.EUINT32_TFHE,
                    euint32.unwrap(lhs),
                    euint32.unwrap(rhs),
                    FunctionId.ror
                )
            );
    }

    /// @notice This function performs the ror async operation
    /// @dev It verifies that the value matches a valid ciphertext
    /// @param lhs The first input
    /// @param rhs The second input
    /// @return The result of the operation
    function ror(euint64 lhs, euint64 rhs) internal returns (euint64) {
        if (!Common.isInitialized(lhs)) {
            lhs = asEuint64(0);
        }
        if (!Common.isInitialized(rhs)) {
            rhs = asEuint64(0);
        }

        return
            euint64.wrap(
                Impl.mathOp(
                    Utils.EUINT64_TFHE,
                    euint64.unwrap(lhs),
                    euint64.unwrap(rhs),
                    FunctionId.ror
                )
            );
    }

    /// @notice This function performs the ror async operation
    /// @dev It verifies that the value matches a valid ciphertext
    /// @param lhs The first input
    /// @param rhs The second input
    /// @return The result of the operation
    function ror(euint128 lhs, euint128 rhs) internal returns (euint128) {
        if (!Common.isInitialized(lhs)) {
            lhs = asEuint128(0);
        }
        if (!Common.isInitialized(rhs)) {
            rhs = asEuint128(0);
        }

        return
            euint128.wrap(
                Impl.mathOp(
                    Utils.EUINT128_TFHE,
                    euint128.unwrap(lhs),
                    euint128.unwrap(rhs),
                    FunctionId.ror
                )
            );
    }

    /// @notice This function performs the ror async operation
    /// @dev It verifies that the value matches a valid ciphertext
    /// @param lhs The first input
    /// @param rhs The second input
    /// @return The result of the operation
    function ror(euint256 lhs, euint256 rhs) internal returns (euint256) {
        if (!Common.isInitialized(lhs)) {
            lhs = asEuint256(0);
        }
        if (!Common.isInitialized(rhs)) {
            rhs = asEuint256(0);
        }

        return
            euint256.wrap(
                Impl.mathOp(
                    Utils.EUINT256_TFHE,
                    euint256.unwrap(lhs),
                    euint256.unwrap(rhs),
                    FunctionId.ror
                )
            );
    }
    /// @notice Performs the async decrypt operation on a ciphertext
    /// @dev The decrypted output should be asynchronously handled by the IAsyncFHEReceiver implementation
    /// @param input1 the input ciphertext
    /// @return the input ciphertext
    function decrypt(ebool input1) internal returns (ebool) {
        if (!Common.isInitialized(input1)) {
            input1 = asEbool(false);
        }

        return ebool.wrap(Impl.decrypt(ebool.unwrap(input1)));
    }
    /// @notice Performs the async decrypt operation on a ciphertext
    /// @dev The decrypted output should be asynchronously handled by the IAsyncFHEReceiver implementation
    /// @param input1 the input ciphertext
    /// @return the input ciphertext
    function decrypt(euint8 input1) internal returns (euint8) {
        if (!Common.isInitialized(input1)) {
            input1 = asEuint8(0);
        }

        return euint8.wrap(Impl.decrypt(euint8.unwrap(input1)));
    }
    /// @notice Performs the async decrypt operation on a ciphertext
    /// @dev The decrypted output should be asynchronously handled by the IAsyncFHEReceiver implementation
    /// @param input1 the input ciphertext
    /// @return the input ciphertext
    function decrypt(euint16 input1) internal returns (euint16) {
        if (!Common.isInitialized(input1)) {
            input1 = asEuint16(0);
        }

        return euint16.wrap(Impl.decrypt(euint16.unwrap(input1)));
    }
    /// @notice Performs the async decrypt operation on a ciphertext
    /// @dev The decrypted output should be asynchronously handled by the IAsyncFHEReceiver implementation
    /// @param input1 the input ciphertext
    /// @return the input ciphertext
    function decrypt(euint32 input1) internal returns (euint32) {
        if (!Common.isInitialized(input1)) {
            input1 = asEuint32(0);
        }

        return euint32.wrap(Impl.decrypt(euint32.unwrap(input1)));
    }
    /// @notice Performs the async decrypt operation on a ciphertext
    /// @dev The decrypted output should be asynchronously handled by the IAsyncFHEReceiver implementation
    /// @param input1 the input ciphertext
    /// @return the input ciphertext
    function decrypt(euint64 input1) internal returns (euint64) {
        if (!Common.isInitialized(input1)) {
            input1 = asEuint64(0);
        }

        return euint64.wrap(Impl.decrypt(euint64.unwrap(input1)));
    }
    /// @notice Performs the async decrypt operation on a ciphertext
    /// @dev The decrypted output should be asynchronously handled by the IAsyncFHEReceiver implementation
    /// @param input1 the input ciphertext
    /// @return the input ciphertext
    function decrypt(euint128 input1) internal returns (euint128) {
        if (!Common.isInitialized(input1)) {
            input1 = asEuint128(0);
        }

        return euint128.wrap(Impl.decrypt(euint128.unwrap(input1)));
    }
    /// @notice Performs the async decrypt operation on a ciphertext
    /// @dev The decrypted output should be asynchronously handled by the IAsyncFHEReceiver implementation
    /// @param input1 the input ciphertext
    /// @return the input ciphertext
    function decrypt(euint256 input1) internal returns (euint256) {
        if (!Common.isInitialized(input1)) {
            input1 = asEuint256(0);
        }

        return euint256.wrap(Impl.decrypt(euint256.unwrap(input1)));
    }
    /// @notice Performs the async decrypt operation on a ciphertext
    /// @dev The decrypted output should be asynchronously handled by the IAsyncFHEReceiver implementation
    /// @param input1 the input ciphertext
    /// @return the input ciphertext
    function decrypt(eaddress input1) internal returns (eaddress) {
        if (!Common.isInitialized(input1)) {
            input1 = asEaddress(address(0));
        }

        return eaddress.wrap(Impl.decrypt(eaddress.unwrap(input1)));
    }

    function getDecryptResult(ebool input1) internal view returns (bool) {
        uint256 result = Impl.getDecryptResult(ebool.unwrap(input1));
        return result == 1;
    }
    function getDecryptResult(euint8 input1) internal view returns (uint8) {
        return uint8(Impl.getDecryptResult(euint8.unwrap(input1)));
    }
    function getDecryptResult(euint16 input1) internal view returns (uint16) {
        return uint16(Impl.getDecryptResult(euint16.unwrap(input1)));
    }
    function getDecryptResult(euint32 input1) internal view returns (uint32) {
        return uint32(Impl.getDecryptResult(euint32.unwrap(input1)));
    }
    function getDecryptResult(euint64 input1) internal view returns (uint64) {
        return uint64(Impl.getDecryptResult(euint64.unwrap(input1)));
    }
    function getDecryptResult(euint128 input1) internal view returns (uint128) {
        return uint128(Impl.getDecryptResult(euint128.unwrap(input1)));
    }
    function getDecryptResult(euint256 input1) internal view returns (uint256) {
        return uint256(Impl.getDecryptResult(euint256.unwrap(input1)));
    }
    function getDecryptResult(eaddress input1) internal view returns (address) {
        return address(uint160(Impl.getDecryptResult(eaddress.unwrap(input1))));
    }
    function getDecryptResult(uint256 input1) internal view returns (uint256) {
        return Impl.getDecryptResult(input1);
    }

    function getDecryptResultSafe(
        ebool input1
    ) internal view returns (bool result, bool decrypted) {
        (uint256 _result, bool _decrypted) = Impl.getDecryptResultSafe(
            ebool.unwrap(input1)
        );
        return (_result == 1, _decrypted);
    }
    function getDecryptResultSafe(
        euint8 input1
    ) internal view returns (uint8 result, bool decrypted) {
        (uint256 _result, bool _decrypted) = Impl.getDecryptResultSafe(
            euint8.unwrap(input1)
        );
        return (uint8(_result), _decrypted);
    }
    function getDecryptResultSafe(
        euint16 input1
    ) internal view returns (uint16 result, bool decrypted) {
        (uint256 _result, bool _decrypted) = Impl.getDecryptResultSafe(
            euint16.unwrap(input1)
        );
        return (uint16(_result), _decrypted);
    }
    function getDecryptResultSafe(
        euint32 input1
    ) internal view returns (uint32 result, bool decrypted) {
        (uint256 _result, bool _decrypted) = Impl.getDecryptResultSafe(
            euint32.unwrap(input1)
        );
        return (uint32(_result), _decrypted);
    }
    function getDecryptResultSafe(
        euint64 input1
    ) internal view returns (uint64 result, bool decrypted) {
        (uint256 _result, bool _decrypted) = Impl.getDecryptResultSafe(
            euint64.unwrap(input1)
        );
        return (uint64(_result), _decrypted);
    }
    function getDecryptResultSafe(
        euint128 input1
    ) internal view returns (uint128 result, bool decrypted) {
        (uint256 _result, bool _decrypted) = Impl.getDecryptResultSafe(
            euint128.unwrap(input1)
        );
        return (uint128(_result), _decrypted);
    }
    function getDecryptResultSafe(
        euint256 input1
    ) internal view returns (uint256 result, bool decrypted) {
        (uint256 _result, bool _decrypted) = Impl.getDecryptResultSafe(
            euint256.unwrap(input1)
        );
        return (uint256(_result), _decrypted);
    }
    function getDecryptResultSafe(
        eaddress input1
    ) internal view returns (address result, bool decrypted) {
        (uint256 _result, bool _decrypted) = Impl.getDecryptResultSafe(
            eaddress.unwrap(input1)
        );
        return (address(uint160(_result)), _decrypted);
    }
    function getDecryptResultSafe(
        uint256 input1
    ) internal view returns (uint256 result, bool decrypted) {
        (uint256 _result, bool _decrypted) = Impl.getDecryptResultSafe(input1);
        return (_result, _decrypted);
    }

    function select(
        ebool input1,
        ebool input2,
        ebool input3
    ) internal returns (ebool) {
        if (!Common.isInitialized(input1)) {
            input1 = asEbool(false);
        }
        if (!Common.isInitialized(input2)) {
            input2 = asEbool(false);
        }
        if (!Common.isInitialized(input3)) {
            input3 = asEbool(false);
        }

        return
            ebool.wrap(
                Impl.select(
                    Utils.EBOOL_TFHE,
                    input1,
                    ebool.unwrap(input2),
                    ebool.unwrap(input3)
                )
            );
    }

    function select(
        ebool input1,
        euint8 input2,
        euint8 input3
    ) internal returns (euint8) {
        if (!Common.isInitialized(input1)) {
            input1 = asEbool(false);
        }
        if (!Common.isInitialized(input2)) {
            input2 = asEuint8(0);
        }
        if (!Common.isInitialized(input3)) {
            input3 = asEuint8(0);
        }

        return
            euint8.wrap(
                Impl.select(
                    Utils.EUINT8_TFHE,
                    input1,
                    euint8.unwrap(input2),
                    euint8.unwrap(input3)
                )
            );
    }

    function select(
        ebool input1,
        euint16 input2,
        euint16 input3
    ) internal returns (euint16) {
        if (!Common.isInitialized(input1)) {
            input1 = asEbool(false);
        }
        if (!Common.isInitialized(input2)) {
            input2 = asEuint16(0);
        }
        if (!Common.isInitialized(input3)) {
            input3 = asEuint16(0);
        }

        return
            euint16.wrap(
                Impl.select(
                    Utils.EUINT16_TFHE,
                    input1,
                    euint16.unwrap(input2),
                    euint16.unwrap(input3)
                )
            );
    }

    function select(
        ebool input1,
        euint32 input2,
        euint32 input3
    ) internal returns (euint32) {
        if (!Common.isInitialized(input1)) {
            input1 = asEbool(false);
        }
        if (!Common.isInitialized(input2)) {
            input2 = asEuint32(0);
        }
        if (!Common.isInitialized(input3)) {
            input3 = asEuint32(0);
        }

        return
            euint32.wrap(
                Impl.select(
                    Utils.EUINT32_TFHE,
                    input1,
                    euint32.unwrap(input2),
                    euint32.unwrap(input3)
                )
            );
    }

    function select(
        ebool input1,
        euint64 input2,
        euint64 input3
    ) internal returns (euint64) {
        if (!Common.isInitialized(input1)) {
            input1 = asEbool(false);
        }
        if (!Common.isInitialized(input2)) {
            input2 = asEuint64(0);
        }
        if (!Common.isInitialized(input3)) {
            input3 = asEuint64(0);
        }

        return
            euint64.wrap(
                Impl.select(
                    Utils.EUINT64_TFHE,
                    input1,
                    euint64.unwrap(input2),
                    euint64.unwrap(input3)
                )
            );
    }

    function select(
        ebool input1,
        euint128 input2,
        euint128 input3
    ) internal returns (euint128) {
        if (!Common.isInitialized(input1)) {
            input1 = asEbool(false);
        }
        if (!Common.isInitialized(input2)) {
            input2 = asEuint128(0);
        }
        if (!Common.isInitialized(input3)) {
            input3 = asEuint128(0);
        }

        return
            euint128.wrap(
                Impl.select(
                    Utils.EUINT128_TFHE,
                    input1,
                    euint128.unwrap(input2),
                    euint128.unwrap(input3)
                )
            );
    }

    function select(
        ebool input1,
        euint256 input2,
        euint256 input3
    ) internal returns (euint256) {
        if (!Common.isInitialized(input1)) {
            input1 = asEbool(false);
        }
        if (!Common.isInitialized(input2)) {
            input2 = asEuint256(0);
        }
        if (!Common.isInitialized(input3)) {
            input3 = asEuint256(0);
        }

        return
            euint256.wrap(
                Impl.select(
                    Utils.EUINT256_TFHE,
                    input1,
                    euint256.unwrap(input2),
                    euint256.unwrap(input3)
                )
            );
    }

    function select(
        ebool input1,
        eaddress input2,
        eaddress input3
    ) internal returns (eaddress) {
        if (!Common.isInitialized(input1)) {
            input1 = asEbool(false);
        }
        if (!Common.isInitialized(input2)) {
            input2 = asEaddress(address(0));
        }
        if (!Common.isInitialized(input3)) {
            input3 = asEaddress(address(0));
        }

        return
            eaddress.wrap(
                Impl.select(
                    Utils.EADDRESS_TFHE,
                    input1,
                    eaddress.unwrap(input2),
                    eaddress.unwrap(input3)
                )
            );
    }

    /// @notice Performs the not operation on a ciphertext
    /// @dev Verifies that the input value matches a valid ciphertext.
    /// @param input1 the input ciphertext
    function not(ebool input1) internal returns (ebool) {
        if (!Common.isInitialized(input1)) {
            input1 = asEbool(false);
        }

        return ebool.wrap(Impl.not(Utils.EBOOL_TFHE, ebool.unwrap(input1)));
    }

    /// @notice Performs the not operation on a ciphertext
    /// @dev Verifies that the input value matches a valid ciphertext.
    /// @param input1 the input ciphertext
    function not(euint8 input1) internal returns (euint8) {
        if (!Common.isInitialized(input1)) {
            input1 = asEuint8(0);
        }

        return euint8.wrap(Impl.not(Utils.EUINT8_TFHE, euint8.unwrap(input1)));
    }
    /// @notice Performs the not operation on a ciphertext
    /// @dev Verifies that the input value matches a valid ciphertext.
    /// @param input1 the input ciphertext
    function not(euint16 input1) internal returns (euint16) {
        if (!Common.isInitialized(input1)) {
            input1 = asEuint16(0);
        }

        return
            euint16.wrap(Impl.not(Utils.EUINT16_TFHE, euint16.unwrap(input1)));
    }
    /// @notice Performs the not operation on a ciphertext
    /// @dev Verifies that the input value matches a valid ciphertext.
    /// @param input1 the input ciphertext
    function not(euint32 input1) internal returns (euint32) {
        if (!Common.isInitialized(input1)) {
            input1 = asEuint32(0);
        }

        return
            euint32.wrap(Impl.not(Utils.EUINT32_TFHE, euint32.unwrap(input1)));
    }
    /// @notice Performs the not operation on a ciphertext
    /// @dev Verifies that the input value matches a valid ciphertext.
    /// @param input1 the input ciphertext
    function not(euint64 input1) internal returns (euint64) {
        if (!Common.isInitialized(input1)) {
            input1 = asEuint64(0);
        }

        return
            euint64.wrap(Impl.not(Utils.EUINT64_TFHE, euint64.unwrap(input1)));
    }
    /// @notice Performs the not operation on a ciphertext
    /// @dev Verifies that the input value matches a valid ciphertext.
    /// @param input1 the input ciphertext
    function not(euint128 input1) internal returns (euint128) {
        if (!Common.isInitialized(input1)) {
            input1 = asEuint128(0);
        }

        return
            euint128.wrap(
                Impl.not(Utils.EUINT128_TFHE, euint128.unwrap(input1))
            );
    }

    function not(euint256 input1) internal returns (euint256) {
        if (!Common.isInitialized(input1)) {
            input1 = asEuint256(0);
        }

        return
            euint256.wrap(
                Impl.not(Utils.EUINT256_TFHE, euint256.unwrap(input1))
            );
    }
    /// @notice Performs the square operation on a ciphertext
    /// @dev Verifies that the input value matches a valid ciphertext.
    /// @param input1 the input ciphertext
    function square(euint8 input1) internal returns (euint8) {
        if (!Common.isInitialized(input1)) {
            input1 = asEuint8(0);
        }

        return
            euint8.wrap(Impl.square(Utils.EUINT8_TFHE, euint8.unwrap(input1)));
    }
    /// @notice Performs the square operation on a ciphertext
    /// @dev Verifies that the input value matches a valid ciphertext.
    /// @param input1 the input ciphertext
    function square(euint16 input1) internal returns (euint16) {
        if (!Common.isInitialized(input1)) {
            input1 = asEuint16(0);
        }

        return
            euint16.wrap(
                Impl.square(Utils.EUINT16_TFHE, euint16.unwrap(input1))
            );
    }
    /// @notice Performs the square operation on a ciphertext
    /// @dev Verifies that the input value matches a valid ciphertext.
    /// @param input1 the input ciphertext
    function square(euint32 input1) internal returns (euint32) {
        if (!Common.isInitialized(input1)) {
            input1 = asEuint32(0);
        }

        return
            euint32.wrap(
                Impl.square(Utils.EUINT32_TFHE, euint32.unwrap(input1))
            );
    }
    /// @notice Performs the square operation on a ciphertext
    /// @dev Verifies that the input value matches a valid ciphertext.
    /// @param input1 the input ciphertext
    function square(euint64 input1) internal returns (euint64) {
        if (!Common.isInitialized(input1)) {
            input1 = asEuint64(0);
        }

        return
            euint64.wrap(
                Impl.square(Utils.EUINT64_TFHE, euint64.unwrap(input1))
            );
    }

    /// @notice Performs the square operation on a ciphertext
    /// @dev Verifies that the input value matches a valid ciphertext.
    /// @param input1 the input ciphertext
    function square(euint128 input1) internal returns (euint128) {
        if (!Common.isInitialized(input1)) {
            input1 = asEuint128(0);
        }

        return
            euint128.wrap(
                Impl.square(Utils.EUINT128_TFHE, euint128.unwrap(input1))
            );
    }

    /// @notice Performs the square operation on a ciphertext
    /// @dev Verifies that the input value matches a valid ciphertext.
    /// @param input1 the input ciphertext
    function square(euint256 input1) internal returns (euint256) {
        if (!Common.isInitialized(input1)) {
            input1 = asEuint256(0);
        }

        return
            euint256.wrap(
                Impl.square(Utils.EUINT256_TFHE, euint256.unwrap(input1))
            );
    }

    /// @notice Generates a random value of a euint8 type for provided securityZone
    /// @dev Calls the desired function
    /// @param securityZone the security zone to use for the random value
    function randomEuint8(int32 securityZone) internal returns (euint8) {
        return euint8.wrap(Impl.random(Utils.EUINT8_TFHE, 0, securityZone));
    }
    /// @notice Generates a random value of a euint8 type
    /// @dev Calls the desired function
    function randomEuint8() internal returns (euint8) {
        return randomEuint8(0);
    }
    /// @notice Generates a random value of a euint16 type for provided securityZone
    /// @dev Calls the desired function
    /// @param securityZone the security zone to use for the random value
    function randomEuint16(int32 securityZone) internal returns (euint16) {
        return euint16.wrap(Impl.random(Utils.EUINT16_TFHE, 0, securityZone));
    }
    /// @notice Generates a random value of a euint16 type
    /// @dev Calls the desired function
    function randomEuint16() internal returns (euint16) {
        return randomEuint16(0);
    }
    /// @notice Generates a random value of a euint32 type for provided securityZone
    /// @dev Calls the desired function
    /// @param securityZone the security zone to use for the random value
    function randomEuint32(int32 securityZone) internal returns (euint32) {
        return euint32.wrap(Impl.random(Utils.EUINT32_TFHE, 0, securityZone));
    }
    /// @notice Generates a random value of a euint32 type
    /// @dev Calls the desired function
    function randomEuint32() internal returns (euint32) {
        return randomEuint32(0);
    }
    /// @notice Generates a random value of a euint64 type for provided securityZone
    /// @dev Calls the desired function
    /// @param securityZone the security zone to use for the random value
    function randomEuint64(int32 securityZone) internal returns (euint64) {
        return euint64.wrap(Impl.random(Utils.EUINT64_TFHE, 0, securityZone));
    }
    /// @notice Generates a random value of a euint64 type
    /// @dev Calls the desired function
    function randomEuint64() internal returns (euint64) {
        return randomEuint64(0);
    }
    /// @notice Generates a random value of a euint128 type for provided securityZone
    /// @dev Calls the desired function
    /// @param securityZone the security zone to use for the random value
    function randomEuint128(int32 securityZone) internal returns (euint128) {
        return euint128.wrap(Impl.random(Utils.EUINT128_TFHE, 0, securityZone));
    }
    /// @notice Generates a random value of a euint128 type
    /// @dev Calls the desired function
    function randomEuint128() internal returns (euint128) {
        return randomEuint128(0);
    }
    /// @notice Generates a random value of a euint256 type for provided securityZone
    /// @dev Calls the desired function
    /// @param securityZone the security zone to use for the random value
    function randomEuint256(int32 securityZone) internal returns (euint256) {
        return euint256.wrap(Impl.random(Utils.EUINT256_TFHE, 0, securityZone));
    }
    /// @notice Generates a random value of a euint256 type
    /// @dev Calls the desired function
    function randomEuint256() internal returns (euint256) {
        return randomEuint256(0);
    }

    function asEbool(inEbool memory value) internal returns (ebool) {
        ITaskManager(TASK_MANAGER_ADDRESS).verifyKey(
            value.hash,
            value.utype,
            value.securityZone,
            value.signature,
            Utils.EBOOL_TFHE
        );
        return ebool.wrap(value.hash);
    }

    function asEuint8(inEuint8 memory value) internal returns (euint8) {
        ITaskManager(TASK_MANAGER_ADDRESS).verifyKey(
            value.hash,
            value.utype,
            value.securityZone,
            value.signature,
            Utils.EUINT8_TFHE
        );
        return euint8.wrap(value.hash);
    }

    function asEuint16(inEuint16 memory value) internal returns (euint16) {
        ITaskManager(TASK_MANAGER_ADDRESS).verifyKey(
            value.hash,
            value.utype,
            value.securityZone,
            value.signature,
            Utils.EUINT16_TFHE
        );
        return euint16.wrap(value.hash);
    }

    function asEuint32(inEuint32 memory value) internal returns (euint32) {
        ITaskManager(TASK_MANAGER_ADDRESS).verifyKey(
            value.hash,
            value.utype,
            value.securityZone,
            value.signature,
            Utils.EUINT32_TFHE
        );
        return euint32.wrap(value.hash);
    }

    function asEuint64(inEuint64 memory value) internal returns (euint64) {
        ITaskManager(TASK_MANAGER_ADDRESS).verifyKey(
            value.hash,
            value.utype,
            value.securityZone,
            value.signature,
            Utils.EUINT64_TFHE
        );
        return euint64.wrap(value.hash);
    }

    function asEuint128(inEuint128 memory value) internal returns (euint128) {
        ITaskManager(TASK_MANAGER_ADDRESS).verifyKey(
            value.hash,
            value.utype,
            value.securityZone,
            value.signature,
            Utils.EUINT128_TFHE
        );
        return euint128.wrap(value.hash);
    }

    function asEuint256(inEuint256 memory value) internal returns (euint256) {
        ITaskManager(TASK_MANAGER_ADDRESS).verifyKey(
            value.hash,
            value.utype,
            value.securityZone,
            value.signature,
            Utils.EUINT256_TFHE
        );
        return euint256.wrap(value.hash);
    }

    function asEaddress(inEaddress memory value) internal returns (eaddress) {
        ITaskManager(TASK_MANAGER_ADDRESS).verifyKey(
            value.hash,
            value.utype,
            value.securityZone,
            value.signature,
            Utils.EADDRESS_TFHE
        );
        return eaddress.wrap(value.hash);
    }

    // ********** TYPE CASTING ************* //
    /// @notice Converts a ebool to an euint8
    function asEuint8(ebool value) internal returns (euint8) {
        return euint8.wrap(Impl.cast(ebool.unwrap(value), Utils.EUINT8_TFHE));
    }
    /// @notice Converts a ebool to an euint16
    function asEuint16(ebool value) internal returns (euint16) {
        return euint16.wrap(Impl.cast(ebool.unwrap(value), Utils.EUINT16_TFHE));
    }
    /// @notice Converts a ebool to an euint32
    function asEuint32(ebool value) internal returns (euint32) {
        return euint32.wrap(Impl.cast(ebool.unwrap(value), Utils.EUINT32_TFHE));
    }
    /// @notice Converts a ebool to an euint64
    function asEuint64(ebool value) internal returns (euint64) {
        return euint64.wrap(Impl.cast(ebool.unwrap(value), Utils.EUINT64_TFHE));
    }
    /// @notice Converts a ebool to an euint128
    function asEuint128(ebool value) internal returns (euint128) {
        return
            euint128.wrap(Impl.cast(ebool.unwrap(value), Utils.EUINT128_TFHE));
    }
    /// @notice Converts a ebool to an euint256
    function asEuint256(ebool value) internal returns (euint256) {
        return
            euint256.wrap(Impl.cast(ebool.unwrap(value), Utils.EUINT256_TFHE));
    }

    /// @notice Converts a euint8 to an ebool
    function asEbool(euint8 value) internal returns (ebool) {
        return ne(value, asEuint8(0));
    }
    /// @notice Converts a euint8 to an euint16
    function asEuint16(euint8 value) internal returns (euint16) {
        return
            euint16.wrap(Impl.cast(euint8.unwrap(value), Utils.EUINT16_TFHE));
    }
    /// @notice Converts a euint8 to an euint32
    function asEuint32(euint8 value) internal returns (euint32) {
        return
            euint32.wrap(Impl.cast(euint8.unwrap(value), Utils.EUINT32_TFHE));
    }
    /// @notice Converts a euint8 to an euint64
    function asEuint64(euint8 value) internal returns (euint64) {
        return
            euint64.wrap(Impl.cast(euint8.unwrap(value), Utils.EUINT64_TFHE));
    }
    /// @notice Converts a euint8 to an euint128
    function asEuint128(euint8 value) internal returns (euint128) {
        return
            euint128.wrap(Impl.cast(euint8.unwrap(value), Utils.EUINT128_TFHE));
    }
    /// @notice Converts a euint8 to an euint256
    function asEuint256(euint8 value) internal returns (euint256) {
        return
            euint256.wrap(Impl.cast(euint8.unwrap(value), Utils.EUINT256_TFHE));
    }

    /// @notice Converts a euint16 to an ebool
    function asEbool(euint16 value) internal returns (ebool) {
        return ne(value, asEuint16(0));
    }
    /// @notice Converts a euint16 to an euint8
    function asEuint8(euint16 value) internal returns (euint8) {
        return euint8.wrap(Impl.cast(euint16.unwrap(value), Utils.EUINT8_TFHE));
    }
    /// @notice Converts a euint16 to an euint32
    function asEuint32(euint16 value) internal returns (euint32) {
        return
            euint32.wrap(Impl.cast(euint16.unwrap(value), Utils.EUINT32_TFHE));
    }
    /// @notice Converts a euint16 to an euint64
    function asEuint64(euint16 value) internal returns (euint64) {
        return
            euint64.wrap(Impl.cast(euint16.unwrap(value), Utils.EUINT64_TFHE));
    }
    /// @notice Converts a euint16 to an euint128
    function asEuint128(euint16 value) internal returns (euint128) {
        return
            euint128.wrap(
                Impl.cast(euint16.unwrap(value), Utils.EUINT128_TFHE)
            );
    }
    /// @notice Converts a euint16 to an euint256
    function asEuint256(euint16 value) internal returns (euint256) {
        return
            euint256.wrap(
                Impl.cast(euint16.unwrap(value), Utils.EUINT256_TFHE)
            );
    }

    /// @notice Converts a euint32 to an ebool
    function asEbool(euint32 value) internal returns (ebool) {
        return ne(value, asEuint32(0));
    }
    /// @notice Converts a euint32 to an euint8
    function asEuint8(euint32 value) internal returns (euint8) {
        return euint8.wrap(Impl.cast(euint32.unwrap(value), Utils.EUINT8_TFHE));
    }
    /// @notice Converts a euint32 to an euint16
    function asEuint16(euint32 value) internal returns (euint16) {
        return
            euint16.wrap(Impl.cast(euint32.unwrap(value), Utils.EUINT16_TFHE));
    }
    /// @notice Converts a euint32 to an euint64
    function asEuint64(euint32 value) internal returns (euint64) {
        return
            euint64.wrap(Impl.cast(euint32.unwrap(value), Utils.EUINT64_TFHE));
    }
    /// @notice Converts a euint32 to an euint128
    function asEuint128(euint32 value) internal returns (euint128) {
        return
            euint128.wrap(
                Impl.cast(euint32.unwrap(value), Utils.EUINT128_TFHE)
            );
    }
    /// @notice Converts a euint32 to an euint256
    function asEuint256(euint32 value) internal returns (euint256) {
        return
            euint256.wrap(
                Impl.cast(euint32.unwrap(value), Utils.EUINT256_TFHE)
            );
    }

    /// @notice Converts a euint64 to an ebool
    function asEbool(euint64 value) internal returns (ebool) {
        return ne(value, asEuint64(0));
    }
    /// @notice Converts a euint64 to an euint8
    function asEuint8(euint64 value) internal returns (euint8) {
        return euint8.wrap(Impl.cast(euint64.unwrap(value), Utils.EUINT8_TFHE));
    }
    /// @notice Converts a euint64 to an euint16
    function asEuint16(euint64 value) internal returns (euint16) {
        return
            euint16.wrap(Impl.cast(euint64.unwrap(value), Utils.EUINT16_TFHE));
    }
    /// @notice Converts a euint64 to an euint32
    function asEuint32(euint64 value) internal returns (euint32) {
        return
            euint32.wrap(Impl.cast(euint64.unwrap(value), Utils.EUINT32_TFHE));
    }
    /// @notice Converts a euint64 to an euint128
    function asEuint128(euint64 value) internal returns (euint128) {
        return
            euint128.wrap(
                Impl.cast(euint64.unwrap(value), Utils.EUINT128_TFHE)
            );
    }
    /// @notice Converts a euint64 to an euint256
    function asEuint256(euint64 value) internal returns (euint256) {
        return
            euint256.wrap(
                Impl.cast(euint64.unwrap(value), Utils.EUINT256_TFHE)
            );
    }

    /// @notice Converts a euint128 to an ebool
    function asEbool(euint128 value) internal returns (ebool) {
        return ne(value, asEuint128(0));
    }
    /// @notice Converts a euint128 to an euint8
    function asEuint8(euint128 value) internal returns (euint8) {
        return
            euint8.wrap(Impl.cast(euint128.unwrap(value), Utils.EUINT8_TFHE));
    }
    /// @notice Converts a euint128 to an euint16
    function asEuint16(euint128 value) internal returns (euint16) {
        return
            euint16.wrap(Impl.cast(euint128.unwrap(value), Utils.EUINT16_TFHE));
    }
    /// @notice Converts a euint128 to an euint32
    function asEuint32(euint128 value) internal returns (euint32) {
        return
            euint32.wrap(Impl.cast(euint128.unwrap(value), Utils.EUINT32_TFHE));
    }
    /// @notice Converts a euint128 to an euint64
    function asEuint64(euint128 value) internal returns (euint64) {
        return
            euint64.wrap(Impl.cast(euint128.unwrap(value), Utils.EUINT64_TFHE));
    }
    /// @notice Converts a euint128 to an euint256
    function asEuint256(euint128 value) internal returns (euint256) {
        return
            euint256.wrap(
                Impl.cast(euint128.unwrap(value), Utils.EUINT256_TFHE)
            );
    }

    /// @notice Converts a euint256 to an ebool
    function asEbool(euint256 value) internal returns (ebool) {
        return ne(value, asEuint256(0));
    }
    /// @notice Converts a euint256 to an euint8
    function asEuint8(euint256 value) internal returns (euint8) {
        return
            euint8.wrap(Impl.cast(euint256.unwrap(value), Utils.EUINT8_TFHE));
    }
    /// @notice Converts a euint256 to an euint16
    function asEuint16(euint256 value) internal returns (euint16) {
        return
            euint16.wrap(Impl.cast(euint256.unwrap(value), Utils.EUINT16_TFHE));
    }
    /// @notice Converts a euint256 to an euint32
    function asEuint32(euint256 value) internal returns (euint32) {
        return
            euint32.wrap(Impl.cast(euint256.unwrap(value), Utils.EUINT32_TFHE));
    }
    /// @notice Converts a euint256 to an euint64
    function asEuint64(euint256 value) internal returns (euint64) {
        return
            euint64.wrap(Impl.cast(euint256.unwrap(value), Utils.EUINT64_TFHE));
    }
    /// @notice Converts a euint256 to an euint128
    function asEuint128(euint256 value) internal returns (euint128) {
        return
            euint128.wrap(
                Impl.cast(euint256.unwrap(value), Utils.EUINT128_TFHE)
            );
    }
    /// @notice Converts a euint256 to an eaddress
    function asEaddress(euint256 value) internal returns (eaddress) {
        return
            eaddress.wrap(
                Impl.cast(euint256.unwrap(value), Utils.EADDRESS_TFHE)
            );
    }

    /// @notice Converts a eaddress to an ebool
    function asEbool(eaddress value) internal returns (ebool) {
        return ne(value, asEaddress(address(0)));
    }
    /// @notice Converts a eaddress to an euint8
    function asEuint8(eaddress value) internal returns (euint8) {
        return
            euint8.wrap(Impl.cast(eaddress.unwrap(value), Utils.EUINT8_TFHE));
    }
    /// @notice Converts a eaddress to an euint16
    function asEuint16(eaddress value) internal returns (euint16) {
        return
            euint16.wrap(Impl.cast(eaddress.unwrap(value), Utils.EUINT16_TFHE));
    }
    /// @notice Converts a eaddress to an euint32
    function asEuint32(eaddress value) internal returns (euint32) {
        return
            euint32.wrap(Impl.cast(eaddress.unwrap(value), Utils.EUINT32_TFHE));
    }
    /// @notice Converts a eaddress to an euint64
    function asEuint64(eaddress value) internal returns (euint64) {
        return
            euint64.wrap(Impl.cast(eaddress.unwrap(value), Utils.EUINT64_TFHE));
    }
    /// @notice Converts a eaddress to an euint128
    function asEuint128(eaddress value) internal returns (euint128) {
        return
            euint128.wrap(
                Impl.cast(eaddress.unwrap(value), Utils.EUINT128_TFHE)
            );
    }
    /// @notice Converts a eaddress to an euint256
    function asEuint256(eaddress value) internal returns (euint256) {
        return
            euint256.wrap(
                Impl.cast(eaddress.unwrap(value), Utils.EUINT256_TFHE)
            );
    }
    /// @notice Converts a plaintext boolean value to a ciphertext ebool
    /// @dev Privacy: The input value is public, therefore the resulting ciphertext should be considered public until involved in an fhe operation
    /// @return A ciphertext representation of the input
    function asEbool(bool value) internal returns (ebool) {
        return asEbool(value, 0);
    }
    /// @notice Converts a plaintext boolean value to a ciphertext ebool, specifying security zone
    /// @dev Privacy: The input value is public, therefore the resulting ciphertext should be considered public until involved in an fhe operation
    /// @return A ciphertext representation of the input
    function asEbool(bool value, int32 securityZone) internal returns (ebool) {
        uint256 sVal = 0;
        if (value) {
            sVal = 1;
        }
        uint256 ct = Impl.trivialEncrypt(sVal, Utils.EBOOL_TFHE, securityZone);
        return ebool.wrap(ct);
    }
    /// @notice Converts a uint256 to an euint8
    /// @dev Privacy: The input value is public, therefore the resulting ciphertext should be considered public until involved in an fhe operation
    function asEuint8(uint256 value) internal returns (euint8) {
        return asEuint8(value, 0);
    }
    /// @notice Converts a uint256 to an euint8, specifying security zone
    /// @dev Privacy: The input value is public, therefore the resulting ciphertext should be considered public until involved in an fhe operation
    function asEuint8(
        uint256 value,
        int32 securityZone
    ) internal returns (euint8) {
        uint256 ct = Impl.trivialEncrypt(
            value,
            Utils.EUINT8_TFHE,
            securityZone
        );
        return euint8.wrap(ct);
    }
    /// @notice Converts a uint256 to an euint16
    /// @dev Privacy: The input value is public, therefore the resulting ciphertext should be considered public until involved in an fhe operation
    function asEuint16(uint256 value) internal returns (euint16) {
        return asEuint16(value, 0);
    }
    /// @notice Converts a uint256 to an euint16, specifying security zone
    /// @dev Privacy: The input value is public, therefore the resulting ciphertext should be considered public until involved in an fhe operation
    function asEuint16(
        uint256 value,
        int32 securityZone
    ) internal returns (euint16) {
        uint256 ct = Impl.trivialEncrypt(
            value,
            Utils.EUINT16_TFHE,
            securityZone
        );
        return euint16.wrap(ct);
    }
    /// @notice Converts a uint256 to an euint32
    /// @dev Privacy: The input value is public, therefore the resulting ciphertext should be considered public until involved in an fhe operation
    function asEuint32(uint256 value) internal returns (euint32) {
        return asEuint32(value, 0);
    }
    /// @notice Converts a uint256 to an euint32, specifying security zone
    /// @dev Privacy: The input value is public, therefore the resulting ciphertext should be considered public until involved in an fhe operation
    function asEuint32(
        uint256 value,
        int32 securityZone
    ) internal returns (euint32) {
        uint256 ct = Impl.trivialEncrypt(
            value,
            Utils.EUINT32_TFHE,
            securityZone
        );
        return euint32.wrap(ct);
    }
    /// @notice Converts a uint256 to an euint64
    /// @dev Privacy: The input value is public, therefore the resulting ciphertext should be considered public until involved in an fhe operation
    function asEuint64(uint256 value) internal returns (euint64) {
        return asEuint64(value, 0);
    }
    /// @notice Converts a uint256 to an euint64, specifying security zone
    /// @dev Privacy: The input value is public, therefore the resulting ciphertext should be considered public until involved in an fhe operation
    function asEuint64(
        uint256 value,
        int32 securityZone
    ) internal returns (euint64) {
        uint256 ct = Impl.trivialEncrypt(
            value,
            Utils.EUINT64_TFHE,
            securityZone
        );
        return euint64.wrap(ct);
    }
    /// @notice Converts a uint256 to an euint128
    /// @dev Privacy: The input value is public, therefore the resulting ciphertext should be considered public until involved in an fhe operation
    function asEuint128(uint256 value) internal returns (euint128) {
        return asEuint128(value, 0);
    }
    /// @notice Converts a uint256 to an euint128, specifying security zone
    /// @dev Privacy: The input value is public, therefore the resulting ciphertext should be considered public until involved in an fhe operation
    function asEuint128(
        uint256 value,
        int32 securityZone
    ) internal returns (euint128) {
        uint256 ct = Impl.trivialEncrypt(
            value,
            Utils.EUINT128_TFHE,
            securityZone
        );
        return euint128.wrap(ct);
    }
    /// @notice Converts a uint256 to an euint256
    /// @dev Privacy: The input value is public, therefore the resulting ciphertext should be considered public until involved in an fhe operation
    function asEuint256(uint256 value) internal returns (euint256) {
        return asEuint256(value, 0);
    }
    /// @notice Converts a uint256 to an euint256, specifying security zone
    /// @dev Privacy: The input value is public, therefore the resulting ciphertext should be considered public until involved in an fhe operation
    function asEuint256(
        uint256 value,
        int32 securityZone
    ) internal returns (euint256) {
        uint256 ct = Impl.trivialEncrypt(
            value,
            Utils.EUINT256_TFHE,
            securityZone
        );
        return euint256.wrap(ct);
    }
    /// @notice Converts a address to an eaddress
    /// @dev Privacy: The input value is public, therefore the resulting ciphertext should be considered public until involved in an fhe operation
    /// Allows for a better user experience when working with eaddresses
    function asEaddress(address value) internal returns (eaddress) {
        return asEaddress(value, 0);
    }
    /// @notice Converts a address to an eaddress, specifying security zone
    /// @dev Privacy: The input value is public, therefore the resulting ciphertext should be considered public until involved in an fhe operation
    /// Allows for a better user experience when working with eaddresses
    function asEaddress(
        address value,
        int32 securityZone
    ) internal returns (eaddress) {
        uint256 ct = Impl.trivialEncrypt(
            uint256(uint160(value)),
            Utils.EADDRESS_TFHE,
            securityZone
        );
        return eaddress.wrap(ct);
    }
    function allow(ebool ctHash, address account) internal {
        ITaskManager(TASK_MANAGER_ADDRESS).allow(ebool.unwrap(ctHash), account);
    }

    function allow(euint8 ctHash, address account) internal {
        ITaskManager(TASK_MANAGER_ADDRESS).allow(
            euint8.unwrap(ctHash),
            account
        );
    }

    function allow(euint16 ctHash, address account) internal {
        ITaskManager(TASK_MANAGER_ADDRESS).allow(
            euint16.unwrap(ctHash),
            account
        );
    }

    function allow(euint32 ctHash, address account) internal {
        ITaskManager(TASK_MANAGER_ADDRESS).allow(
            euint32.unwrap(ctHash),
            account
        );
    }

    function allow(euint64 ctHash, address account) internal {
        ITaskManager(TASK_MANAGER_ADDRESS).allow(
            euint64.unwrap(ctHash),
            account
        );
    }

    function allow(euint128 ctHash, address account) internal {
        ITaskManager(TASK_MANAGER_ADDRESS).allow(
            euint128.unwrap(ctHash),
            account
        );
    }

    function allow(euint256 ctHash, address account) internal {
        ITaskManager(TASK_MANAGER_ADDRESS).allow(
            euint256.unwrap(ctHash),
            account
        );
    }

    function allow(eaddress ctHash, address account) internal {
        ITaskManager(TASK_MANAGER_ADDRESS).allow(
            eaddress.unwrap(ctHash),
            account
        );
    }

    function isAllowed(ebool ctHash, address account) internal returns (bool) {
        return
            ITaskManager(TASK_MANAGER_ADDRESS).isAllowed(
                ebool.unwrap(ctHash),
                account
            );
    }

    function isAllowed(euint8 ctHash, address account) internal returns (bool) {
        return
            ITaskManager(TASK_MANAGER_ADDRESS).isAllowed(
                euint8.unwrap(ctHash),
                account
            );
    }

    function isAllowed(
        euint16 ctHash,
        address account
    ) internal returns (bool) {
        return
            ITaskManager(TASK_MANAGER_ADDRESS).isAllowed(
                euint16.unwrap(ctHash),
                account
            );
    }

    function isAllowed(
        euint32 ctHash,
        address account
    ) internal returns (bool) {
        return
            ITaskManager(TASK_MANAGER_ADDRESS).isAllowed(
                euint32.unwrap(ctHash),
                account
            );
    }

    function isAllowed(
        euint64 ctHash,
        address account
    ) internal returns (bool) {
        return
            ITaskManager(TASK_MANAGER_ADDRESS).isAllowed(
                euint64.unwrap(ctHash),
                account
            );
    }

    function isAllowed(
        euint128 ctHash,
        address account
    ) internal returns (bool) {
        return
            ITaskManager(TASK_MANAGER_ADDRESS).isAllowed(
                euint128.unwrap(ctHash),
                account
            );
    }

    function isAllowed(
        euint256 ctHash,
        address account
    ) internal returns (bool) {
        return
            ITaskManager(TASK_MANAGER_ADDRESS).isAllowed(
                euint256.unwrap(ctHash),
                account
            );
    }

    function isAllowed(
        eaddress ctHash,
        address account
    ) internal returns (bool) {
        return
            ITaskManager(TASK_MANAGER_ADDRESS).isAllowed(
                eaddress.unwrap(ctHash),
                account
            );
    }

    function allowThis(ebool ctHash) internal {
        ITaskManager(TASK_MANAGER_ADDRESS).allow(
            ebool.unwrap(ctHash),
            address(this)
        );
    }

    function allowThis(euint8 ctHash) internal {
        ITaskManager(TASK_MANAGER_ADDRESS).allow(
            euint8.unwrap(ctHash),
            address(this)
        );
    }

    function allowThis(euint16 ctHash) internal {
        ITaskManager(TASK_MANAGER_ADDRESS).allow(
            euint16.unwrap(ctHash),
            address(this)
        );
    }

    function allowThis(euint32 ctHash) internal {
        ITaskManager(TASK_MANAGER_ADDRESS).allow(
            euint32.unwrap(ctHash),
            address(this)
        );
    }

    function allowThis(euint64 ctHash) internal {
        ITaskManager(TASK_MANAGER_ADDRESS).allow(
            euint64.unwrap(ctHash),
            address(this)
        );
    }

    function allowThis(euint128 ctHash) internal {
        ITaskManager(TASK_MANAGER_ADDRESS).allow(
            euint128.unwrap(ctHash),
            address(this)
        );
    }

    function allowThis(euint256 ctHash) internal {
        ITaskManager(TASK_MANAGER_ADDRESS).allow(
            euint256.unwrap(ctHash),
            address(this)
        );
    }

    function allowThis(eaddress ctHash) internal {
        ITaskManager(TASK_MANAGER_ADDRESS).allow(
            eaddress.unwrap(ctHash),
            address(this)
        );
    }

    function allowGlobal(ebool ctHash) internal {
        ITaskManager(TASK_MANAGER_ADDRESS).allow(
            ebool.unwrap(ctHash),
            msg.sender
        );
    }

    function allowGlobal(euint8 ctHash) internal {
        ITaskManager(TASK_MANAGER_ADDRESS).allow(
            euint8.unwrap(ctHash),
            msg.sender
        );
    }

    function allowGlobal(euint16 ctHash) internal {
        ITaskManager(TASK_MANAGER_ADDRESS).allow(
            euint16.unwrap(ctHash),
            msg.sender
        );
    }

    function allowGlobal(euint32 ctHash) internal {
        ITaskManager(TASK_MANAGER_ADDRESS).allow(
            euint32.unwrap(ctHash),
            msg.sender
        );
    }

    function allowGlobal(euint64 ctHash) internal {
        ITaskManager(TASK_MANAGER_ADDRESS).allow(
            euint64.unwrap(ctHash),
            msg.sender
        );
    }

    function allowGlobal(euint128 ctHash) internal {
        ITaskManager(TASK_MANAGER_ADDRESS).allow(
            euint128.unwrap(ctHash),
            msg.sender
        );
    }

    function allowGlobal(euint256 ctHash) internal {
        ITaskManager(TASK_MANAGER_ADDRESS).allow(
            euint256.unwrap(ctHash),
            msg.sender
        );
    }

    function allowGlobal(eaddress ctHash) internal {
        ITaskManager(TASK_MANAGER_ADDRESS).allow(
            eaddress.unwrap(ctHash),
            msg.sender
        );
    }

    function allowSender(ebool ctHash) internal {
        ITaskManager(TASK_MANAGER_ADDRESS).allow(
            ebool.unwrap(ctHash),
            msg.sender
        );
    }

    function allowSender(euint8 ctHash) internal {
        ITaskManager(TASK_MANAGER_ADDRESS).allow(
            euint8.unwrap(ctHash),
            msg.sender
        );
    }

    function allowSender(euint16 ctHash) internal {
        ITaskManager(TASK_MANAGER_ADDRESS).allow(
            euint16.unwrap(ctHash),
            msg.sender
        );
    }

    function allowSender(euint32 ctHash) internal {
        ITaskManager(TASK_MANAGER_ADDRESS).allow(
            euint32.unwrap(ctHash),
            msg.sender
        );
    }

    function allowSender(euint64 ctHash) internal {
        ITaskManager(TASK_MANAGER_ADDRESS).allow(
            euint64.unwrap(ctHash),
            msg.sender
        );
    }

    function allowSender(euint128 ctHash) internal {
        ITaskManager(TASK_MANAGER_ADDRESS).allow(
            euint128.unwrap(ctHash),
            msg.sender
        );
    }

    function allowSender(euint256 ctHash) internal {
        ITaskManager(TASK_MANAGER_ADDRESS).allow(
            euint256.unwrap(ctHash),
            msg.sender
        );
    }

    function allowSender(eaddress ctHash) internal {
        ITaskManager(TASK_MANAGER_ADDRESS).allow(
            eaddress.unwrap(ctHash),
            msg.sender
        );
    }

    function allowTransient(ebool ctHash, address account) internal {
        ITaskManager(TASK_MANAGER_ADDRESS).allowTransient(
            ebool.unwrap(ctHash),
            account
        );
    }

    function allowTransient(euint8 ctHash, address account) internal {
        ITaskManager(TASK_MANAGER_ADDRESS).allowTransient(
            euint8.unwrap(ctHash),
            account
        );
    }

    function allowTransient(euint16 ctHash, address account) internal {
        ITaskManager(TASK_MANAGER_ADDRESS).allowTransient(
            euint16.unwrap(ctHash),
            account
        );
    }

    function allowTransient(euint32 ctHash, address account) internal {
        ITaskManager(TASK_MANAGER_ADDRESS).allowTransient(
            euint32.unwrap(ctHash),
            account
        );
    }

    function allowTransient(euint64 ctHash, address account) internal {
        ITaskManager(TASK_MANAGER_ADDRESS).allowTransient(
            euint64.unwrap(ctHash),
            account
        );
    }

    function allowTransient(euint128 ctHash, address account) internal {
        ITaskManager(TASK_MANAGER_ADDRESS).allowTransient(
            euint128.unwrap(ctHash),
            account
        );
    }

    function allowTransient(euint256 ctHash, address account) internal {
        ITaskManager(TASK_MANAGER_ADDRESS).allowTransient(
            euint256.unwrap(ctHash),
            account
        );
    }

    function allowTransient(eaddress ctHash, address account) internal {
        ITaskManager(TASK_MANAGER_ADDRESS).allowTransient(
            eaddress.unwrap(ctHash),
            account
        );
    }
}
// ********** BINDING DEFS ************* //

using BindingsEbool for ebool global;
library BindingsEbool {
    /// @notice Performs the eq operation
    /// @dev Pure in this function is marked as a hack/workaround - note that this function is NOT pure as fetches of ciphertexts require state access
    /// @param lhs input of type ebool
    /// @param rhs second input of type ebool
    /// @return the result of the eq
    function eq(ebool lhs, ebool rhs) internal returns (ebool) {
        return FHE.eq(lhs, rhs);
    }

    /// @notice Performs the ne operation
    /// @dev Pure in this function is marked as a hack/workaround - note that this function is NOT pure as fetches of ciphertexts require state access
    /// @param lhs input of type ebool
    /// @param rhs second input of type ebool
    /// @return the result of the ne
    function ne(ebool lhs, ebool rhs) internal returns (ebool) {
        return FHE.ne(lhs, rhs);
    }

    /// @notice Performs the not operation
    /// @dev Pure in this function is marked as a hack/workaround - note that this function is NOT pure as fetches of ciphertexts require state access
    /// @param lhs input of type ebool
    /// @return the result of the not
    function not(ebool lhs) internal returns (ebool) {
        return FHE.not(lhs);
    }

    /// @notice Performs the and operation
    /// @dev Pure in this function is marked as a hack/workaround - note that this function is NOT pure as fetches of ciphertexts require state access
    /// @param lhs input of type ebool
    /// @param rhs second input of type ebool
    /// @return the result of the and
    function and(ebool lhs, ebool rhs) internal returns (ebool) {
        return FHE.and(lhs, rhs);
    }

    /// @notice Performs the or operation
    /// @dev Pure in this function is marked as a hack/workaround - note that this function is NOT pure as fetches of ciphertexts require state access
    /// @param lhs input of type ebool
    /// @param rhs second input of type ebool
    /// @return the result of the or
    function or(ebool lhs, ebool rhs) internal returns (ebool) {
        return FHE.or(lhs, rhs);
    }

    /// @notice Performs the xor operation
    /// @dev Pure in this function is marked as a hack/workaround - note that this function is NOT pure as fetches of ciphertexts require state access
    /// @param lhs input of type ebool
    /// @param rhs second input of type ebool
    /// @return the result of the xor
    function xor(ebool lhs, ebool rhs) internal returns (ebool) {
        return FHE.xor(lhs, rhs);
    }
    function toU8(ebool value) internal returns (euint8) {
        return FHE.asEuint8(value);
    }
    function toU16(ebool value) internal returns (euint16) {
        return FHE.asEuint16(value);
    }
    function toU32(ebool value) internal returns (euint32) {
        return FHE.asEuint32(value);
    }
    function toU64(ebool value) internal returns (euint64) {
        return FHE.asEuint64(value);
    }
    function toU128(ebool value) internal returns (euint128) {
        return FHE.asEuint128(value);
    }
    function toU256(ebool value) internal returns (euint256) {
        return FHE.asEuint256(value);
    }
    function decrypt(ebool value) internal returns (ebool) {
        return FHE.decrypt(value);
    }
    function getDecryptResult(ebool value) internal view returns (bool) {
        return FHE.getDecryptResult(value);
    }
    function getDecryptResultSafe(
        ebool value
    ) internal view returns (bool result, bool decrypted) {
        return FHE.getDecryptResultSafe(value);
    }
    function allow(ebool ctHash, address account) internal {
        FHE.allow(ctHash, account);
    }
    function isAllowed(ebool ctHash, address account) internal returns (bool) {
        return FHE.isAllowed(ctHash, account);
    }
    function allowThis(ebool ctHash) internal {
        FHE.allowThis(ctHash);
    }
    function allowGlobal(ebool ctHash) internal {
        FHE.allowGlobal(ctHash);
    }
    function allowSender(ebool ctHash) internal {
        FHE.allowSender(ctHash);
    }
    function allowTransient(ebool ctHash, address account) internal {
        FHE.allowTransient(ctHash, account);
    }
}

using BindingsEuint8 for euint8 global;
library BindingsEuint8 {
    /// @notice Performs the add operation
    /// @dev Pure in this function is marked as a hack/workaround - note that this function is NOT pure as fetches of ciphertexts require state access
    /// @param lhs input of type euint8
    /// @param rhs second input of type euint8
    /// @return the result of the add
    function add(euint8 lhs, euint8 rhs) internal returns (euint8) {
        return FHE.add(lhs, rhs);
    }

    /// @notice Performs the mul operation
    /// @dev Pure in this function is marked as a hack/workaround - note that this function is NOT pure as fetches of ciphertexts require state access
    /// @param lhs input of type euint8
    /// @param rhs second input of type euint8
    /// @return the result of the mul
    function mul(euint8 lhs, euint8 rhs) internal returns (euint8) {
        return FHE.mul(lhs, rhs);
    }

    /// @notice Performs the div operation
    /// @dev Pure in this function is marked as a hack/workaround - note that this function is NOT pure as fetches of ciphertexts require state access
    /// @param lhs input of type euint8
    /// @param rhs second input of type euint8
    /// @return the result of the div
    function div(euint8 lhs, euint8 rhs) internal returns (euint8) {
        return FHE.div(lhs, rhs);
    }

    /// @notice Performs the sub operation
    /// @dev Pure in this function is marked as a hack/workaround - note that this function is NOT pure as fetches of ciphertexts require state access
    /// @param lhs input of type euint8
    /// @param rhs second input of type euint8
    /// @return the result of the sub
    function sub(euint8 lhs, euint8 rhs) internal returns (euint8) {
        return FHE.sub(lhs, rhs);
    }

    /// @notice Performs the eq operation
    /// @dev Pure in this function is marked as a hack/workaround - note that this function is NOT pure as fetches of ciphertexts require state access
    /// @param lhs input of type euint8
    /// @param rhs second input of type euint8
    /// @return the result of the eq
    function eq(euint8 lhs, euint8 rhs) internal returns (ebool) {
        return FHE.eq(lhs, rhs);
    }

    /// @notice Performs the ne operation
    /// @dev Pure in this function is marked as a hack/workaround - note that this function is NOT pure as fetches of ciphertexts require state access
    /// @param lhs input of type euint8
    /// @param rhs second input of type euint8
    /// @return the result of the ne
    function ne(euint8 lhs, euint8 rhs) internal returns (ebool) {
        return FHE.ne(lhs, rhs);
    }

    /// @notice Performs the not operation
    /// @dev Pure in this function is marked as a hack/workaround - note that this function is NOT pure as fetches of ciphertexts require state access
    /// @param lhs input of type euint8
    /// @return the result of the not
    function not(euint8 lhs) internal returns (euint8) {
        return FHE.not(lhs);
    }

    /// @notice Performs the and operation
    /// @dev Pure in this function is marked as a hack/workaround - note that this function is NOT pure as fetches of ciphertexts require state access
    /// @param lhs input of type euint8
    /// @param rhs second input of type euint8
    /// @return the result of the and
    function and(euint8 lhs, euint8 rhs) internal returns (euint8) {
        return FHE.and(lhs, rhs);
    }

    /// @notice Performs the or operation
    /// @dev Pure in this function is marked as a hack/workaround - note that this function is NOT pure as fetches of ciphertexts require state access
    /// @param lhs input of type euint8
    /// @param rhs second input of type euint8
    /// @return the result of the or
    function or(euint8 lhs, euint8 rhs) internal returns (euint8) {
        return FHE.or(lhs, rhs);
    }

    /// @notice Performs the xor operation
    /// @dev Pure in this function is marked as a hack/workaround - note that this function is NOT pure as fetches of ciphertexts require state access
    /// @param lhs input of type euint8
    /// @param rhs second input of type euint8
    /// @return the result of the xor
    function xor(euint8 lhs, euint8 rhs) internal returns (euint8) {
        return FHE.xor(lhs, rhs);
    }

    /// @notice Performs the gt operation
    /// @dev Pure in this function is marked as a hack/workaround - note that this function is NOT pure as fetches of ciphertexts require state access
    /// @param lhs input of type euint8
    /// @param rhs second input of type euint8
    /// @return the result of the gt
    function gt(euint8 lhs, euint8 rhs) internal returns (ebool) {
        return FHE.gt(lhs, rhs);
    }

    /// @notice Performs the gte operation
    /// @dev Pure in this function is marked as a hack/workaround - note that this function is NOT pure as fetches of ciphertexts require state access
    /// @param lhs input of type euint8
    /// @param rhs second input of type euint8
    /// @return the result of the gte
    function gte(euint8 lhs, euint8 rhs) internal returns (ebool) {
        return FHE.gte(lhs, rhs);
    }

    /// @notice Performs the lt operation
    /// @dev Pure in this function is marked as a hack/workaround - note that this function is NOT pure as fetches of ciphertexts require state access
    /// @param lhs input of type euint8
    /// @param rhs second input of type euint8
    /// @return the result of the lt
    function lt(euint8 lhs, euint8 rhs) internal returns (ebool) {
        return FHE.lt(lhs, rhs);
    }

    /// @notice Performs the lte operation
    /// @dev Pure in this function is marked as a hack/workaround - note that this function is NOT pure as fetches of ciphertexts require state access
    /// @param lhs input of type euint8
    /// @param rhs second input of type euint8
    /// @return the result of the lte
    function lte(euint8 lhs, euint8 rhs) internal returns (ebool) {
        return FHE.lte(lhs, rhs);
    }

    /// @notice Performs the rem operation
    /// @dev Pure in this function is marked as a hack/workaround - note that this function is NOT pure as fetches of ciphertexts require state access
    /// @param lhs input of type euint8
    /// @param rhs second input of type euint8
    /// @return the result of the rem
    function rem(euint8 lhs, euint8 rhs) internal returns (euint8) {
        return FHE.rem(lhs, rhs);
    }

    /// @notice Performs the max operation
    /// @dev Pure in this function is marked as a hack/workaround - note that this function is NOT pure as fetches of ciphertexts require state access
    /// @param lhs input of type euint8
    /// @param rhs second input of type euint8
    /// @return the result of the max
    function max(euint8 lhs, euint8 rhs) internal returns (euint8) {
        return FHE.max(lhs, rhs);
    }

    /// @notice Performs the min operation
    /// @dev Pure in this function is marked as a hack/workaround - note that this function is NOT pure as fetches of ciphertexts require state access
    /// @param lhs input of type euint8
    /// @param rhs second input of type euint8
    /// @return the result of the min
    function min(euint8 lhs, euint8 rhs) internal returns (euint8) {
        return FHE.min(lhs, rhs);
    }

    /// @notice Performs the shl operation
    /// @dev Pure in this function is marked as a hack/workaround - note that this function is NOT pure as fetches of ciphertexts require state access
    /// @param lhs input of type euint8
    /// @param rhs second input of type euint8
    /// @return the result of the shl
    function shl(euint8 lhs, euint8 rhs) internal returns (euint8) {
        return FHE.shl(lhs, rhs);
    }

    /// @notice Performs the shr operation
    /// @dev Pure in this function is marked as a hack/workaround - note that this function is NOT pure as fetches of ciphertexts require state access
    /// @param lhs input of type euint8
    /// @param rhs second input of type euint8
    /// @return the result of the shr
    function shr(euint8 lhs, euint8 rhs) internal returns (euint8) {
        return FHE.shr(lhs, rhs);
    }

    /// @notice Performs the rol operation
    /// @dev Pure in this function is marked as a hack/workaround - note that this function is NOT pure as fetches of ciphertexts require state access
    /// @param lhs input of type euint8
    /// @param rhs second input of type euint8
    /// @return the result of the rol
    function rol(euint8 lhs, euint8 rhs) internal returns (euint8) {
        return FHE.rol(lhs, rhs);
    }

    /// @notice Performs the ror operation
    /// @dev Pure in this function is marked as a hack/workaround - note that this function is NOT pure as fetches of ciphertexts require state access
    /// @param lhs input of type euint8
    /// @param rhs second input of type euint8
    /// @return the result of the ror
    function ror(euint8 lhs, euint8 rhs) internal returns (euint8) {
        return FHE.ror(lhs, rhs);
    }

    /// @notice Performs the square operation
    /// @dev Pure in this function is marked as a hack/workaround - note that this function is NOT pure as fetches of ciphertexts require state access
    /// @param lhs input of type euint8
    /// @return the result of the square
    function square(euint8 lhs) internal returns (euint8) {
        return FHE.square(lhs);
    }
    function toBool(euint8 value) internal returns (ebool) {
        return FHE.asEbool(value);
    }
    function toU16(euint8 value) internal returns (euint16) {
        return FHE.asEuint16(value);
    }
    function toU32(euint8 value) internal returns (euint32) {
        return FHE.asEuint32(value);
    }
    function toU64(euint8 value) internal returns (euint64) {
        return FHE.asEuint64(value);
    }
    function toU128(euint8 value) internal returns (euint128) {
        return FHE.asEuint128(value);
    }
    function toU256(euint8 value) internal returns (euint256) {
        return FHE.asEuint256(value);
    }
    function decrypt(euint8 value) internal returns (euint8) {
        return FHE.decrypt(value);
    }
    function getDecryptResult(euint8 value) internal view returns (uint8) {
        return FHE.getDecryptResult(value);
    }
    function getDecryptResultSafe(
        euint8 value
    ) internal view returns (uint8 result, bool decrypted) {
        return FHE.getDecryptResultSafe(value);
    }
    function allow(euint8 ctHash, address account) internal {
        FHE.allow(ctHash, account);
    }
    function isAllowed(euint8 ctHash, address account) internal returns (bool) {
        return FHE.isAllowed(ctHash, account);
    }
    function allowThis(euint8 ctHash) internal {
        FHE.allowThis(ctHash);
    }
    function allowGlobal(euint8 ctHash) internal {
        FHE.allowGlobal(ctHash);
    }
    function allowSender(euint8 ctHash) internal {
        FHE.allowSender(ctHash);
    }
    function allowTransient(euint8 ctHash, address account) internal {
        FHE.allowTransient(ctHash, account);
    }
}

using BindingsEuint16 for euint16 global;
library BindingsEuint16 {
    /// @notice Performs the add operation
    /// @dev Pure in this function is marked as a hack/workaround - note that this function is NOT pure as fetches of ciphertexts require state access
    /// @param lhs input of type euint16
    /// @param rhs second input of type euint16
    /// @return the result of the add
    function add(euint16 lhs, euint16 rhs) internal returns (euint16) {
        return FHE.add(lhs, rhs);
    }

    /// @notice Performs the mul operation
    /// @dev Pure in this function is marked as a hack/workaround - note that this function is NOT pure as fetches of ciphertexts require state access
    /// @param lhs input of type euint16
    /// @param rhs second input of type euint16
    /// @return the result of the mul
    function mul(euint16 lhs, euint16 rhs) internal returns (euint16) {
        return FHE.mul(lhs, rhs);
    }

    /// @notice Performs the div operation
    /// @dev Pure in this function is marked as a hack/workaround - note that this function is NOT pure as fetches of ciphertexts require state access
    /// @param lhs input of type euint16
    /// @param rhs second input of type euint16
    /// @return the result of the div
    function div(euint16 lhs, euint16 rhs) internal returns (euint16) {
        return FHE.div(lhs, rhs);
    }

    /// @notice Performs the sub operation
    /// @dev Pure in this function is marked as a hack/workaround - note that this function is NOT pure as fetches of ciphertexts require state access
    /// @param lhs input of type euint16
    /// @param rhs second input of type euint16
    /// @return the result of the sub
    function sub(euint16 lhs, euint16 rhs) internal returns (euint16) {
        return FHE.sub(lhs, rhs);
    }

    /// @notice Performs the eq operation
    /// @dev Pure in this function is marked as a hack/workaround - note that this function is NOT pure as fetches of ciphertexts require state access
    /// @param lhs input of type euint16
    /// @param rhs second input of type euint16
    /// @return the result of the eq
    function eq(euint16 lhs, euint16 rhs) internal returns (ebool) {
        return FHE.eq(lhs, rhs);
    }

    /// @notice Performs the ne operation
    /// @dev Pure in this function is marked as a hack/workaround - note that this function is NOT pure as fetches of ciphertexts require state access
    /// @param lhs input of type euint16
    /// @param rhs second input of type euint16
    /// @return the result of the ne
    function ne(euint16 lhs, euint16 rhs) internal returns (ebool) {
        return FHE.ne(lhs, rhs);
    }

    /// @notice Performs the not operation
    /// @dev Pure in this function is marked as a hack/workaround - note that this function is NOT pure as fetches of ciphertexts require state access
    /// @param lhs input of type euint16
    /// @return the result of the not
    function not(euint16 lhs) internal returns (euint16) {
        return FHE.not(lhs);
    }

    /// @notice Performs the and operation
    /// @dev Pure in this function is marked as a hack/workaround - note that this function is NOT pure as fetches of ciphertexts require state access
    /// @param lhs input of type euint16
    /// @param rhs second input of type euint16
    /// @return the result of the and
    function and(euint16 lhs, euint16 rhs) internal returns (euint16) {
        return FHE.and(lhs, rhs);
    }

    /// @notice Performs the or operation
    /// @dev Pure in this function is marked as a hack/workaround - note that this function is NOT pure as fetches of ciphertexts require state access
    /// @param lhs input of type euint16
    /// @param rhs second input of type euint16
    /// @return the result of the or
    function or(euint16 lhs, euint16 rhs) internal returns (euint16) {
        return FHE.or(lhs, rhs);
    }

    /// @notice Performs the xor operation
    /// @dev Pure in this function is marked as a hack/workaround - note that this function is NOT pure as fetches of ciphertexts require state access
    /// @param lhs input of type euint16
    /// @param rhs second input of type euint16
    /// @return the result of the xor
    function xor(euint16 lhs, euint16 rhs) internal returns (euint16) {
        return FHE.xor(lhs, rhs);
    }

    /// @notice Performs the gt operation
    /// @dev Pure in this function is marked as a hack/workaround - note that this function is NOT pure as fetches of ciphertexts require state access
    /// @param lhs input of type euint16
    /// @param rhs second input of type euint16
    /// @return the result of the gt
    function gt(euint16 lhs, euint16 rhs) internal returns (ebool) {
        return FHE.gt(lhs, rhs);
    }

    /// @notice Performs the gte operation
    /// @dev Pure in this function is marked as a hack/workaround - note that this function is NOT pure as fetches of ciphertexts require state access
    /// @param lhs input of type euint16
    /// @param rhs second input of type euint16
    /// @return the result of the gte
    function gte(euint16 lhs, euint16 rhs) internal returns (ebool) {
        return FHE.gte(lhs, rhs);
    }

    /// @notice Performs the lt operation
    /// @dev Pure in this function is marked as a hack/workaround - note that this function is NOT pure as fetches of ciphertexts require state access
    /// @param lhs input of type euint16
    /// @param rhs second input of type euint16
    /// @return the result of the lt
    function lt(euint16 lhs, euint16 rhs) internal returns (ebool) {
        return FHE.lt(lhs, rhs);
    }

    /// @notice Performs the lte operation
    /// @dev Pure in this function is marked as a hack/workaround - note that this function is NOT pure as fetches of ciphertexts require state access
    /// @param lhs input of type euint16
    /// @param rhs second input of type euint16
    /// @return the result of the lte
    function lte(euint16 lhs, euint16 rhs) internal returns (ebool) {
        return FHE.lte(lhs, rhs);
    }

    /// @notice Performs the rem operation
    /// @dev Pure in this function is marked as a hack/workaround - note that this function is NOT pure as fetches of ciphertexts require state access
    /// @param lhs input of type euint16
    /// @param rhs second input of type euint16
    /// @return the result of the rem
    function rem(euint16 lhs, euint16 rhs) internal returns (euint16) {
        return FHE.rem(lhs, rhs);
    }

    /// @notice Performs the max operation
    /// @dev Pure in this function is marked as a hack/workaround - note that this function is NOT pure as fetches of ciphertexts require state access
    /// @param lhs input of type euint16
    /// @param rhs second input of type euint16
    /// @return the result of the max
    function max(euint16 lhs, euint16 rhs) internal returns (euint16) {
        return FHE.max(lhs, rhs);
    }

    /// @notice Performs the min operation
    /// @dev Pure in this function is marked as a hack/workaround - note that this function is NOT pure as fetches of ciphertexts require state access
    /// @param lhs input of type euint16
    /// @param rhs second input of type euint16
    /// @return the result of the min
    function min(euint16 lhs, euint16 rhs) internal returns (euint16) {
        return FHE.min(lhs, rhs);
    }

    /// @notice Performs the shl operation
    /// @dev Pure in this function is marked as a hack/workaround - note that this function is NOT pure as fetches of ciphertexts require state access
    /// @param lhs input of type euint16
    /// @param rhs second input of type euint16
    /// @return the result of the shl
    function shl(euint16 lhs, euint16 rhs) internal returns (euint16) {
        return FHE.shl(lhs, rhs);
    }

    /// @notice Performs the shr operation
    /// @dev Pure in this function is marked as a hack/workaround - note that this function is NOT pure as fetches of ciphertexts require state access
    /// @param lhs input of type euint16
    /// @param rhs second input of type euint16
    /// @return the result of the shr
    function shr(euint16 lhs, euint16 rhs) internal returns (euint16) {
        return FHE.shr(lhs, rhs);
    }

    /// @notice Performs the rol operation
    /// @dev Pure in this function is marked as a hack/workaround - note that this function is NOT pure as fetches of ciphertexts require state access
    /// @param lhs input of type euint16
    /// @param rhs second input of type euint16
    /// @return the result of the rol
    function rol(euint16 lhs, euint16 rhs) internal returns (euint16) {
        return FHE.rol(lhs, rhs);
    }

    /// @notice Performs the ror operation
    /// @dev Pure in this function is marked as a hack/workaround - note that this function is NOT pure as fetches of ciphertexts require state access
    /// @param lhs input of type euint16
    /// @param rhs second input of type euint16
    /// @return the result of the ror
    function ror(euint16 lhs, euint16 rhs) internal returns (euint16) {
        return FHE.ror(lhs, rhs);
    }

    /// @notice Performs the square operation
    /// @dev Pure in this function is marked as a hack/workaround - note that this function is NOT pure as fetches of ciphertexts require state access
    /// @param lhs input of type euint16
    /// @return the result of the square
    function square(euint16 lhs) internal returns (euint16) {
        return FHE.square(lhs);
    }
    function toBool(euint16 value) internal returns (ebool) {
        return FHE.asEbool(value);
    }
    function toU8(euint16 value) internal returns (euint8) {
        return FHE.asEuint8(value);
    }
    function toU32(euint16 value) internal returns (euint32) {
        return FHE.asEuint32(value);
    }
    function toU64(euint16 value) internal returns (euint64) {
        return FHE.asEuint64(value);
    }
    function toU128(euint16 value) internal returns (euint128) {
        return FHE.asEuint128(value);
    }
    function toU256(euint16 value) internal returns (euint256) {
        return FHE.asEuint256(value);
    }
    function decrypt(euint16 value) internal returns (euint16) {
        return FHE.decrypt(value);
    }
    function getDecryptResult(euint16 value) internal view returns (uint16) {
        return FHE.getDecryptResult(value);
    }
    function getDecryptResultSafe(
        euint16 value
    ) internal view returns (uint16 result, bool decrypted) {
        return FHE.getDecryptResultSafe(value);
    }
    function allow(euint16 ctHash, address account) internal {
        FHE.allow(ctHash, account);
    }
    function isAllowed(
        euint16 ctHash,
        address account
    ) internal returns (bool) {
        return FHE.isAllowed(ctHash, account);
    }
    function allowThis(euint16 ctHash) internal {
        FHE.allowThis(ctHash);
    }
    function allowGlobal(euint16 ctHash) internal {
        FHE.allowGlobal(ctHash);
    }
    function allowSender(euint16 ctHash) internal {
        FHE.allowSender(ctHash);
    }
    function allowTransient(euint16 ctHash, address account) internal {
        FHE.allowTransient(ctHash, account);
    }
}

using BindingsEuint32 for euint32 global;
library BindingsEuint32 {
    /// @notice Performs the add operation
    /// @dev Pure in this function is marked as a hack/workaround - note that this function is NOT pure as fetches of ciphertexts require state access
    /// @param lhs input of type euint32
    /// @param rhs second input of type euint32
    /// @return the result of the add
    function add(euint32 lhs, euint32 rhs) internal returns (euint32) {
        return FHE.add(lhs, rhs);
    }

    /// @notice Performs the mul operation
    /// @dev Pure in this function is marked as a hack/workaround - note that this function is NOT pure as fetches of ciphertexts require state access
    /// @param lhs input of type euint32
    /// @param rhs second input of type euint32
    /// @return the result of the mul
    function mul(euint32 lhs, euint32 rhs) internal returns (euint32) {
        return FHE.mul(lhs, rhs);
    }

    /// @notice Performs the div operation
    /// @dev Pure in this function is marked as a hack/workaround - note that this function is NOT pure as fetches of ciphertexts require state access
    /// @param lhs input of type euint32
    /// @param rhs second input of type euint32
    /// @return the result of the div
    function div(euint32 lhs, euint32 rhs) internal returns (euint32) {
        return FHE.div(lhs, rhs);
    }

    /// @notice Performs the sub operation
    /// @dev Pure in this function is marked as a hack/workaround - note that this function is NOT pure as fetches of ciphertexts require state access
    /// @param lhs input of type euint32
    /// @param rhs second input of type euint32
    /// @return the result of the sub
    function sub(euint32 lhs, euint32 rhs) internal returns (euint32) {
        return FHE.sub(lhs, rhs);
    }

    /// @notice Performs the eq operation
    /// @dev Pure in this function is marked as a hack/workaround - note that this function is NOT pure as fetches of ciphertexts require state access
    /// @param lhs input of type euint32
    /// @param rhs second input of type euint32
    /// @return the result of the eq
    function eq(euint32 lhs, euint32 rhs) internal returns (ebool) {
        return FHE.eq(lhs, rhs);
    }

    /// @notice Performs the ne operation
    /// @dev Pure in this function is marked as a hack/workaround - note that this function is NOT pure as fetches of ciphertexts require state access
    /// @param lhs input of type euint32
    /// @param rhs second input of type euint32
    /// @return the result of the ne
    function ne(euint32 lhs, euint32 rhs) internal returns (ebool) {
        return FHE.ne(lhs, rhs);
    }

    /// @notice Performs the not operation
    /// @dev Pure in this function is marked as a hack/workaround - note that this function is NOT pure as fetches of ciphertexts require state access
    /// @param lhs input of type euint32
    /// @return the result of the not
    function not(euint32 lhs) internal returns (euint32) {
        return FHE.not(lhs);
    }

    /// @notice Performs the and operation
    /// @dev Pure in this function is marked as a hack/workaround - note that this function is NOT pure as fetches of ciphertexts require state access
    /// @param lhs input of type euint32
    /// @param rhs second input of type euint32
    /// @return the result of the and
    function and(euint32 lhs, euint32 rhs) internal returns (euint32) {
        return FHE.and(lhs, rhs);
    }

    /// @notice Performs the or operation
    /// @dev Pure in this function is marked as a hack/workaround - note that this function is NOT pure as fetches of ciphertexts require state access
    /// @param lhs input of type euint32
    /// @param rhs second input of type euint32
    /// @return the result of the or
    function or(euint32 lhs, euint32 rhs) internal returns (euint32) {
        return FHE.or(lhs, rhs);
    }

    /// @notice Performs the xor operation
    /// @dev Pure in this function is marked as a hack/workaround - note that this function is NOT pure as fetches of ciphertexts require state access
    /// @param lhs input of type euint32
    /// @param rhs second input of type euint32
    /// @return the result of the xor
    function xor(euint32 lhs, euint32 rhs) internal returns (euint32) {
        return FHE.xor(lhs, rhs);
    }

    /// @notice Performs the gt operation
    /// @dev Pure in this function is marked as a hack/workaround - note that this function is NOT pure as fetches of ciphertexts require state access
    /// @param lhs input of type euint32
    /// @param rhs second input of type euint32
    /// @return the result of the gt
    function gt(euint32 lhs, euint32 rhs) internal returns (ebool) {
        return FHE.gt(lhs, rhs);
    }

    /// @notice Performs the gte operation
    /// @dev Pure in this function is marked as a hack/workaround - note that this function is NOT pure as fetches of ciphertexts require state access
    /// @param lhs input of type euint32
    /// @param rhs second input of type euint32
    /// @return the result of the gte
    function gte(euint32 lhs, euint32 rhs) internal returns (ebool) {
        return FHE.gte(lhs, rhs);
    }

    /// @notice Performs the lt operation
    /// @dev Pure in this function is marked as a hack/workaround - note that this function is NOT pure as fetches of ciphertexts require state access
    /// @param lhs input of type euint32
    /// @param rhs second input of type euint32
    /// @return the result of the lt
    function lt(euint32 lhs, euint32 rhs) internal returns (ebool) {
        return FHE.lt(lhs, rhs);
    }

    /// @notice Performs the lte operation
    /// @dev Pure in this function is marked as a hack/workaround - note that this function is NOT pure as fetches of ciphertexts require state access
    /// @param lhs input of type euint32
    /// @param rhs second input of type euint32
    /// @return the result of the lte
    function lte(euint32 lhs, euint32 rhs) internal returns (ebool) {
        return FHE.lte(lhs, rhs);
    }

    /// @notice Performs the rem operation
    /// @dev Pure in this function is marked as a hack/workaround - note that this function is NOT pure as fetches of ciphertexts require state access
    /// @param lhs input of type euint32
    /// @param rhs second input of type euint32
    /// @return the result of the rem
    function rem(euint32 lhs, euint32 rhs) internal returns (euint32) {
        return FHE.rem(lhs, rhs);
    }

    /// @notice Performs the max operation
    /// @dev Pure in this function is marked as a hack/workaround - note that this function is NOT pure as fetches of ciphertexts require state access
    /// @param lhs input of type euint32
    /// @param rhs second input of type euint32
    /// @return the result of the max
    function max(euint32 lhs, euint32 rhs) internal returns (euint32) {
        return FHE.max(lhs, rhs);
    }

    /// @notice Performs the min operation
    /// @dev Pure in this function is marked as a hack/workaround - note that this function is NOT pure as fetches of ciphertexts require state access
    /// @param lhs input of type euint32
    /// @param rhs second input of type euint32
    /// @return the result of the min
    function min(euint32 lhs, euint32 rhs) internal returns (euint32) {
        return FHE.min(lhs, rhs);
    }

    /// @notice Performs the shl operation
    /// @dev Pure in this function is marked as a hack/workaround - note that this function is NOT pure as fetches of ciphertexts require state access
    /// @param lhs input of type euint32
    /// @param rhs second input of type euint32
    /// @return the result of the shl
    function shl(euint32 lhs, euint32 rhs) internal returns (euint32) {
        return FHE.shl(lhs, rhs);
    }

    /// @notice Performs the shr operation
    /// @dev Pure in this function is marked as a hack/workaround - note that this function is NOT pure as fetches of ciphertexts require state access
    /// @param lhs input of type euint32
    /// @param rhs second input of type euint32
    /// @return the result of the shr
    function shr(euint32 lhs, euint32 rhs) internal returns (euint32) {
        return FHE.shr(lhs, rhs);
    }

    /// @notice Performs the rol operation
    /// @dev Pure in this function is marked as a hack/workaround - note that this function is NOT pure as fetches of ciphertexts require state access
    /// @param lhs input of type euint32
    /// @param rhs second input of type euint32
    /// @return the result of the rol
    function rol(euint32 lhs, euint32 rhs) internal returns (euint32) {
        return FHE.rol(lhs, rhs);
    }

    /// @notice Performs the ror operation
    /// @dev Pure in this function is marked as a hack/workaround - note that this function is NOT pure as fetches of ciphertexts require state access
    /// @param lhs input of type euint32
    /// @param rhs second input of type euint32
    /// @return the result of the ror
    function ror(euint32 lhs, euint32 rhs) internal returns (euint32) {
        return FHE.ror(lhs, rhs);
    }

    /// @notice Performs the square operation
    /// @dev Pure in this function is marked as a hack/workaround - note that this function is NOT pure as fetches of ciphertexts require state access
    /// @param lhs input of type euint32
    /// @return the result of the square
    function square(euint32 lhs) internal returns (euint32) {
        return FHE.square(lhs);
    }
    function toBool(euint32 value) internal returns (ebool) {
        return FHE.asEbool(value);
    }
    function toU8(euint32 value) internal returns (euint8) {
        return FHE.asEuint8(value);
    }
    function toU16(euint32 value) internal returns (euint16) {
        return FHE.asEuint16(value);
    }
    function toU64(euint32 value) internal returns (euint64) {
        return FHE.asEuint64(value);
    }
    function toU128(euint32 value) internal returns (euint128) {
        return FHE.asEuint128(value);
    }
    function toU256(euint32 value) internal returns (euint256) {
        return FHE.asEuint256(value);
    }
    function decrypt(euint32 value) internal returns (euint32) {
        return FHE.decrypt(value);
    }
    function getDecryptResult(euint32 value) internal view returns (uint32) {
        return FHE.getDecryptResult(value);
    }
    function getDecryptResultSafe(
        euint32 value
    ) internal view returns (uint32 result, bool decrypted) {
        return FHE.getDecryptResultSafe(value);
    }
    function allow(euint32 ctHash, address account) internal {
        FHE.allow(ctHash, account);
    }
    function isAllowed(
        euint32 ctHash,
        address account
    ) internal returns (bool) {
        return FHE.isAllowed(ctHash, account);
    }
    function allowThis(euint32 ctHash) internal {
        FHE.allowThis(ctHash);
    }
    function allowGlobal(euint32 ctHash) internal {
        FHE.allowGlobal(ctHash);
    }
    function allowSender(euint32 ctHash) internal {
        FHE.allowSender(ctHash);
    }
    function allowTransient(euint32 ctHash, address account) internal {
        FHE.allowTransient(ctHash, account);
    }
}

using BindingsEuint64 for euint64 global;
library BindingsEuint64 {
    /// @notice Performs the add operation
    /// @dev Pure in this function is marked as a hack/workaround - note that this function is NOT pure as fetches of ciphertexts require state access
    /// @param lhs input of type euint64
    /// @param rhs second input of type euint64
    /// @return the result of the add
    function add(euint64 lhs, euint64 rhs) internal returns (euint64) {
        return FHE.add(lhs, rhs);
    }

    /// @notice Performs the mul operation
    /// @dev Pure in this function is marked as a hack/workaround - note that this function is NOT pure as fetches of ciphertexts require state access
    /// @param lhs input of type euint64
    /// @param rhs second input of type euint64
    /// @return the result of the mul
    function mul(euint64 lhs, euint64 rhs) internal returns (euint64) {
        return FHE.mul(lhs, rhs);
    }

    /// @notice Performs the sub operation
    /// @dev Pure in this function is marked as a hack/workaround - note that this function is NOT pure as fetches of ciphertexts require state access
    /// @param lhs input of type euint64
    /// @param rhs second input of type euint64
    /// @return the result of the sub
    function sub(euint64 lhs, euint64 rhs) internal returns (euint64) {
        return FHE.sub(lhs, rhs);
    }

    /// @notice Performs the eq operation
    /// @dev Pure in this function is marked as a hack/workaround - note that this function is NOT pure as fetches of ciphertexts require state access
    /// @param lhs input of type euint64
    /// @param rhs second input of type euint64
    /// @return the result of the eq
    function eq(euint64 lhs, euint64 rhs) internal returns (ebool) {
        return FHE.eq(lhs, rhs);
    }

    /// @notice Performs the ne operation
    /// @dev Pure in this function is marked as a hack/workaround - note that this function is NOT pure as fetches of ciphertexts require state access
    /// @param lhs input of type euint64
    /// @param rhs second input of type euint64
    /// @return the result of the ne
    function ne(euint64 lhs, euint64 rhs) internal returns (ebool) {
        return FHE.ne(lhs, rhs);
    }

    /// @notice Performs the not operation
    /// @dev Pure in this function is marked as a hack/workaround - note that this function is NOT pure as fetches of ciphertexts require state access
    /// @param lhs input of type euint64
    /// @return the result of the not
    function not(euint64 lhs) internal returns (euint64) {
        return FHE.not(lhs);
    }

    /// @notice Performs the and operation
    /// @dev Pure in this function is marked as a hack/workaround - note that this function is NOT pure as fetches of ciphertexts require state access
    /// @param lhs input of type euint64
    /// @param rhs second input of type euint64
    /// @return the result of the and
    function and(euint64 lhs, euint64 rhs) internal returns (euint64) {
        return FHE.and(lhs, rhs);
    }

    /// @notice Performs the or operation
    /// @dev Pure in this function is marked as a hack/workaround - note that this function is NOT pure as fetches of ciphertexts require state access
    /// @param lhs input of type euint64
    /// @param rhs second input of type euint64
    /// @return the result of the or
    function or(euint64 lhs, euint64 rhs) internal returns (euint64) {
        return FHE.or(lhs, rhs);
    }

    /// @notice Performs the xor operation
    /// @dev Pure in this function is marked as a hack/workaround - note that this function is NOT pure as fetches of ciphertexts require state access
    /// @param lhs input of type euint64
    /// @param rhs second input of type euint64
    /// @return the result of the xor
    function xor(euint64 lhs, euint64 rhs) internal returns (euint64) {
        return FHE.xor(lhs, rhs);
    }

    /// @notice Performs the gt operation
    /// @dev Pure in this function is marked as a hack/workaround - note that this function is NOT pure as fetches of ciphertexts require state access
    /// @param lhs input of type euint64
    /// @param rhs second input of type euint64
    /// @return the result of the gt
    function gt(euint64 lhs, euint64 rhs) internal returns (ebool) {
        return FHE.gt(lhs, rhs);
    }

    /// @notice Performs the gte operation
    /// @dev Pure in this function is marked as a hack/workaround - note that this function is NOT pure as fetches of ciphertexts require state access
    /// @param lhs input of type euint64
    /// @param rhs second input of type euint64
    /// @return the result of the gte
    function gte(euint64 lhs, euint64 rhs) internal returns (ebool) {
        return FHE.gte(lhs, rhs);
    }

    /// @notice Performs the lt operation
    /// @dev Pure in this function is marked as a hack/workaround - note that this function is NOT pure as fetches of ciphertexts require state access
    /// @param lhs input of type euint64
    /// @param rhs second input of type euint64
    /// @return the result of the lt
    function lt(euint64 lhs, euint64 rhs) internal returns (ebool) {
        return FHE.lt(lhs, rhs);
    }

    /// @notice Performs the lte operation
    /// @dev Pure in this function is marked as a hack/workaround - note that this function is NOT pure as fetches of ciphertexts require state access
    /// @param lhs input of type euint64
    /// @param rhs second input of type euint64
    /// @return the result of the lte
    function lte(euint64 lhs, euint64 rhs) internal returns (ebool) {
        return FHE.lte(lhs, rhs);
    }

    /// @notice Performs the max operation
    /// @dev Pure in this function is marked as a hack/workaround - note that this function is NOT pure as fetches of ciphertexts require state access
    /// @param lhs input of type euint64
    /// @param rhs second input of type euint64
    /// @return the result of the max
    function max(euint64 lhs, euint64 rhs) internal returns (euint64) {
        return FHE.max(lhs, rhs);
    }

    /// @notice Performs the min operation
    /// @dev Pure in this function is marked as a hack/workaround - note that this function is NOT pure as fetches of ciphertexts require state access
    /// @param lhs input of type euint64
    /// @param rhs second input of type euint64
    /// @return the result of the min
    function min(euint64 lhs, euint64 rhs) internal returns (euint64) {
        return FHE.min(lhs, rhs);
    }

    /// @notice Performs the shl operation
    /// @dev Pure in this function is marked as a hack/workaround - note that this function is NOT pure as fetches of ciphertexts require state access
    /// @param lhs input of type euint64
    /// @param rhs second input of type euint64
    /// @return the result of the shl
    function shl(euint64 lhs, euint64 rhs) internal returns (euint64) {
        return FHE.shl(lhs, rhs);
    }

    /// @notice Performs the shr operation
    /// @dev Pure in this function is marked as a hack/workaround - note that this function is NOT pure as fetches of ciphertexts require state access
    /// @param lhs input of type euint64
    /// @param rhs second input of type euint64
    /// @return the result of the shr
    function shr(euint64 lhs, euint64 rhs) internal returns (euint64) {
        return FHE.shr(lhs, rhs);
    }

    /// @notice Performs the rol operation
    /// @dev Pure in this function is marked as a hack/workaround - note that this function is NOT pure as fetches of ciphertexts require state access
    /// @param lhs input of type euint64
    /// @param rhs second input of type euint64
    /// @return the result of the rol
    function rol(euint64 lhs, euint64 rhs) internal returns (euint64) {
        return FHE.rol(lhs, rhs);
    }

    /// @notice Performs the ror operation
    /// @dev Pure in this function is marked as a hack/workaround - note that this function is NOT pure as fetches of ciphertexts require state access
    /// @param lhs input of type euint64
    /// @param rhs second input of type euint64
    /// @return the result of the ror
    function ror(euint64 lhs, euint64 rhs) internal returns (euint64) {
        return FHE.ror(lhs, rhs);
    }

    /// @notice Performs the square operation
    /// @dev Pure in this function is marked as a hack/workaround - note that this function is NOT pure as fetches of ciphertexts require state access
    /// @param lhs input of type euint64
    /// @return the result of the square
    function square(euint64 lhs) internal returns (euint64) {
        return FHE.square(lhs);
    }
    function toBool(euint64 value) internal returns (ebool) {
        return FHE.asEbool(value);
    }
    function toU8(euint64 value) internal returns (euint8) {
        return FHE.asEuint8(value);
    }
    function toU16(euint64 value) internal returns (euint16) {
        return FHE.asEuint16(value);
    }
    function toU32(euint64 value) internal returns (euint32) {
        return FHE.asEuint32(value);
    }
    function toU128(euint64 value) internal returns (euint128) {
        return FHE.asEuint128(value);
    }
    function toU256(euint64 value) internal returns (euint256) {
        return FHE.asEuint256(value);
    }
    function decrypt(euint64 value) internal returns (euint64) {
        return FHE.decrypt(value);
    }
    function getDecryptResult(euint64 value) internal view returns (uint64) {
        return FHE.getDecryptResult(value);
    }
    function getDecryptResultSafe(
        euint64 value
    ) internal view returns (uint64 result, bool decrypted) {
        return FHE.getDecryptResultSafe(value);
    }
    function allow(euint64 ctHash, address account) internal {
        FHE.allow(ctHash, account);
    }
    function isAllowed(
        euint64 ctHash,
        address account
    ) internal returns (bool) {
        return FHE.isAllowed(ctHash, account);
    }
    function allowThis(euint64 ctHash) internal {
        FHE.allowThis(ctHash);
    }
    function allowGlobal(euint64 ctHash) internal {
        FHE.allowGlobal(ctHash);
    }
    function allowSender(euint64 ctHash) internal {
        FHE.allowSender(ctHash);
    }
    function allowTransient(euint64 ctHash, address account) internal {
        FHE.allowTransient(ctHash, account);
    }
}

using BindingsEuint128 for euint128 global;
library BindingsEuint128 {
    /// @notice Performs the add operation
    /// @dev Pure in this function is marked as a hack/workaround - note that this function is NOT pure as fetches of ciphertexts require state access
    /// @param lhs input of type euint128
    /// @param rhs second input of type euint128
    /// @return the result of the add
    function add(euint128 lhs, euint128 rhs) internal returns (euint128) {
        return FHE.add(lhs, rhs);
    }

    /// @notice Performs the sub operation
    /// @dev Pure in this function is marked as a hack/workaround - note that this function is NOT pure as fetches of ciphertexts require state access
    /// @param lhs input of type euint128
    /// @param rhs second input of type euint128
    /// @return the result of the sub
    function sub(euint128 lhs, euint128 rhs) internal returns (euint128) {
        return FHE.sub(lhs, rhs);
    }

    /// @notice Performs the eq operation
    /// @dev Pure in this function is marked as a hack/workaround - note that this function is NOT pure as fetches of ciphertexts require state access
    /// @param lhs input of type euint128
    /// @param rhs second input of type euint128
    /// @return the result of the eq
    function eq(euint128 lhs, euint128 rhs) internal returns (ebool) {
        return FHE.eq(lhs, rhs);
    }

    /// @notice Performs the ne operation
    /// @dev Pure in this function is marked as a hack/workaround - note that this function is NOT pure as fetches of ciphertexts require state access
    /// @param lhs input of type euint128
    /// @param rhs second input of type euint128
    /// @return the result of the ne
    function ne(euint128 lhs, euint128 rhs) internal returns (ebool) {
        return FHE.ne(lhs, rhs);
    }

    /// @notice Performs the not operation
    /// @dev Pure in this function is marked as a hack/workaround - note that this function is NOT pure as fetches of ciphertexts require state access
    /// @param lhs input of type euint128
    /// @return the result of the not
    function not(euint128 lhs) internal returns (euint128) {
        return FHE.not(lhs);
    }

    /// @notice Performs the and operation
    /// @dev Pure in this function is marked as a hack/workaround - note that this function is NOT pure as fetches of ciphertexts require state access
    /// @param lhs input of type euint128
    /// @param rhs second input of type euint128
    /// @return the result of the and
    function and(euint128 lhs, euint128 rhs) internal returns (euint128) {
        return FHE.and(lhs, rhs);
    }

    /// @notice Performs the or operation
    /// @dev Pure in this function is marked as a hack/workaround - note that this function is NOT pure as fetches of ciphertexts require state access
    /// @param lhs input of type euint128
    /// @param rhs second input of type euint128
    /// @return the result of the or
    function or(euint128 lhs, euint128 rhs) internal returns (euint128) {
        return FHE.or(lhs, rhs);
    }

    /// @notice Performs the xor operation
    /// @dev Pure in this function is marked as a hack/workaround - note that this function is NOT pure as fetches of ciphertexts require state access
    /// @param lhs input of type euint128
    /// @param rhs second input of type euint128
    /// @return the result of the xor
    function xor(euint128 lhs, euint128 rhs) internal returns (euint128) {
        return FHE.xor(lhs, rhs);
    }

    /// @notice Performs the gt operation
    /// @dev Pure in this function is marked as a hack/workaround - note that this function is NOT pure as fetches of ciphertexts require state access
    /// @param lhs input of type euint128
    /// @param rhs second input of type euint128
    /// @return the result of the gt
    function gt(euint128 lhs, euint128 rhs) internal returns (ebool) {
        return FHE.gt(lhs, rhs);
    }

    /// @notice Performs the gte operation
    /// @dev Pure in this function is marked as a hack/workaround - note that this function is NOT pure as fetches of ciphertexts require state access
    /// @param lhs input of type euint128
    /// @param rhs second input of type euint128
    /// @return the result of the gte
    function gte(euint128 lhs, euint128 rhs) internal returns (ebool) {
        return FHE.gte(lhs, rhs);
    }

    /// @notice Performs the lt operation
    /// @dev Pure in this function is marked as a hack/workaround - note that this function is NOT pure as fetches of ciphertexts require state access
    /// @param lhs input of type euint128
    /// @param rhs second input of type euint128
    /// @return the result of the lt
    function lt(euint128 lhs, euint128 rhs) internal returns (ebool) {
        return FHE.lt(lhs, rhs);
    }

    /// @notice Performs the lte operation
    /// @dev Pure in this function is marked as a hack/workaround - note that this function is NOT pure as fetches of ciphertexts require state access
    /// @param lhs input of type euint128
    /// @param rhs second input of type euint128
    /// @return the result of the lte
    function lte(euint128 lhs, euint128 rhs) internal returns (ebool) {
        return FHE.lte(lhs, rhs);
    }

    /// @notice Performs the max operation
    /// @dev Pure in this function is marked as a hack/workaround - note that this function is NOT pure as fetches of ciphertexts require state access
    /// @param lhs input of type euint128
    /// @param rhs second input of type euint128
    /// @return the result of the max
    function max(euint128 lhs, euint128 rhs) internal returns (euint128) {
        return FHE.max(lhs, rhs);
    }

    /// @notice Performs the min operation
    /// @dev Pure in this function is marked as a hack/workaround - note that this function is NOT pure as fetches of ciphertexts require state access
    /// @param lhs input of type euint128
    /// @param rhs second input of type euint128
    /// @return the result of the min
    function min(euint128 lhs, euint128 rhs) internal returns (euint128) {
        return FHE.min(lhs, rhs);
    }

    /// @notice Performs the shl operation
    /// @dev Pure in this function is marked as a hack/workaround - note that this function is NOT pure as fetches of ciphertexts require state access
    /// @param lhs input of type euint128
    /// @param rhs second input of type euint128
    /// @return the result of the shl
    function shl(euint128 lhs, euint128 rhs) internal returns (euint128) {
        return FHE.shl(lhs, rhs);
    }

    /// @notice Performs the shr operation
    /// @dev Pure in this function is marked as a hack/workaround - note that this function is NOT pure as fetches of ciphertexts require state access
    /// @param lhs input of type euint128
    /// @param rhs second input of type euint128
    /// @return the result of the shr
    function shr(euint128 lhs, euint128 rhs) internal returns (euint128) {
        return FHE.shr(lhs, rhs);
    }

    /// @notice Performs the rol operation
    /// @dev Pure in this function is marked as a hack/workaround - note that this function is NOT pure as fetches of ciphertexts require state access
    /// @param lhs input of type euint128
    /// @param rhs second input of type euint128
    /// @return the result of the rol
    function rol(euint128 lhs, euint128 rhs) internal returns (euint128) {
        return FHE.rol(lhs, rhs);
    }

    /// @notice Performs the ror operation
    /// @dev Pure in this function is marked as a hack/workaround - note that this function is NOT pure as fetches of ciphertexts require state access
    /// @param lhs input of type euint128
    /// @param rhs second input of type euint128
    /// @return the result of the ror
    function ror(euint128 lhs, euint128 rhs) internal returns (euint128) {
        return FHE.ror(lhs, rhs);
    }
    function toBool(euint128 value) internal returns (ebool) {
        return FHE.asEbool(value);
    }
    function toU8(euint128 value) internal returns (euint8) {
        return FHE.asEuint8(value);
    }
    function toU16(euint128 value) internal returns (euint16) {
        return FHE.asEuint16(value);
    }
    function toU32(euint128 value) internal returns (euint32) {
        return FHE.asEuint32(value);
    }
    function toU64(euint128 value) internal returns (euint64) {
        return FHE.asEuint64(value);
    }
    function toU256(euint128 value) internal returns (euint256) {
        return FHE.asEuint256(value);
    }
    function decrypt(euint128 value) internal returns (euint128) {
        return FHE.decrypt(value);
    }
    function getDecryptResult(euint128 value) internal view returns (uint128) {
        return FHE.getDecryptResult(value);
    }
    function getDecryptResultSafe(
        euint128 value
    ) internal view returns (uint128 result, bool decrypted) {
        return FHE.getDecryptResultSafe(value);
    }
    function allow(euint128 ctHash, address account) internal {
        FHE.allow(ctHash, account);
    }
    function isAllowed(
        euint128 ctHash,
        address account
    ) internal returns (bool) {
        return FHE.isAllowed(ctHash, account);
    }
    function allowThis(euint128 ctHash) internal {
        FHE.allowThis(ctHash);
    }
    function allowGlobal(euint128 ctHash) internal {
        FHE.allowGlobal(ctHash);
    }
    function allowSender(euint128 ctHash) internal {
        FHE.allowSender(ctHash);
    }
    function allowTransient(euint128 ctHash, address account) internal {
        FHE.allowTransient(ctHash, account);
    }
}

using BindingsEuint256 for euint256 global;
library BindingsEuint256 {
    /// @notice Performs the eq operation
    /// @dev Pure in this function is marked as a hack/workaround - note that this function is NOT pure as fetches of ciphertexts require state access
    /// @param lhs input of type euint256
    /// @param rhs second input of type euint256
    /// @return the result of the eq
    function eq(euint256 lhs, euint256 rhs) internal returns (ebool) {
        return FHE.eq(lhs, rhs);
    }

    /// @notice Performs the ne operation
    /// @dev Pure in this function is marked as a hack/workaround - note that this function is NOT pure as fetches of ciphertexts require state access
    /// @param lhs input of type euint256
    /// @param rhs second input of type euint256
    /// @return the result of the ne
    function ne(euint256 lhs, euint256 rhs) internal returns (ebool) {
        return FHE.ne(lhs, rhs);
    }
    function toBool(euint256 value) internal returns (ebool) {
        return FHE.asEbool(value);
    }
    function toU8(euint256 value) internal returns (euint8) {
        return FHE.asEuint8(value);
    }
    function toU16(euint256 value) internal returns (euint16) {
        return FHE.asEuint16(value);
    }
    function toU32(euint256 value) internal returns (euint32) {
        return FHE.asEuint32(value);
    }
    function toU64(euint256 value) internal returns (euint64) {
        return FHE.asEuint64(value);
    }
    function toU128(euint256 value) internal returns (euint128) {
        return FHE.asEuint128(value);
    }
    function toEaddress(euint256 value) internal returns (eaddress) {
        return FHE.asEaddress(value);
    }
    function decrypt(euint256 value) internal returns (euint256) {
        return FHE.decrypt(value);
    }
    function getDecryptResult(euint256 value) internal view returns (uint256) {
        return FHE.getDecryptResult(value);
    }
    function getDecryptResultSafe(
        euint256 value
    ) internal view returns (uint256 result, bool decrypted) {
        return FHE.getDecryptResultSafe(value);
    }
    function allow(euint256 ctHash, address account) internal {
        FHE.allow(ctHash, account);
    }
    function isAllowed(
        euint256 ctHash,
        address account
    ) internal returns (bool) {
        return FHE.isAllowed(ctHash, account);
    }
    function allowThis(euint256 ctHash) internal {
        FHE.allowThis(ctHash);
    }
    function allowGlobal(euint256 ctHash) internal {
        FHE.allowGlobal(ctHash);
    }
    function allowSender(euint256 ctHash) internal {
        FHE.allowSender(ctHash);
    }
    function allowTransient(euint256 ctHash, address account) internal {
        FHE.allowTransient(ctHash, account);
    }
}

using BindingsEaddress for eaddress global;
library BindingsEaddress {
    /// @notice Performs the eq operation
    /// @dev Pure in this function is marked as a hack/workaround - note that this function is NOT pure as fetches of ciphertexts require state access
    /// @param lhs input of type eaddress
    /// @param rhs second input of type eaddress
    /// @return the result of the eq
    function eq(eaddress lhs, eaddress rhs) internal returns (ebool) {
        return FHE.eq(lhs, rhs);
    }

    /// @notice Performs the ne operation
    /// @dev Pure in this function is marked as a hack/workaround - note that this function is NOT pure as fetches of ciphertexts require state access
    /// @param lhs input of type eaddress
    /// @param rhs second input of type eaddress
    /// @return the result of the ne
    function ne(eaddress lhs, eaddress rhs) internal returns (ebool) {
        return FHE.ne(lhs, rhs);
    }
    function toBool(eaddress value) internal returns (ebool) {
        return FHE.asEbool(value);
    }
    function toU8(eaddress value) internal returns (euint8) {
        return FHE.asEuint8(value);
    }
    function toU16(eaddress value) internal returns (euint16) {
        return FHE.asEuint16(value);
    }
    function toU32(eaddress value) internal returns (euint32) {
        return FHE.asEuint32(value);
    }
    function toU64(eaddress value) internal returns (euint64) {
        return FHE.asEuint64(value);
    }
    function toU128(eaddress value) internal returns (euint128) {
        return FHE.asEuint128(value);
    }
    function toU256(eaddress value) internal returns (euint256) {
        return FHE.asEuint256(value);
    }
    function decrypt(eaddress value) internal returns (eaddress) {
        return FHE.decrypt(value);
    }
    function getDecryptResult(eaddress value) internal view returns (address) {
        return FHE.getDecryptResult(value);
    }
    function getDecryptResultSafe(
        eaddress value
    ) internal view returns (address result, bool decrypted) {
        return FHE.getDecryptResultSafe(value);
    }
    function allow(eaddress ctHash, address account) internal {
        FHE.allow(ctHash, account);
    }
    function isAllowed(
        eaddress ctHash,
        address account
    ) internal returns (bool) {
        return FHE.isAllowed(ctHash, account);
    }
    function allowThis(eaddress ctHash) internal {
        FHE.allowThis(ctHash);
    }
    function allowGlobal(eaddress ctHash) internal {
        FHE.allowGlobal(ctHash);
    }
    function allowSender(eaddress ctHash) internal {
        FHE.allowSender(ctHash);
    }
    function allowTransient(eaddress ctHash, address account) internal {
        FHE.allowTransient(ctHash, account);
    }
}
