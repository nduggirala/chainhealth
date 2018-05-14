pragma solidity ^0.4.0;
import "browser/Doctor.sol";
contract Record {
    string data;
    uint id;
    address owner;
    Doctor doctor;
    
    function Record(uint _id, string _data) public {
        owner = msg.sender;
        doctor = Doctor(msg.sender);
        id = _id;
        data = _data;
    }
    
    function transfer(address newOwner) public {
        // Only the current owner can transfer the token.
        if (msg.sender != owner) return;
        if (doctor.isTokenTransferOK(owner, newOwner))
            owner = newOwner;
    }
}
