package bizbee.service;

import bizbee.dao.PhotoDAO;
import bizbee.model.Photo;
import bizbee.utils.SiteUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

@Service
@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.DEFAULT)
public class PhotoService {

    @Autowired
    private PhotoDAO photoDAO;

    public List<Photo> findAllPhotos() {
        return this.photoDAO.findAll();
    }

    public List<Photo> findAllByStatus(int status) {
        return photoDAO.findAllByStatus(status);
    }

    public List<Photo> findAllByStatusList(List<Integer> statuses) {
        return photoDAO.findAllByStatusList(statuses);
    }

    public Long getMaxId() {
        return this.photoDAO.getMaxId();
    }

    public void persist(Photo photo) {
        this.photoDAO.persist(photo);
    }

    public Photo getById(final long id) {
        return this.photoDAO.get(id);
    }

    public Photo findByUrl(final String url) {
        return this.photoDAO.findByUrl(url);
    }

    public List<Photo> changePhotoStatus(final String idsString, final int status) {
        List<Long> photoIdList = SiteUtils.getListOfElementsByCommaString(idsString);
        List<Photo> photos = this.findByIdList(photoIdList);

        for (Photo photo: photos) {
            photo.setStatus(status);
            this.photoDAO.update(photo);
        }
        return photos;
    }

    public List<Photo> findByIdList(final List<Long> photoIdList) {
        return this.photoDAO.findByIdList(photoIdList);
    }

    public Photo createPhoto(String url, int status) {
        Photo photo = new Photo();
        photo.setCreatedAt(new Date());
        photo.setUrl(url);
        photo.setStatus(status);
        return photo;
    }

}
