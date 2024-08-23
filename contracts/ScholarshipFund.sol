// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract ScholarshipFund {
    // Structs
    struct Donor {
        address donorAddress;
        uint256 totalDonated;
    }

    struct Student {
        address studentAddress;
        string name;
        string course;
        uint256 fundsReceived;
        bool isEligible;
    }

    // Mappings
    mapping(address => Donor) public donors;
    mapping(address => Student) public students;
    address[] public donorAddresses;
    address[] public studentAddresses;

    // Variables
    address public admin;
    uint256 public totalFunds;
    uint256 public totalDonated;
    uint256 public totalDistributed;

    // Modifiers
    modifier onlyAdmin() {
        require(msg.sender == admin, "Only admin can perform this action");
        _;
    }

    modifier onlyEligibleStudent() {
        require(students[msg.sender].isEligible == true, "Only eligible students can perform this action");
        _;
    }

    // Events
    event DonationReceived(address indexed donor, uint256 amount);
    event ScholarshipGranted(address indexed student, uint256 amount);
    event StudentEligibilityUpdated(address indexed student, bool isEligible);

    // Constructor
    constructor() {
        admin = msg.sender;
    }

    // Functions

    // Donor can donate funds to the scholarship pool
    function donate() external payable {
        require(msg.value > 0, "Donation amount must be greater than zero");

        if (donors[msg.sender].donorAddress == address(0)) {
            donors[msg.sender] = Donor(msg.sender, msg.value);
            donorAddresses.push(msg.sender);
        } else {
            donors[msg.sender].totalDonated += msg.value;
        }

        totalFunds += msg.value;
        totalDonated += msg.value;

        emit DonationReceived(msg.sender, msg.value);
    }

    // Admin can add or update a student's eligibility status
    function updateStudentEligibility(address _studentAddress, string memory _name, string memory _course, bool _isEligible) public onlyAdmin {
        if (students[_studentAddress].studentAddress == address(0)) {
            students[_studentAddress] = Student(_studentAddress, _name, _course, 0, _isEligible);
            studentAddresses.push(_studentAddress);
        } else {
            students[_studentAddress].isEligible = _isEligible;
        }

        emit StudentEligibilityUpdated(_studentAddress, _isEligible);
    }

    // Eligible students can claim scholarship funds
    function claimScholarship(uint256 _amount) public onlyEligibleStudent {
        require(_amount <= totalFunds, "Insufficient funds in the scholarship pool");

        totalFunds -= _amount;
        totalDistributed += _amount;
        students[msg.sender].fundsReceived += _amount;

        payable(msg.sender).transfer(_amount);

        emit ScholarshipGranted(msg.sender, _amount);
    }

    // Function to check if a student is eligible
    function isStudentEligible(address _studentAddress) public view returns (bool) {
        return students[_studentAddress].isEligible;
    }

    // Function to get total funds available in the scholarship pool
    function getTotalFunds() public view returns (uint256) {
        return totalFunds;
    }

    // Function to get donor details
    function getDonorDetails(address _donorAddress) public view returns (uint256) {
        return donors[_donorAddress].totalDonated;
    }

    // Function to get student details
    function getStudentDetails(address _studentAddress) public view returns (string memory, string memory, uint256, bool) {
        Student memory student = students[_studentAddress];
        return (student.name, student.course, student.fundsReceived, student.isEligible);
    }
}

