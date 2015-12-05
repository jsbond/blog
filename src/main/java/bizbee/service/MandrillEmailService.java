package bizbee.service;

import com.microtripit.mandrillapp.lutung.MandrillApi;
import com.microtripit.mandrillapp.lutung.model.MandrillApiError;
import com.microtripit.mandrillapp.lutung.view.MandrillMessage;
import org.apache.log4j.Logger;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class MandrillEmailService {

    private static final Logger logger = Logger.getLogger("taskLogger");

    private String apiKey;
    private String ourEmail;
    private String subject;

    public void setApiKey(String apiKey) {
        this.apiKey = apiKey;
    }

    public void setOurEmail(String ourEmail) {
        this.ourEmail = ourEmail;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public boolean sendClientMessage(final String text, final String name, final String email, final String phone) {
        final MandrillApi mandrillApi = new MandrillApi(this.apiKey);
        MandrillMessage message = new MandrillMessage();
        message.setFromEmail(this.ourEmail);
        List<MandrillMessage.Recipient> toList = new ArrayList<MandrillMessage.Recipient>();
        MandrillMessage.Recipient recipient = new MandrillMessage.Recipient();
        recipient.setEmail(ourEmail);
        recipient.setName("Eva");
        toList.add(recipient);
        message.setTo(toList);
        message.setSubject(subject);

        StringBuilder sb = new StringBuilder();
        sb.append("<p>имя: ");
        if (name != null) {
            sb.append(name);
        }else {
            sb.append("-");
        }
        sb.append("<br />").

        append("mail: ");
        if (email != null) {
            sb.append(email);
        }else {
            sb.append("-");
        }
        sb.append("<br />").

        append("телефон: ");
        if (phone != null) {
            sb.append(phone);
        }else {
            sb.append("-");
        }
        sb.append("<br />").

        append("сообщение ");
        if (text != null) {
            sb.append(text);
        }else {
            sb.append("-");
        }
        sb.append("</p>");

        message.setHtml(sb.toString());

        try {
            mandrillApi.messages().send(message, true);
        } catch (MandrillApiError mandrillApiError) {
            mandrillApiError.printStackTrace();
            return false;
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }


}

