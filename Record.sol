pragma solidity ^0.4.0;
import "browser/Doctor.sol";

contract Record {
    string data;
    uint id;
    address owner;
    Doctor doctor;
    uint ssn;
    string blood_type;
    string name;
    uint age;
    
    function Record(uint _id, string _data, uint _ssn, string _blood_type, string _name, uint _age) public {
        owner = msg.sender;
        doctor = Doctor(msg.sender);
        id = _id;
        data = _data;
        ssn = _ssn;
        blood_type = _blood_type;
        name = _name;
        age = _age;
    }
    
    function getData() public view returns(string) {
        return data;
    }

    function getId() public view returns(uint) {
        return id;
    }

    function getSsn() public view returns(uint) {
        return ssn;
    }

    function getAge() public view returns(uint) {
        return age;
    }

    function getBloodType() public view returns(string) {
        return blood_type;
    }

    function getName() public view returns(string) {
        return name;
    }

    function transfer(address newOwner) public {
        // Only the current owner can transfer the token.
        if (msg.sender != owner) return;
        if (doctor.isTokenTransferOK(owner, newOwner))
            owner = newOwner;
    }
}
