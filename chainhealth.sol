pragma solidity ^0.4.0;
import "browser/Hospital.sol";
import "browser/Doctor.sol";

contract System {
    address owner;
    Hospital[] public hospitals;
    
    function System() {
        owner = msg.sender;
    }
    
    function addRecord(string _data, uint _rid, Doctor _doctor) {
        _doctor.addRecord(_data, _rid);
    }
    
    function addDoctor(uint _did, Hospital _hospital) {
        _hospital.addDoctor(_did);
    }
    
    function addHospital(uint _hid) {
        hospitals.push(new Hospital(_hid));
    }
    
    function transferRecord(uint _rid) {
        
    }
}