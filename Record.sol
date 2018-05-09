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
}