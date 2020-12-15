// SPDX-License-Identifier: MIT

pragma solidity >=0.6.0 <0.8.0;

library NativeAssets {
    address constant balanceAddr = 0xFFfFfFffFFfffFFfFFfFFFFFffFFFffffFfFFFfF;
    address constant transferAddr = 0xffffFFFfFFffffffffffffffFfFFFfffFFFfFFfE;

    function assetBalance(address addr, uint256 assetID) public returns (uint256) {
        (bool success, bytes memory data) = balanceAddr.call(abi.encodePacked(addr, assetID));
        require(success, "assetBalance failed");
        return abi.decode(data, (uint256));
    }
    
    function assetCall(address addr, uint256 assetID, uint256 assetAmount, bytes memory callData) public returns (bytes memory) {
        (bool success, bytes memory data) = transferAddr.call(abi.encodePacked(addr, assetID, assetAmount, callData));
        require(success, "assetCall failed");
        return data;
    }
}