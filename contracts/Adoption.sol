pragma solidity ^0.4.2;

contract Adoption {

    address[16] public adopters;
    mapping (address => uint) ownerPetsCount;

    function getPetsCount() public view returns (uint) {
        uint count;
        count = ownerPetsCount[msg.sender];
        return count;
    }

    // Adopting a pet
    function adopt(uint petId) public returns (uint) {
        require(petId >= 0 && petId <= 15);
        adopters[petId] = msg.sender;
        ownerPetsCount[msg.sender]++;
        return petId;
    }

    // Retrieving the adopters
    function getAdopters() public view returns (address[16]) {
        return adopters;
    }

    function getPetsByOwner() external view returns(uint[] memory result) {
        uint counter = 0;
        result = new uint[](ownerPetsCount[msg.sender]);
        for (uint i = 0; i < adopters.length; i++) {
            if (adopters[i] == msg.sender) {
                result[counter] = i;
                counter++;
            }
        }
    }

}

