package com.example.qldktc.Service;

import com.example.qldktc.Dto.UserDTO;
import com.example.qldktc.EntityConverter.ProjectEntityConverter;
import com.example.qldktc.EntityConverter.SinhVienEntityConverter;
import com.example.qldktc.Model.SinhVien;
import com.example.qldktc.Repo.UserRepo;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class TaiKhoanService {

    @Autowired
    UserRepo userRepository;

    @Autowired
    SinhVienEntityConverter sinhVienEntityConverter;

    @Transactional
    public Boolean isTaiKhoanIdPresent(String id) {

        return userRepository.findById(id.toString()).isPresent();
    }

    @Transactional
    public SinhVien getTaiKhoanById(String id){

        Optional<SinhVien> byId = userRepository.findTaiKhoanByMasv(id);

        if(byId.isPresent()){
            return byId.get();
        } else {
            throw new RuntimeException("Could not find a project with the id: " + id);
            // todo ELSE throw exception
        }
    }

    @Transactional
    public List<SinhVien> findByName(String title) {

        return userRepository.findByHoten(title);
    }

    @Transactional
    public SinhVien saveSinhVien(UserDTO userDTO) {

      SinhVien sinhvienToBeSaved = new SinhVien(userDTO.getMasv(), userDTO.getHoten(), userDTO.isGioitinh(),
        userDTO.getDiachi(), userDTO.getNgaysinh(), userDTO.getMalop(),
        userDTO.isDanghihoc(), userDTO.getPassword(),
        userDTO.getCccd(), userDTO.getChuyennganh());
      SinhVien savedSinhVien = userRepository.save(sinhvienToBeSaved);
        return savedSinhVien;
    }

    @Transactional
    public List<UserDTO> getAllTaiKhoan() {

        List<SinhVien> all = userRepository.findAll();
        List<UserDTO> dtos = new ArrayList<>();
        for (SinhVien sinhVien : all) {
            UserDTO temp = new UserDTO();
            temp.setMasv(sinhVien.getMasv());
            temp.setHoten(sinhVien.getHoten());
//            temp.setGioitinh(sinhVien.isGioitinh());
//            temp.setDiachi(sinhVien.getDiachi());
//            temp.setNgaysinh(sinhVien.getNgaysinh());
            temp.setMalop(sinhVien.getMalop());
//            temp.setDanghihoc(sinhVien.isDanghihoc());
            temp.setPassword(sinhVien.getPassword());
            temp.setCccd(sinhVien.getCccd());
            temp.setChuyennganh(sinhVien.getChuyennganh());
            dtos.add(temp);
        }
        return dtos;
    }

    @Transactional
    public SinhVien updateTaiKhoanById(String id, UserDTO sinhVienToBeUpdated) {

        SinhVien sinhVien;

        Optional<SinhVien> sinhVienOptional = userRepository.findById(id.toString());
        if (!sinhVienOptional.isPresent()) {

            throw new RuntimeException("Could not find project with the id: " + id);
        } else {

            sinhVien = sinhVienOptional.get();
          sinhVien.setMasv(sinhVienToBeUpdated.getMasv());
          sinhVien.setHoten(sinhVienToBeUpdated.getHoten());
          sinhVien.setMalop(sinhVienToBeUpdated.getMalop());
          sinhVien.setPassword(sinhVienToBeUpdated.getPassword());
          sinhVien.setCccd(sinhVienToBeUpdated.getCccd());
          sinhVien.setChuyennganh(sinhVienToBeUpdated.getChuyennganh());

        }
        return userRepository.save(sinhVien);
    }

    @Transactional
    public void deleteTaiKhoanById(String id) {

      userRepository.deleteById(id.toString());
    }
}
