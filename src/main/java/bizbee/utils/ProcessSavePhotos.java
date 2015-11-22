package bizbee.utils;

import bizbee.model.Photo;
import bizbee.service.PhotoService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.DisposableBean;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;

public class ProcessSavePhotos extends Thread implements InitializingBean,
        DisposableBean {
    private static final Logger logger = Logger.getLogger(ProcessSavePhotos.class);
    protected boolean destroy = false;

    @Autowired
    private PhotoService photoService;

    public void afterPropertiesSet() throws Exception {
        start();
    }

    /**
     * Start the process
     */
    public void run() {
        logger.info("Start processing photos");
        int pause = 60;

        while (!destroy) {
            try {
                sleep(pause);
                if (destroy) {
                    break;
                }
                processSavePhotos();

            } catch (InterruptedException e) {
                logger.error(e);
                if (!destroy)
                    destroy = true;
                break;
            } catch (Exception e) {
                logger.error(e);
                if (!destroy)
                    destroy = true;
                break;
            }
            if (destroy)
                break;
        }
        logger.info("End processing save photos");
    }

    private void processSavePhotos() {
        try {
            String destinationDirectory = Constants.PHOTO_DIRECTORY_TO;
            File dir = new File(Constants.PHOTO_DIRECTORY_FROM);
            File[] files = dir.listFiles();
            FileInputStream inputStream;
            FileOutputStream outputStream;

            if (files != null) {
                byte[] buffer = new byte[512];
                for (File file : files) {
                    Long uniqueId = this.photoService.getMaxId() + 1;
                    inputStream = new FileInputStream(file);
                    outputStream = new FileOutputStream(destinationDirectory + uniqueId.toString() + ".jpg");
                    int rc;

                    while ((rc = inputStream.read(buffer)) != -1) {
                        outputStream.write(buffer, 0, rc);
                    }
                    outputStream.close();
                    inputStream.close();

                    Photo photo = this.photoService.createPhoto(uniqueId.toString() + ".jpg", Constants.PhotoStatus.NEW);
                    this.photoService.persist(photo);

                    if (!file.delete()) {
                        System.out.println("error"); //TODO log
                    }
                }
            }

        } catch (Exception e) {
            logger.error(e);
        }
    }







    @SuppressWarnings("deprecation")
    public void destroy() {
        interrupt();
    }
}
