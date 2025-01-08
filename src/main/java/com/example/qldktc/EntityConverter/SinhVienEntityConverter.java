package com.example.qldktc.EntityConverter;


import com.example.qldktc.Dto.UserDTO;
import com.example.qldktc.Model.SinhVien;
import org.springframework.stereotype.Service;

@Service
public class SinhVienEntityConverter implements EntityConverter<SinhVien, UserDTO> {

    @Override
    public UserDTO convertToDTO(SinhVien sinhvienEntity) {
      UserDTO userDTO = new UserDTO();
      userDTO.setHoten(sinhvienEntity.getHoten());
      userDTO.setMasv(sinhvienEntity.getMasv());


        return userDTO;
    }

    @Override
    public SinhVien convertToEntity(UserDTO userDTO) {

        SinhVien sinhvienEntity = new SinhVien();

      sinhvienEntity.setHoten(userDTO.getHoten());
      sinhvienEntity.setMasv(userDTO.getMasv());
        return sinhvienEntity;
    }
}
