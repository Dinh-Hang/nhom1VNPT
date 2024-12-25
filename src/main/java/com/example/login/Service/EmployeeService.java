package com.example.login.Service;

import com.example.login.Dto.EmployeeDTO;
import com.example.login.Dto.LoginDTO;
import com.example.login.response.LoginResponse;

public interface EmployeeService {
    String addEmployee(EmployeeDTO employeeDTO);

    LoginResponse loginEmployee(LoginDTO loginDTO);
}
