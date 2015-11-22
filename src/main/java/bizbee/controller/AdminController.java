package bizbee.controller;

import bizbee.model.Page;
import bizbee.model.Photo;
import bizbee.service.MandrillEmailService;
import bizbee.service.PageService;
import bizbee.service.PhotoService;
import bizbee.utils.Constants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

/**
 *
 */
@Controller
@RequestMapping(value = "/admin")
@SuppressWarnings("unused")
public class AdminController {

    @Autowired
    PhotoService photoService;
    @Autowired
    private PageService pageService;
    @Autowired
    MandrillEmailService mandrillEmailService;

    @RequestMapping(value = {"/", ""}, method = RequestMethod.GET)
    public ModelAndView getAdmin()  {
        return new ModelAndView("admin");
    }

    @RequestMapping(value = {"/photos"}, method = RequestMethod.GET)
    public String getPhotos(HttpServletRequest request)   {
        List<Integer> statuses = new ArrayList<>();
        statuses.add(Constants.PhotoStatus.NEW);

        List<Photo> photos = this.photoService.findAllByStatusList(statuses);
        List<Page> pages = this.pageService.findAllPages();

        request.setAttribute("photos", photos);
        request.setAttribute("pages", pages);
        request.setAttribute("isTitle", false);

        return "photos";
    }

    @RequestMapping(value = "/photos/titles", method = RequestMethod.GET)
    public String getTitlePhotos(HttpServletRequest request) {
        List<Integer> statuses = new ArrayList<>();
        statuses.add(Constants.PhotoStatus.TITLE);

        List<Photo> photos = this.photoService.findAllByStatusList(statuses);
        List<Page> pages = this.pageService.findAllPages();//TODO change to lazy

        request.setAttribute("photos", photos);
        request.setAttribute("pages", pages);
        request.setAttribute("isTitle", true);

        return "photos";
    }

    @RequestMapping(value = "/photos/status/title", method = RequestMethod.POST)
    @ResponseBody
    public String addTitlePhotos(@RequestParam(value = "title") final String title) {
        this.photoService.changePhotoStatus(title, Constants.PhotoStatus.TITLE);

        return "success";
    }

    @RequestMapping(value = "/photos/status/free", method = RequestMethod.POST)
    @ResponseBody
    public String addNewPhotos(@RequestParam(value = "title") final String title) {
        this.photoService.changePhotoStatus(title, Constants.PhotoStatus.NEW);

        return "success";
    }



//    @RequestMapping(value = {"/photo/ftp/process"}, method = RequestMethod.POST)
//    public String processFiles()  {
//        Path path1 = Paths.get("Test").normalize();
//        String dir  = path1.toAbsolutePath().toString();
//
//        File directory = new File(dir);
//        File parent = directory.getParentFile();
//        File[] files = parent.listFiles();
//
//        return "redirect:/admin/photos";
//    }

}
