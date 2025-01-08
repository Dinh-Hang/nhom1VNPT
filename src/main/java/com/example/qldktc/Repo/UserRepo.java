package com.example.qldktc.Repo;

import com.example.qldktc.Model.SinhVien;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface UserRepo extends JpaRepository<SinhVien, String> {
  Optional<SinhVien> findOneByMasvAndPassword(String masv, String password);

  SinhVien findByMasv(String masv);


  List<SinhVien> findByHoten(String hoten);

  Optional<SinhVien> findTaiKhoanByMasv(String masv);


}
