pragma solidity ^0.8.0;

constract Whitelist {
    //max of addresses whitelisted
    uint public maxWhitelistedAddresses;

    //create a maping for whitelisted addresses
    // if an address is whitelisted it will be set to true; by default they will be set set to false
    
    mapping = (address => bool) public whitelisteAddresses;

    // numAddressesWhitelisted would be used to keep track of how many addresses have been whitelisted
    uint public numAddressesWhitelisted;

    // Setting the Max number of whitelisted addresses
    // User will put the value at the time of deployment

    constructor (uint _maxWhitelistedAddresses) {
        maxWhitelistedAddresses = _maxWhitelistedAddresses
    };

     /**
        addAddressToWhitelist - This function adds the address of the sender to the
        whitelist
     */

     function addAddressToWhitelist() public {
         // check if the user has already been whitelisted
         require(!whitelistedAddresses[msg.sender], "sender has already beent whitelisted");
         // check if the numAddressesWhitelisted < maxWhitelistedAddresses, if not then throw an error.
         require(numAddressesWhitelisted < maxWhitelistedAddresses, "more addresses has been whitelisted" );
         // Add the address which called the function to the whitelistedAddress array
         whitelistedAddresses[msg.sender] = true;
         // Increase the number of whitelisted addresses
         numAddressesWhitelisted += 1;
     } 
}