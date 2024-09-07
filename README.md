# Scholarship Fund Smart Contract - README

![image](https://github.com/user-attachments/assets/121d7529-80fd-4f28-874a-f60412129711)


## Vision
The Scholarship Fund smart contract aims to create a decentralized and transparent platform for managing scholarship funds. By leveraging blockchain technology, this contract ensures that donations are securely pooled and distributed to eligible students in a fair and automated manner. The contract empowers donors to contribute to the education of students, while providing an immutable record of all transactions and ensuring that funds reach deserving students directly.

## Flowchart

```
        +-----------------------+
        |    Scholarship Fund    |
        +-----------------------+
                   |
                   |
           +---------------+
           |   Donor        |
           +---------------+
            /       \
           /         \
  +---------+      +---------+
  |Donate   |      |View     |
  |Funds    |      |Details  |
  +---------+      +---------+
                   |
                   v
           +-------------------+
           | Scholarship Pool  |
           +-------------------+
                   |
                   |
           +---------------+
           |   Admin       |
           +---------------+
            /       \
           /         \
+---------+     +------------------+
|Add/Update     |View Student      |
|Eligibility    |Eligibility        |
+---------+     +------------------+
                   |
                   v
           +---------------+
           |   Student      |
           +---------------+
            /       \
           /         \
+---------+     +------------------+
|Claim         |View Details       |
|Scholarship   |                   |
+---------+     +------------------+
```

#### Contract Address

-**Networks:** Educhain
-**Contract Address:** 0x90b5B1BcF5ab79278C9d47e9AeA99f143De47058

![image](https://github.com/user-attachments/assets/69230b5a-2f41-400e-a8b9-beb0c229707c)



## Functions Overview

- **Donate:** Donors can contribute funds to the scholarship pool.
- **Update Student Eligibility:** Admin can add or update a student's eligibility status for receiving scholarships.
- **Claim Scholarship:** Eligible students can claim scholarship funds directly from the pool.
- **Check Eligibility:** Anyone can verify if a student is eligible for the scholarship.
- **Get Donor Details:** Donors can check their total contributions.
- **Get Student Details:** Retrieve details of a specific student, including their eligibility status and funds received.

## Future Scope
- **Multi-Currency Support:** Expand the contract to accept donations in multiple cryptocurrencies.
- **Automated Eligibility:** Integrate with academic institutions to automate the eligibility verification process based on academic performance.
- **Decentralized Governance:** Introduce a DAO model where donors can vote on scholarship distribution and student eligibility.
- **Scholarship Pools:** Implement multiple scholarship pools targeting different courses or institutions.

## Contact
For more information or collaboration, please reach out to:

**Arman Banik**

**Email:** armanbanik19@gmail.com

**LinkedIn:** www.linkedin.com/in/arman-banik-43765028b

**GitHub:** https://github.com/Major-Arman

---

This README provides a comprehensive overview of the Scholarship Fund smart contract, ensuring that users, developers, and potential collaborators understand its vision, functionality, and future potential.
