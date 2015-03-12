# dqrws-examples
DQR Web Service Examples for the DOE ARM Program

Check out the [DQR Web Service User Guide](https://github.com/Sean-T-Moore/dqrws-examples/wiki) in the Wiki Section.

Data quality issues are often found some time after data is collected, ingested, archived and then delivered to an end user. The Data Quality Report (DQR) web service allows a user application to automatically query the DQR database in order to retrieve the most up-to-date information regarding the quality of their data holdings. The service returns a list of time blocks (start/end time pairs) that delineate when a user should not use or should be suspicious of their ARM data. Optionally, additional information about the DQR responsible for the time blocks in the report can be returned. This might include the DQR identifier string and the subject details. 
