// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.25 <0.9.0;

import {Permission} from "./Permissioned.sol";

// Order is set as in fheos/precompiles/types/types.go
enum FunctionId {
    _0, // 0 - GetNetworkKey
    _1, // 1 - Verify
    cast, // 2
    sealoutput, // 3
    select, // 4 - select
    _5, // 5 - req
    decrypt, // 6
    sub, // 7
    add, // 8
    xor, // 9
    and, // 10
    or, // 11
    not, // 12
    div, // 13
    rem, // 14
    mul, // 15
    shl, // 16
    shr, // 17
    gte, // 18
    lte, // 19
    lt, // 20
    gt, // 21
    min, // 22
    max, // 23
    eq, // 24
    ne, // 25
    trivialEncrypt, // 26
    random, // 27
    rol, // 28
    ror, // 29
    square // 30
}

interface ITaskManager {
    function createTask(
        uint8 returnType,
        FunctionId funcId,
        uint256[] memory encryptedInputs,
        uint256[] memory extraInputs
    ) external returns (uint256);

    function createDecryptTask(uint256 ctHash, address requestor) external;
    function getDecryptResult(uint256 input) external view returns (uint256);
    function getDecryptResultSafe(
        uint256 input
    ) external view returns (uint256 result, bool decrypted);
    function verifyKey(
        uint256 ctHash,
        uint8 uintType,
        int32 securityZone,
        bytes memory signature,
        uint8 desiredType
    ) external;

    function allow(uint256 ctHash, address account) external;
    function isAllowed(uint256 ctHash, address account) external returns (bool);
    function isAllowedWithPermission(
        Permission memory permission,
        uint256 ctHash
    ) external returns (bool);
    function aclEIP712Domain()
        external
        view
        returns (
            bytes1 fields,
            string memory name,
            string memory version,
            uint256 chainId,
            address verifyingContract,
            bytes32 salt,
            uint256[] memory extensions
        );
    function allowTransient(uint256 ctHash, address account) external;
    function allowGlobal(uint256 ctHash, address account) external;
}

library Utils {
    // Values used to communicate types to the runtime.
    // Must match values defined in warp-drive protobufs for everything to
    // make sense
    uint8 internal constant EUINT8_TFHE = 2;
    uint8 internal constant EUINT16_TFHE = 3;
    uint8 internal constant EUINT32_TFHE = 4;
    uint8 internal constant EUINT64_TFHE = 5;
    uint8 internal constant EUINT128_TFHE = 6;
    uint8 internal constant EUINT256_TFHE = 8;
    uint8 internal constant EADDRESS_TFHE = 7;
    uint8 internal constant EBOOL_TFHE = 0;

    function functionIdToString(
        FunctionId _functionId
    ) internal pure returns (string memory) {
        if (_functionId == FunctionId.cast) return "cast";
        if (_functionId == FunctionId.sealoutput) return "sealOutput";
        if (_functionId == FunctionId.select) return "select";
        if (_functionId == FunctionId.decrypt) return "decrypt";
        if (_functionId == FunctionId.sub) return "sub";
        if (_functionId == FunctionId.add) return "add";
        if (_functionId == FunctionId.xor) return "xor";
        if (_functionId == FunctionId.and) return "and";
        if (_functionId == FunctionId.or) return "or";
        if (_functionId == FunctionId.not) return "not";
        if (_functionId == FunctionId.div) return "div";
        if (_functionId == FunctionId.rem) return "rem";
        if (_functionId == FunctionId.mul) return "mul";
        if (_functionId == FunctionId.shl) return "shl";
        if (_functionId == FunctionId.shr) return "shr";
        if (_functionId == FunctionId.gte) return "gte";
        if (_functionId == FunctionId.lte) return "lte";
        if (_functionId == FunctionId.lt) return "lt";
        if (_functionId == FunctionId.gt) return "gt";
        if (_functionId == FunctionId.min) return "min";
        if (_functionId == FunctionId.max) return "max";
        if (_functionId == FunctionId.eq) return "eq";
        if (_functionId == FunctionId.ne) return "ne";
        if (_functionId == FunctionId.trivialEncrypt) return "trivialEncrypt";
        if (_functionId == FunctionId.random) return "random";
        if (_functionId == FunctionId.rol) return "rol";
        if (_functionId == FunctionId.ror) return "ror";
        if (_functionId == FunctionId.square) return "square";

        return "";
    }
}
