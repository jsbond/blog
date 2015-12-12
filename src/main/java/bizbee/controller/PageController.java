package bizbee.controller;

import bizbee.model.Page;
import bizbee.model.Photo;
import bizbee.service.MandrillEmailService;
import bizbee.service.PageService;
import bizbee.service.PhotoService;
import bizbee.utils.Constants;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 *
 */
@Controller
@RequestMapping(value = "/admin/pages")
@SuppressWarnings("unused")
public class PageController {

    @Autowired
    PhotoService photoService;
    @Autowired
    private PageService pageService;
    @Autowired
    MandrillEmailService mandrillEmailService;

    @RequestMapping(value = {"/", ""}, method = RequestMethod.GET)
    public String getPages(HttpServletRequest request) {
        List<Page> pages = this.pageService.findAllPages();
        request.setAttribute("pages", pages);
        return "pages";
    }

    @RequestMapping(value = "/edit", method = RequestMethod.GET)
    public String getPage(HttpServletRequest request) {
        List<Photo> tituls = this.photoService.findAllByStatus(Constants.PhotoStatus.TITLE);
        List<Page> children = this.pageService.findAllPages();

        if (StringUtils.isNotBlank(request.getParameter("id"))) {
            Page page = this.pageService.findById(request.getParameter("id"));

            request.setAttribute("page", page);
            request.setAttribute("isEdit", true);
        }else {
            request.setAttribute("isEdit", false);
        }

        request.setAttribute("tituls", tituls);
        request.setAttribute("children", children);

        return "pageedit";
    }

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public String savePage(HttpServletRequest request,
                           @RequestParam (value = "id") final String pageID,
                           @RequestParam (value = "name") final String pageName) {
        this.pageService.createPage(pageID, pageName);
        return "redirect:/admin/pages";
    }

    @RequestMapping(value = "/photos", method = RequestMethod.POST)
    @ResponseBody
    public String updatePagePhotos(@RequestParam(value = "photos") final String photoIdString,
                                   @RequestParam(value = "page", required = false) final String pageId) {
        this.pageService.updatePagePhotos(photoIdString, pageId);
        return "success";
    }





}
