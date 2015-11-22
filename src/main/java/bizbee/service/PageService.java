package bizbee.service;

import bizbee.dao.PageDAO;
import bizbee.model.Page;
import bizbee.model.Photo;
import bizbee.utils.Constants;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

@Service
@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.DEFAULT)
public class PageService {

    @Autowired
    private PageDAO pageDAO;
    @Autowired
    private PhotoService photoService;

    public List<Page> findAllPages() {
        return this.pageDAO.findAll();
    }

    public void createPage(final String id, final String name, final int category, final String photoUrl) {
        Page page = new Page();
        if (StringUtils.isNotBlank(id)) {
            page = this.pageDAO.get(Long.valueOf(id));
        }

        Photo photo = this.photoService.findByUrl(photoUrl);

        if (photo == null) {
            //TODO
        }

        page.setCategory(category);
        page.setName(name);
        page.setCreatedAt(new Date());
        page.setTitul(photo);
        page.setStatus(Constants.PageStatus.CHILD);

        this.pageDAO.merge(page);
    }

    public Page findById(final String idString) {
        return this.pageDAO.get(Long.valueOf(idString));
    }

    public void updatePagePhotos(final String photoIdString, final String pageId) {
        List<Photo> photos = this.photoService.changePhotoStatus(photoIdString, Constants.PhotoStatus.PAGE_PHOTO);
        Page page = this.findById(pageId);

        page.setPhotos(photos);
        this.pageDAO.merge(page);
    }
}
