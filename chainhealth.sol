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
    string gender;
    
    function Record(uint _id, string _data, uint _ssn, string _blood_type, string _name, uint _age, string _gender) public {
        owner = msg.sender;
        doctor = Doctor(msg.sender);
        id = _id;
        data = _data;
        ssn = _ssn;
        blood_type = _blood_type;
        name = _name;
        age = _age;
        gender = _gender;
    }
    
    function getData() public view returns(string) {
        if (msg.sender == owner) return data;
    }

    function getGender() public view returns(string) {
        if (msg.sender == owner) return gender;
    }

    function getId() public view returns(uint) {
        if (msg.sender == owner) return id;
    }

    function getSsn() public view returns(uint) {
        if (msg.sender == owner) return ssn;
    }

    function getAge() public view returns(uint) {
        if (msg.sender == owner) return age;
    }

    function getBloodType() public view returns(string) {
        if (msg.sender == owner) return blood_type;
    }

    function getName() public view returns(string) {
        if (msg.sender == owner) return name;
    }

    function transfer(address newOwner) public {
        // Only the current owner can transfer the token.
        if (msg.sender != owner) return;
        if (doctor.isTokenTransferOK(owner, newOwner))
            owner = newOwner;
            doctor = Doctor(newOwner);
            doctor.addRecord();
    }

    function getDoctorId() public view returns(int) {
        return doctor.getDoctorId();
    }
}

contract Doctor {
    int public id;
    address owner;
    Record[] public records;
    
    function Doctor(int _id) {
        id = _id;
        owner = msg.sender;
    }
    
    function addRecord(uint _rid, string _data, uint _ssn, string _blood_type, string _name, uint _age, string _gender) {
        records.push(new Record(_rid, _data, _ssn, _blood_type, _name, _age, _gender));
    }

    function addRecord() {
        records.push(Record(msg.sender));
    }
    
    function isTokenTransferOK(address currentOwner, address newOwner)
        public
        view
        returns (bool ok)
    {
        address tokenAddress = msg.sender;
        return (keccak256(newOwner) & 0xff) == (bytes20(tokenAddress) & 0xff);
    }

    function transfer(uint _rid, address newOwner) public {
        // Only the current owner can transfer the token.
        for(uint i=0; i < records.length; i++){
            if(records[i].getId() == _rid){
                records[i].transfer(newOwner);
                if(records[i].getDoctorId() != id) {
                    delete records[i];
                }
                return;
            }
        }
    }

    function getDoctorId() public view returns (int) {
        return id;
    }

    function getData(uint _rid) public view returns(string) {
        for(uint i=0; i < records.length; i++){
            if(records[i].getId() == _rid){
                return records[i].getData();
            }
        }
    }

    function getSsn(uint _rid) public view returns(uint) {
        for(uint i=0; i < records.length; i++){
            if(records[i].getId() == _rid){
                return records[i].getSsn();
            }
        }
    }

    function getAge(uint _rid) public view returns(uint) {
        for(uint i=0; i < records.length; i++){
            if(records[i].getId() == _rid){
                return records[i].getAge();
            }
        }
    }

    function getBloodType(uint _rid) public view returns(string) {
        for(uint i=0; i < records.length; i++){
            if(records[i].getId() == _rid){
                return records[i].getBloodType();
            }
        }
    }

    function getGender(uint _rid) public view returns(string) {
        for(uint i=0; i < records.length; i++){
            if(records[i].getId() == _rid){
                return records[i].getGender();
            }
        }
    }

    function getName(uint _rid) public view returns(string) {
        for(uint i=0; i < records.length; i++){
            if(records[i].getId() == _rid){
                return records[i].getName();
            }
        }
    }
    
}
