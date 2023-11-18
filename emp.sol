// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract EmployeeManagement {
    struct EmployeeData{
        uint256 empId;
        string name;
        uint256 salary;
        string designation;
    }

    EmployeeData[] employee;

    function addRecords(uint256 id,string memory name,uint256 sal,string memory deg) public {
        employee.push(EmployeeData(id,name,sal,deg));
    }

    function getEmployeeData(uint id)public view returns (string memory,uint,string memory){
        for (uint i=0; i<employee.length; i++) 
        {
            EmployeeData memory emp=employee[i];
            if (emp.empId==id) {
                return (emp.name,emp.salary,emp.designation);
            }
        }
        return ("Name not found",0,"Designation not found");
    }

    function employeeCount() public view returns(uint) {
        return employee.length;
    }
}