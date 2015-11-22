package bizbee.service;

import com.microtripit.mandrillapp.lutung.MandrillApi;
import com.microtripit.mandrillapp.lutung.model.MandrillApiError;
import com.microtripit.mandrillapp.lutung.view.MandrillMessage;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:common-beans.xml"})
@TransactionConfiguration(defaultRollback = true)
@Transactional
public class MandrillTest {

    @Autowired
    private MandrillEmailService mandrillEmailService;



    static {
        System.setProperty("envTarget", "local");
    }

    @Test
    public void testMandrill() {
        MandrillApi mandrillApi = new MandrillApi("ZSNzhnibZMQKfxpq4ifj_g");
        MandrillMessage message = new MandrillMessage();
        message.setFromEmail("iambond@mail.ru");
        List<MandrillMessage.Recipient> toList = new ArrayList<MandrillMessage.Recipient>();
        MandrillMessage.Recipient recipient = new MandrillMessage.Recipient();
        recipient.setEmail("iambond@mail.ru"); //TODO
        recipient.setName("Eva");
        toList.add(recipient);
        message.setTo(toList);
        message.setSubject("Сообщение клиента");
        message.setHtml("<h2>Hi</h2>");
        message.setText("yo");

        try {
            mandrillApi.messages().send(message, true);
        } catch (MandrillApiError mandrillApiError) {
            mandrillApiError.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
