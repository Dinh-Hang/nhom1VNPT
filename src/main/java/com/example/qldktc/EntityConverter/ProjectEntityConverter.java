package com.example.qldktc.EntityConverter;


import com.example.qldktc.Dto.ProjectDTO;
import com.example.qldktc.Model.Project;
import org.springframework.stereotype.Service;

@Service
public class ProjectEntityConverter implements EntityConverter<Project, ProjectDTO> {

    @Override
    public ProjectDTO convertToDTO(Project projectEntity) {
        ProjectDTO projectDTO = new ProjectDTO();
        projectDTO.projectName = projectEntity.getName();
        projectDTO.projectId = projectEntity.getProjectId();

        if (projectEntity.getStatusOfProject() != null) {

            projectDTO.statusName = projectEntity.getStatusOfProject().getStatusName();
        } else {

            projectDTO.statusName = "Undefined Status";
        }
        return projectDTO;
    }

    @Override
    public Project convertToEntity(ProjectDTO projectDTO) {

        Project projectEntity = new Project();

        projectEntity.setName(projectDTO.projectName);
        projectEntity.setDescription(projectDTO.description);
        return projectEntity;
    }
}
