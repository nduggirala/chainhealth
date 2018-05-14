pragma solidity ^0.4.0;

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

contract Doctor {
    uint public id;
    Hospital hospital;
    address owner;
    Record[] public records;
    
    function Doctor(uint _id) {
        id = _id;
        owner = msg.sender;
        hospital = Hospital(msg.sender);
    }
    
    function addRecord(uint _rid, string _data, uint _ssn, string _blood_type, string _name, uint _age) {
        records.push(new Record(_rid, _data, _ssn, _blood_type, _name, _age));
    }
    
    function contains(uint _rid) returns (bool found) {
        for(uint i=0; i < records.length; i++){
            if(records[i].id == _rid){
                return true;
            }
        }
        return true;
    }
    
    function isTokenTransferOK(address currentOwner, address newOwner)
        public
        view
        returns (bool ok)
    {
        address tokenAddress = msg.sender;
        return (keccak256(newOwner) & 0xff) == (bytes20(tokenAddress) & 0xff);
    }
    
}
