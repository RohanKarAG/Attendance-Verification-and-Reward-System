// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Attendance {
    address public owner;
    uint public rewardAmount;
    
    struct Employee {
        uint256 id;
        string name;
        uint attendanceCount;
        bool exists;
    }
    
    mapping(address => Employee) public employees;
    mapping(uint256 => bool) public attendanceRecords;

    event AttendanceMarked(uint256 indexed employeeId, uint256 date);
    event RewardIssued(uint256 indexed employeeId, uint amount);

    modifier onlyOwner() {
        require(msg.sender == owner, "Not the contract owner");
        _;
    }
	
	 function addEmployee(uint256 _id, string memory _name) public onlyOwner {
        require(!employees[msg.sender].exists, "Employee already exists");
        employees[msg.sender] = Employee(_id, _name, 0, true);
    }
function markAttendance(uint256 _employeeId, uint256 _date) public {
        require(employees[msg.sender].exists, "Employee does not exist");
        require(!attendanceRecords[_date], "Attendance already marked for this date");

        employees[msg.sender].attendanceCount++;
        attendanceRecords[_date] = true;

        emit AttendanceMarked(_employeeId, _date);
    }

    function issueReward(uint256 _employeeId) public onlyOwner {
        require(employees[msg.sender].exists, "Employee does not exist");
        require(employees[msg.sender].attendanceCount > 0, "No attendance records found");

        // Issue reward
        payable(msg.sender).transfer(rewardAmount);

        emit RewardIssued(_employeeId, rewardAmount);
    }

    function setRewardAmount(uint _amount) public onlyOwner {
        rewardAmount = _amount;
    }

    receive() external payable {}
}
 
