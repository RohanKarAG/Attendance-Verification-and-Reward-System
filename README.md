# Attendance Verification and Reward System

This Solidity smart contract allows for the verification of employee attendance and the issuance of rewards based on attendance records. The contract is designed to be managed by an owner, who is responsible for adding employees, marking attendance, and issuing rewards.

## Features

- **Employee Management:** The owner can add employees to the system.
- **Attendance Tracking:** Employees can mark their attendance, and the contract records the date of attendance.
- **Reward System:** Rewards can be issued to employees based on their attendance records.
- **Owner Management:** Only the owner can manage employees, set reward amounts, and issue rewards.

## Usage

1. **Deploy the Contract:**
   - Deploy the contract on an Ethereum-compatible blockchain, specifying the initial reward amount.

2. **Add Employees:**
   - The owner can add employees using the `addEmployee` function. Each employee is associated with a unique ID and name.

3. **Mark Attendance:**
   - Employees can mark their attendance by calling the `markAttendance` function, passing their employee ID and the date.

4. **Issue Rewards:**
   - The owner can issue rewards to employees using the `issueReward` function. Rewards are transferred to the employee's address.

5. **Manage Reward Amount:**
   - The owner can update the reward amount using the `setRewardAmount` function.

## Security Considerations

- **Owner Privileges:** Only the owner can add employees, set reward amounts, and issue rewards. Ensure the owner's private key is securely managed.
- **Reentrancy:** The contract uses simple `transfer` for issuing rewards, which is safe from reentrancy attacks. However, future updates should consider using `ReentrancyGuard` if complex logic is added.
- **Input Validation:** The contract assumes valid input (e.g., unique employee IDs). Consider adding additional checks in a production environment.

## License
This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
