pragma solidity ^0.4.17;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Adoption.sol";

contract TestAdoption {
    Adoption adoption = Adoption(DeployedAddresses.Adoption());

    // Testing the adopt() function
    function testUserCanAdoptPet() public {
        uint returnedId = adoption.adopt(8);
        uint expected = 8;
        Assert.equal(returnedId, expected, "Adoption of pet ID 8 should be recorded.");
    }

    // Testing retrieval of a single pet's owner
    function testGetAdopterAddressByPetId() public {
        // Expected owner is this contract
        address expected = this;

        address adopter = adoption.adopters(8);

        Assert.equal(adopter, expected, "Owner of pet ID 8 should be recorded.");
    }

//    // Testing retrieval of all pet owners
//    function testGetAdopterAddressByPetIdInArray() public {
//        // Expected owner is this contract
//        address expected = this;
//
//        // Store adopters in memory rather than contract's storage
//        address[16] memory adopters =
//
//        Assert.equal(adopters[8], expected, "Owner of pet ID 8 should be recorded.");
//    }

    function testOwnerPetsCount() public {
        uint returnedId1 = adoption.adopt(6);

        uint petCount = adoption.getPetsCount();

        Assert.equal(petCount, 2, "Number of adoptions not correct.");
    }

    function testOwnerPets() public {

        uint petCount = adoption.getPetsCount();
        uint[3] pets = adoption.getPetsByOwner();

        Assert.equal(pets[0], 8, "Number of adoptions not correct.");
    }
}