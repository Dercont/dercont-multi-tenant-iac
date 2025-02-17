# Control Plane Module  
This module deploys the control plane instance for the infrastructure.  

## Inputs  
| Name               | Description                          | Type    | Required |  
|--------------------|--------------------------------------|---------|----------|  
| compartment_ocid   | OCID of the compartment              | string  | yes      |  
| availability_domain| Availability domain for the instance | string  | yes      |  
| instance_shape     | Shape of the compute instance        | string  | yes      |  

## Outputs  
| Name       | Description                          |  
|------------|--------------------------------------|  
| instance_id | OCID of the created instance         |  
| public_ip   | Public IP of the instance            |  