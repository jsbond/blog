package bizbee.service;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;

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
    public void testSendClientMessage() {
        Assert.assertTrue(mandrillEmailService.sendClientMessage("test", "jsbond", "iambond@mail.ru", "123"));
    }
}
