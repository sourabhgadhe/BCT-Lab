// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract CustomerManagement {
    struct customerData{
        uint256 customerId;
        string name;
        uint256 age;
        string email;
    }

    customerData[] customer;

    function addRecords(uint256 id,string memory name,uint256 age, string memory email) public {
        customer.push(customerData(id,name,age,email));
    }

    function getData(uint256 id) public view returns (string memory,uint256,string memory) {
        for (uint i=0; i<customer.length; i++) 
        {
            customerData memory cust=customer[i];
            if (cust.customerId==id) {
                return (cust.name,cust.age,cust.email);
            }
            
        }
        return ("Name not found",0,"Email not found");
    }

    fallback() external payable { }
    receive() external payable { }
}