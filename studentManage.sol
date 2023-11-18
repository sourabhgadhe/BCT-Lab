// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
contract studentManagement {
    
    struct StudentRecord{
        uint256 id;
        string name;
        string department;
    }

    StudentRecord[] records;

    function addRecord(uint _id,string memory _name,string memory _department) public {
        records.push(StudentRecord(_id,_name,_department));
    }

    function getRecord(uint studentId) public view returns (string memory, string memory) {
        for (uint i=0; i<records.length; i++) 
        {
            StudentRecord memory stud=records[i];
            if (stud.id==studentId) {
                return (stud.name,stud.department);
            }
        }
        return ("Name not found", "Department not found");
    }

    function studentCount()public view returns (uint) {
        return records.length;
    }

    fallback() external payable {
        records.push(StudentRecord(7,"XYZ","Mech"));
    }
    receive() external payable { }
}