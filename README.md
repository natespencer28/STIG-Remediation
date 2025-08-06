**STIG Remediation Activity**

This section is dedicated to the STIG remediations I preformed on a virutal machine hosted in Azure. The STIG folder shows the number of remediations that I have preformed on said VM along with the powershell script that was used. 

**STIG Process** 

I want this to serve as a insight to the process I am taking as I am remediating STIGs. 

1) Scan the Host and identify STIGs that need remediated
2) Connect to VM and look to verify failed STIG
3) Pick a STIG from scan in Tenable and copy the STIG ID
4) Open STIG-A-VIEW and search for STIG with remedidation guidelines
5) Utilize ChatGPT to create powershell script to remediate
6) Document script and STIG in STIG folder above
7) Use Invoke-webrequest on VM to simulate remote remediation process
