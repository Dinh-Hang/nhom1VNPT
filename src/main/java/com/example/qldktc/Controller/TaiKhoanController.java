package com.example.qldktc.Controller;


import com.example.qldktc.Dto.ProjectDTO;
import com.example.qldktc.Dto.UserDTO;
import com.example.qldktc.Model.Project;
import com.example.qldktc.Model.SinhVien;
import com.example.qldktc.Service.TaiKhoanService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;

@RestController
@RequestMapping("/api/v1")
public class TaiKhoanController {

    @Autowired
    TaiKhoanService taiKhoanService;

    public TaiKhoanController(TaiKhoanService taiKhoanService) {
        this.taiKhoanService = taiKhoanService;
    }

    @GetMapping("/taikhoan/{taikhoanId}")
    public ResponseEntity<UserDTO> getTaiKhoanById(@PathVariable String taikhoanId) {

        SinhVien sinhVienById = taiKhoanService.getTaiKhoanById(taikhoanId);
        if (sinhVienById != null) {
            SinhVien sinhVienEntity = sinhVienById;
            UserDTO userDTO = new UserDTO(sinhVienEntity.getMasv(), sinhVienEntity.getHoten(),
              sinhVienEntity.isGioitinh(),sinhVienEntity.getDiachi(), sinhVienEntity.getNgaysinh(), sinhVienEntity.getMalop(),
              sinhVienEntity.isDanghihoc(), sinhVienEntity.getPassword(), sinhVienEntity.getCccd(), sinhVienEntity.getChuyennganh(),
              sinhVienEntity.getRole().getId());
            return new ResponseEntity<UserDTO>(userDTO, HttpStatus.OK);

            //todo catch exception here.
        } else {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, "No project with the id " + taikhoanId + " was found.");
        }
    }

    @GetMapping(value = "/taikhoans", produces = "application/json")
    public ResponseEntity<List<UserDTO>> getAllTaiKhoan() {

        List<UserDTO> allTaiKhoan = taiKhoanService.getAllTaiKhoan();
        return new ResponseEntity<List<UserDTO>>(allTaiKhoan, HttpStatus.OK);
    }

    @PostMapping(value = "add-new-taikhoan", consumes = "application/json")
    public ResponseEntity<SinhVien> createTaiKhoan(@RequestBody UserDTO userDTO) {

        SinhVien sinhVien = taiKhoanService.saveSinhVien(userDTO);
        return new ResponseEntity<SinhVien>(sinhVien, HttpStatus.OK);
    }

    @PutMapping(value = "/update-taikhoan/{taikhoanId}", consumes = "application/json", produces = "application/json")
    public ResponseEntity<SinhVien> updateSinhVienById(@PathVariable(name = "taikhoanId") String taikhoanId, @RequestBody UserDTO userDTO) {

        SinhVien p = taiKhoanService.getTaiKhoanById(taikhoanId);
        if (p != null) {
            SinhVien sinhVien = taiKhoanService.updateTaiKhoanById(taikhoanId, userDTO);//todo save
            return new ResponseEntity<SinhVien>(sinhVien, HttpStatus.OK);
        }
        else {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, "Could not find project with the id: " + taikhoanId);
        }
    }

    @DeleteMapping("/taikhoan/{taikhoanId}")
    public void deleteProjectById(@PathVariable String taikhoanId) {

        if (taiKhoanService.isTaiKhoanIdPresent(taikhoanId)) {
            taiKhoanService.deleteTaiKhoanById(taikhoanId);

            //TODO DO NOT THROW EXCEPTION DIRECTLY. RETURN AN EXCEPTION DTO
        } else {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, "No project with the id " + taikhoanId + " was found.");
        }
    }
}
