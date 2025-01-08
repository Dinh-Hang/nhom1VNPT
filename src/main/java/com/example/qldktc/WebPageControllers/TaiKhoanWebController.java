package com.example.qldktc.WebPageControllers;

import com.example.qldktc.Repo.ProjectRepository;
import com.example.qldktc.Repo.UserRepo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TaiKhoanWebController {

    private final UserRepo userRepoRepository;

    public TaiKhoanWebController(UserRepo userRepoRepository) {
        this.userRepoRepository = userRepoRepository;
    }

    @GetMapping("/taikhoans")
    public ModelAndView projectsPage() {
        ModelAndView modelAndView = new ModelAndView("taikhoans");

        return modelAndView;
    }
}
