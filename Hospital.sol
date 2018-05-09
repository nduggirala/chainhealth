pragma solidity ^0.4.0;
import "browser/Doctor.sol";
import "browser/chainhealth.sol";
contract Hospital {
    uint public id;
    System system;
    address owner;
    Doctor[] public doctors;
    
    function Hospital(uint _id) {
        id = _id;
        owner = msg.sender;
        system = System(msg.sender);
    }
    
    function addDoctor(uint _did) {
        doctors.push(new Doctor(_did));
    }
    
    function transferRecord(uint _rid, uint _did) returns (bool found) {
        int from = -1;
        int to = -1;
        for(uint i=0; i < doctors.length; i++){
            if(doctors[i].contains(_rid)){
                if(doctors[i].id == _did){
                    return true;
                }
                from = i;
            }
            if(doctors[i].id == _did){
                to = i;
            }
        }
        if(to == -1){
            return false;
        }
        doctors[from].transferRecord(_rid, doctors[to]);
        return true;
    }
}