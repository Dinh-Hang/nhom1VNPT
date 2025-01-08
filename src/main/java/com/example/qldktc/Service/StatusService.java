package com.example.qldktc.Service;


import com.example.qldktc.Dto.StatusDTO;
import com.example.qldktc.Model.Status;
import com.example.qldktc.Repo.StatusRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jakarta.transaction.Transactional;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class StatusService {

    @Autowired
    StatusRepository statusRepository;

    @Transactional
    public Status getStatusByName(String statusName) {

        Optional<Status> statusByName = statusRepository.findByStatusName(statusName);

        if (statusByName.isPresent()) {
            return statusByName.get();
        } else {
            throw new RuntimeException("Could not find Status with name: " + statusName);
            //todo ELSE throw exception
        }
    }

    @Transactional
    public List<StatusDTO> getAllStatus() {

        List<Status> allStatus = statusRepository.findAll();
        List<StatusDTO> statusDTOS = new ArrayList<>();

        for (Status status : allStatus) {
            StatusDTO temp = new StatusDTO();
            temp.statusId = status.getStatusId();
            temp.statusName = status.getStatusName();
            temp.statusOfProject = status.getStatusName();
            statusDTOS.add(temp);
        }
        return statusDTOS;
    }

    @Transactional
    public void saveNewStatus(Status statusName) {

        statusRepository.save(statusName);
    }

    @Transactional
    public void deleteStatusById(Integer id) {

        statusRepository.deleteById(id);
    }
}
