package com.example.qldktc.Controller;

import com.example.qldktc.Dto.StatusDTO;
import com.example.qldktc.Service.StatusService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/v1")
public class StatusController {

    @Autowired
    StatusService statusService;

    @GetMapping(value = "/status", produces = "application/json")
    public ResponseEntity<List<StatusDTO>> getAllStatus() {

        List<StatusDTO> allStatusDTO = statusService.getAllStatus();
        return new ResponseEntity<List<StatusDTO>>(allStatusDTO, HttpStatus.OK);
    }
}
