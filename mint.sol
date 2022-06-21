pragma solidity >=0.7.0 <0.9.0;

interface  ICaller{

    function mint(address _to, uint256 _amount) external payable;
    function transfer(address _to, uint256 _value) external;

}

contract Minter {

    address targetAddress;
    address WBTCAddress;

    function setTargetAddress(address _targetAddress) external {
        targetAddress = _targetAddress;
    }

    function setWBTCAddress(address _WBTCADDRESS) external {
        WBTCAddress = _WBTCADDRESS;
    }

    function currentTargetAddress() public view returns(address) {
        return targetAddress;
    }

    function currentWBTCAddress() public view returns(address) {
        return WBTCAddress;
    }

    function callTargetAddress(address _to, uint256 _amount) external {
        ICaller(targetAddress).mint(_to, _amount);
    }

    function withdraw(address _to, uint256 _value) external {
        ICaller(WBTCAddress).transfer(_to, _value);
    }

}
