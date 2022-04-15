/*
Highest Target Under Manager

Find the highest target achieved by the employee or employees who works under the manager id 13. 
Output the first name of the employee and target achieved. 
The solution should show the highest target achieved under manager_id=13 and which employee(s) achieved it.
*/




SELECT first_name,
       target
FROM
    (SELECT first_name,
           manager_id,
           target,
           RANK() OVER(PARTITION BY manager_id ORDER BY target DESC) rn
    FROM salesforce_employees
    WHERE manager_id = 13) sub
WHERE rn = 1
