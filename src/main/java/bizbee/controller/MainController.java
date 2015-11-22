package bizbee.controller;

import bizbee.service.MandrillEmailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

/**
 *
 */
@Controller
@SuppressWarnings("unused")
public class MainController {

    @Autowired
    MandrillEmailService mandrillEmailService;

    @RequestMapping(value = {"/", ""}, method = RequestMethod.GET)
    public String getPage()  {
        return "main";
    }

    @RequestMapping(value = {"/login"}, method = RequestMethod.GET)
    public String login()  {
        return "login";
    }

    @RequestMapping(value = "/portfolio/{category}", method = RequestMethod.GET)
    public String getCategory(@PathVariable("category") final String category,
                              HttpServletRequest request)  {
        List<Integer> photos = new ArrayList<>();
        photos.add(1);
        photos.add(2);
        request.setAttribute("photos", photos);
        return "category";
    }

    @RequestMapping(value = {"/contacts"}, method = RequestMethod.GET)
    public String contacts()  {
        return "contacts";
    }

    @RequestMapping(value = {"/price"}, method = RequestMethod.GET)
    public String getPrice()  {
        return "price";
    }

    @RequestMapping(value = "/contacts/message", method = RequestMethod.POST)
    public String sendMessage(@RequestParam(value = "name") final String name,
                              @RequestParam(value = "email") final String email,
                              @RequestParam(value = "phone") final String phone,
                              @RequestParam(value = "text") final String text) {
        this.mandrillEmailService.sendClientMessage(text, name, email, phone);
        return "contacts";
    }



}
