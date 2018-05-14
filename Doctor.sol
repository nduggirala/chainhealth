pragma solidity ^0.4.0;
import "browser/Record.sol";
import "browser/Hospital.sol";
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
    
    function addRecord(string _data, uint _rid) {
        records.push(new Record(_rid, _data));
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
